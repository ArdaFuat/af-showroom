#!/usr/bin/env node

const fs = require('node:fs/promises');
const path = require('node:path');

const ROOT_DIR = path.resolve(__dirname, '..');
const VEHICLE_DATA_PATH = path.join(ROOT_DIR, 'html', 'vehicledata.json');
const IMAGE_DIR = path.join(ROOT_DIR, 'html', 'vehicle-images');
const REPORT_PATH = path.join(ROOT_DIR, 'html', 'vehicle-images', 'sync-report.json');
const GTACARS_BASE_URL = 'https://gtacars.net';

const args = new Set(process.argv.slice(2));
const getArgValue = (name, fallback) => {
    const prefix = `${name}=`;
    const found = process.argv.slice(2).find((arg) => arg.startsWith(prefix));
    return found ? found.slice(prefix.length) : fallback;
};

const options = {
    force: args.has('--force'),
    dryRun: args.has('--dry-run'),
    remoteOnly: args.has('--remote-only'),
    delayMs: Number(getArgValue('--delay', '500')),
    limit: Number(getArgValue('--limit', '0'))
};

function sleep(ms) {
    return new Promise((resolve) => setTimeout(resolve, ms));
}

function normalizeModel(value) {
    return String(value || '').trim().toLowerCase();
}

function decodeHtml(value) {
    return String(value || '')
        .replace(/&amp;/g, '&')
        .replace(/&quot;/g, '"')
        .replace(/&#39;/g, "'")
        .replace(/&lt;/g, '<')
        .replace(/&gt;/g, '>');
}

function absoluteUrl(url) {
    if (!url) return '';
    if (/^https?:\/\//i.test(url)) return url;
    return new URL(url, GTACARS_BASE_URL).toString();
}

function extractOgImage(html) {
    const metaTags = html.match(/<meta\b[^>]*>/gi) || [];

    for (const tag of metaTags) {
        const isOgImage = /\bproperty=["']og:image["']/i.test(tag) || /\bname=["']og:image["']/i.test(tag);
        if (!isOgImage) continue;

        const content = tag.match(/\bcontent=["']([^"']+)["']/i);
        if (content && content[1]) return absoluteUrl(decodeHtml(content[1]));
    }

    return '';
}

function extensionFromContentType(contentType) {
    const value = String(contentType || '').toLowerCase();
    if (value.includes('png')) return '.png';
    if (value.includes('webp')) return '.webp';
    if (value.includes('jpeg') || value.includes('jpg')) return '.jpg';
    return '.jpg';
}

function isLocalGtacarsImage(image, model) {
    return String(image || '').replace(/\\/g, '/').includes(`vehicle-images/${model}.`);
}

async function fetchText(url) {
    const response = await fetch(url, {
        headers: {
            'user-agent': 'af-showroom-image-sync/1.0 (+https://github.com/ArdaFuat/af-showroom)'
        }
    });

    if (!response.ok) {
        throw new Error(`HTTP ${response.status}`);
    }

    return response.text();
}

async function downloadImage(url, model) {
    const response = await fetch(url, {
        headers: {
            'user-agent': 'af-showroom-image-sync/1.0 (+https://github.com/ArdaFuat/af-showroom)',
            accept: 'image/avif,image/webp,image/png,image/jpeg,image/*,*/*;q=0.8'
        }
    });

    if (!response.ok) {
        throw new Error(`image HTTP ${response.status}`);
    }

    const contentType = response.headers.get('content-type') || '';
    if (!contentType.toLowerCase().startsWith('image/')) {
        throw new Error(`unexpected image content-type: ${contentType || 'unknown'}`);
    }

    const extension = extensionFromContentType(contentType);
    const fileName = `${model}${extension}`;
    const filePath = path.join(IMAGE_DIR, fileName);
    const buffer = Buffer.from(await response.arrayBuffer());

    if (!options.dryRun) {
        await fs.mkdir(IMAGE_DIR, { recursive: true });
        await fs.writeFile(filePath, buffer);
    }

    return {
        relativePath: `vehicle-images/${fileName}`,
        filePath,
        contentType,
        bytes: buffer.length
    };
}

async function syncVehicle(vehicle) {
    const model = normalizeModel(vehicle.spawncode || vehicle.model);
    if (!model) {
        return { status: 'skipped', reason: 'missing spawncode/model', vehicle: vehicle.name || '-' };
    }

    if (!options.force && vehicle.image && !isLocalGtacarsImage(vehicle.image, model)) {
        return { status: 'skipped', reason: 'image already set', model, vehicle: vehicle.name || model };
    }

    const vehicleUrl = `${GTACARS_BASE_URL}/gta5/${encodeURIComponent(model)}`;
    const html = await fetchText(vehicleUrl);
    const gtacarsImageUrl = extractOgImage(html);

    if (!gtacarsImageUrl) {
        return { status: 'missing', reason: 'og:image not found', model, vehicle: vehicle.name || model, vehicleUrl };
    }

    let imageValue = gtacarsImageUrl;
    let download = null;

    if (!options.remoteOnly) {
        download = await downloadImage(gtacarsImageUrl, model);
        imageValue = download.relativePath;
    }

    if (!options.dryRun) {
        vehicle.image = imageValue;
        vehicle.imageSource = 'gtacars';
        vehicle.gtacarsUrl = vehicleUrl;
        vehicle.gtacarsImageUrl = gtacarsImageUrl;
    }

    return {
        status: 'synced',
        model,
        vehicle: vehicle.name || model,
        image: imageValue,
        gtacarsImageUrl,
        bytes: download ? download.bytes : undefined
    };
}

async function main() {
    const raw = await fs.readFile(VEHICLE_DATA_PATH, 'utf8');
    const vehicles = JSON.parse(raw);

    if (!Array.isArray(vehicles)) {
        throw new Error('vehicledata.json must contain an array');
    }

    const candidates = options.limit > 0 ? vehicles.slice(0, options.limit) : vehicles;
    const results = [];

    console.log(`[gtacars] ${options.dryRun ? 'dry run: ' : ''}checking ${candidates.length} vehicles`);
    console.log(`[gtacars] mode: ${options.force ? 'force' : 'missing-only'}, storage: ${options.remoteOnly ? 'remote-url' : 'local-download'}`);

    for (const vehicle of candidates) {
        try {
            const result = await syncVehicle(vehicle);
            results.push(result);

            const label = result.model ? `${result.vehicle} (${result.model})` : result.vehicle;
            console.log(`[gtacars] ${result.status}: ${label}${result.reason ? ` - ${result.reason}` : ''}`);
        } catch (error) {
            const model = normalizeModel(vehicle.spawncode || vehicle.model);
            const result = {
                status: 'error',
                model,
                vehicle: vehicle.name || model || '-',
                reason: error.message
            };
            results.push(result);
            console.log(`[gtacars] error: ${result.vehicle} (${result.model}) - ${result.reason}`);
        }

        if (options.delayMs > 0) {
            await sleep(options.delayMs);
        }
    }

    const summary = results.reduce((acc, result) => {
        acc[result.status] = (acc[result.status] || 0) + 1;
        return acc;
    }, {});

    const report = {
        generatedAt: new Date().toISOString(),
        options,
        summary,
        results
    };

    if (!options.dryRun) {
        await fs.mkdir(IMAGE_DIR, { recursive: true });
        await fs.writeFile(VEHICLE_DATA_PATH, `${JSON.stringify(vehicles, null, 2)}\n`, 'utf8');
        await fs.writeFile(REPORT_PATH, `${JSON.stringify(report, null, 2)}\n`, 'utf8');
    }

    console.log(`[gtacars] done: ${JSON.stringify(summary)}`);
    if (!options.dryRun) {
        console.log(`[gtacars] report: ${path.relative(ROOT_DIR, REPORT_PATH)}`);
    }
}

main().catch((error) => {
    console.error(`[gtacars] failed: ${error.message}`);
    process.exitCode = 1;
});
