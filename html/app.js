const app = document.getElementById('app');
const categoryList = document.getElementById('categoryList');
const vehicleGrid = document.getElementById('vehicleGrid');
const searchInput = document.getElementById('searchInput');
const closeBtn = document.getElementById('closeBtn');
const activeTitle = document.getElementById('activeTitle');
const vehicleCount = document.getElementById('vehicleCount');

const detailPanel = document.getElementById('detailPanel');
const detailCloseBtn = document.getElementById('detailCloseBtn');
const detailImage = document.getElementById('detailImage');
const detailBrandLogo = document.getElementById('detailBrandLogo');
const detailBrand = document.getElementById('detailBrand');
const detailName = document.getElementById('detailName');
const detailDescription = document.getElementById('detailDescription');
const detailPrice = document.getElementById('detailPrice');
const detailStock = document.getElementById('detailStock');
const detailCategory = document.getElementById('detailCategory');
const detailSpawncode = document.getElementById('detailSpawncode');
const detailTrunk = document.getElementById('detailTrunk');
const detailType = document.getElementById('detailType');
const detailSeats = document.getElementById('detailSeats');
const detailDrivetrain = document.getElementById('detailDrivetrain');
const detailTopSpeed = document.getElementById('detailTopSpeed');
const detailMass = document.getElementById('detailMass');
const detailDimensions = document.getElementById('detailDimensions');
const detailLapTime = document.getElementById('detailLapTime');
const detailRaceTier = document.getElementById('detailRaceTier');
const performanceList = document.getElementById('performanceList');

let vehicles = [];
let categories = [];
let activeCategory = 'all';
let searchTerm = '';
let locale = {};
let localeCode = 'en';

function t(key, fallback = key) {
    return locale[key] || fallback;
}

function tf(key, value, fallback = key) {
    return t(key, fallback).replace('%s', value);
}

function translateCategory(category) {
    if (!category) return '-';
    return t(`category_${category}`, category);
}

function applyStaticLocale() {
    document.documentElement.lang = localeCode || 'en';
    document.title = t('showroom_name', 'ArdaFuat Showroom');

    document.querySelectorAll('[data-locale]').forEach((element) => {
        const key = element.dataset.locale;
        element.textContent = t(key, element.textContent);
    });

    searchInput.placeholder = t('ui_search_placeholder', 'Search vehicle, brand or model...');
    detailImage.alt = t('ui_vehicle_image_alt', 'Vehicle image');
    detailBrandLogo.alt = t('ui_brand_logo_alt', 'Brand logo');
}

function nuiPost(name, data = {}) {
    fetch(`https://${GetParentResourceName()}/${name}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify(data)
    }).catch(() => {});
}

function setCatalogData(data = {}) {
    vehicles = Array.isArray(data.vehicles) ? data.vehicles : [];
    locale = data.locale || {};
    localeCode = data.localeCode || 'en';

    categories = [...new Set(vehicles.map((vehicle) => vehicle.category).filter(Boolean))]
        .sort((a, b) => translateCategory(a).localeCompare(translateCategory(b), localeCode));

    applyStaticLocale();
}

function safeText(value, fallback = '-') {
    if (value === undefined || value === null || value === '') return fallback;
    return String(value);
}

function normalize(value) {
    return safeText(value, '').toLocaleLowerCase(localeCode === 'tr' ? 'tr-TR' : 'en-US');
}

function getFilteredVehicles() {
    return vehicles.filter((vehicle) => {
        const matchesCategory = activeCategory === 'all' || vehicle.category === activeCategory;
        const searchPool = [
            vehicle.name,
            vehicle.brand,
            vehicle.category,
            translateCategory(vehicle.category),
            vehicle.spawncode,
            vehicle.model,
            vehicle.price,
            vehicle.trunkspace
        ].map((item) => normalize(item)).join(' ');

        return matchesCategory && searchPool.includes(normalize(searchTerm));
    });
}

function countByCategory(category) {
    if (category === 'all') return vehicles.length;
    return vehicles.filter((vehicle) => vehicle.category === category).length;
}

function renderCategories() {
    const categoryData = ['all', ...categories];

    categoryList.innerHTML = categoryData.map((category) => {
        const activeClass = category === activeCategory ? 'active' : '';
        const label = category === 'all' ? t('ui_all_vehicles', 'All Vehicles') : translateCategory(category);

        return `
            <button class="category-item ${activeClass}" data-category="${category}">
                <span>${label}</span>
                <span class="category-count">${countByCategory(category)}</span>
            </button>
        `;
    }).join('');

    document.querySelectorAll('.category-item').forEach((button) => {
        button.addEventListener('click', () => {
            activeCategory = button.dataset.category;
            closeDetail();
            render();
        });
    });
}

function stockText(stock) {
    const value = Number(stock || 0);
    if (value <= 0) return t('ui_no_stock', 'Out of stock');
    return tf('ui_stock_unit', value, '%s available');
}

function stockClass(stock) {
    const value = Number(stock || 0);
    if (value <= 0) return 'none';
    if (value <= 1) return 'low';
    return 'available';
}

function getVehicleImage(vehicle) {
    const vehicleName = safeText(vehicle.name, t('ui_vehicle_image_alt', 'Vehicle'));
    const brandLetter = safeText(vehicle.brand, 'A').charAt(0);

    if (vehicle.image && String(vehicle.image).trim() !== '') {
        return `<img src="${vehicle.image}" alt="${vehicleName}" onerror="this.parentElement.innerHTML='<span>${brandLetter}</span>'" />`;
    }

    return `<span>${brandLetter}</span>`;
}

function renderVehicles() {
    const filtered = getFilteredVehicles();
    activeTitle.textContent = activeCategory === 'all' ? t('ui_all_vehicles', 'All Vehicles') : translateCategory(activeCategory);
    vehicleCount.textContent = tf('ui_vehicle_count', filtered.length, '%s vehicles listed');

    if (filtered.length === 0) {
        vehicleGrid.innerHTML = `
            <div class="empty-state">
                <strong>${t('ui_no_vehicles_title', 'No vehicles found')}</strong>
                <span>${t('ui_no_vehicles_desc', 'Change the search term or category filter.')}</span>
            </div>
        `;
        return;
    }

    vehicleGrid.innerHTML = filtered.map((vehicle) => `
        <article class="vehicle-card" data-index="${vehicles.indexOf(vehicle)}">
            <div class="vehicle-image">${getVehicleImage(vehicle)}</div>
            <div class="vehicle-brand">${safeText(vehicle.brand, t('ui_unknown', 'Unknown'))}</div>
            <div class="vehicle-name">${safeText(vehicle.name, vehicle.spawncode)}</div>
            <p class="vehicle-desc">${safeText(vehicle.description, t('ui_no_description', 'No description available for this vehicle.'))}</p>
            <div class="vehicle-footer">
                <div>
                    <div class="price">${safeText(vehicle.price)}</div>
                    <div class="model-code">${safeText(vehicle.spawncode || vehicle.model)}</div>
                </div>
                <div class="stock ${stockClass(vehicle.stock)}">${stockText(vehicle.stock)}</div>
            </div>
        </article>
    `).join('');

    document.querySelectorAll('.vehicle-card').forEach((card) => {
        card.addEventListener('click', () => {
            const vehicle = vehicles[Number(card.dataset.index)];
            openDetail(vehicle);
        });
    });
}

function render() {
    renderCategories();
    renderVehicles();
}

function openCatalog(data) {
    setCatalogData(data);
    activeCategory = 'all';
    searchTerm = '';
    searchInput.value = '';
    closeDetail();
    app.classList.remove('hidden');
    render();
    setTimeout(() => searchInput.focus(), 50);
}

function closeCatalog() {
    closeDetail();
    app.classList.add('hidden');
}

function closeDetail() {
    detailPanel.classList.add('hidden');
}

function perfLabel(key) {
    const labels = {
        power: t('perf_power', 'Power'),
        acceleration: t('perf_acceleration', 'Acceleration'),
        handling: t('perf_handling', 'Handling'),
        braking: t('perf_braking', 'Braking'),
        topspeed: t('perf_topspeed', 'Top Speed')
    };
    return labels[key] || key;
}

function openDetail(vehicle) {
    if (!vehicle) return;

    const image = safeText(vehicle.image, '');
    if (image) {
        detailImage.src = image;
        detailImage.classList.remove('hidden');
    } else {
        detailImage.removeAttribute('src');
        detailImage.classList.add('hidden');
    }

    const logo = safeText(vehicle.brandLogo, '');
    if (logo) {
        detailBrandLogo.src = logo;
        detailBrandLogo.classList.remove('hidden');
    } else {
        detailBrandLogo.classList.add('hidden');
    }

    detailBrand.textContent = safeText(vehicle.brand, t('ui_unknown', 'Unknown'));
    detailName.textContent = safeText(vehicle.name, vehicle.spawncode);
    detailDescription.textContent = safeText(vehicle.description, t('ui_no_description', 'No description available for this vehicle.'));
    detailPrice.textContent = safeText(vehicle.price);
    detailStock.textContent = stockText(vehicle.stock);
    detailCategory.textContent = translateCategory(vehicle.category);
    detailSpawncode.textContent = safeText(vehicle.spawncode || vehicle.model);
    detailTrunk.textContent = safeText(vehicle.trunkspace);
    detailType.textContent = safeText(vehicle.type);
    detailSeats.textContent = safeText(vehicle.seatsText || vehicle.seats);
    detailDrivetrain.textContent = safeText(vehicle.drivetrain);
    detailTopSpeed.textContent = safeText(vehicle.topSpeed);
    detailMass.textContent = safeText(vehicle.mass);
    detailDimensions.textContent = safeText(vehicle.dimensions);
    detailLapTime.textContent = safeText(vehicle.lapTime);
    detailRaceTier.textContent = safeText(vehicle.raceTier);

    const performance = vehicle.performance || {};
    performanceList.innerHTML = ['power', 'acceleration', 'handling', 'braking', 'topspeed'].map((key) => {
        const value = Number(performance[key] || 0);
        const width = Math.max(0, Math.min(100, value));

        return `
            <div class="perf-row">
                <div class="perf-head">
                    <span>${perfLabel(key)}</span>
                    <strong>${width}/100</strong>
                </div>
                <div class="perf-bar"><div style="width:${width}%"></div></div>
            </div>
        `;
    }).join('');

    detailPanel.classList.remove('hidden');
}

searchInput.addEventListener('input', (event) => {
    searchTerm = event.target.value || '';
    closeDetail();
    renderVehicles();
});

closeBtn.addEventListener('click', () => nuiPost('close'));
detailCloseBtn.addEventListener('click', closeDetail);

detailPanel.addEventListener('click', (event) => {
    if (event.target === detailPanel) closeDetail();
});

document.addEventListener('keydown', (event) => {
    if (event.key === 'Escape') {
        if (!detailPanel.classList.contains('hidden')) {
            closeDetail();
            return;
        }
        nuiPost('close');
    }
});

window.addEventListener('message', (event) => {
    const payload = event.data || {};

    if (payload.action === 'open') openCatalog(payload.data || {});
    if (payload.action === 'close') closeCatalog();
});
