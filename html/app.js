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
const performanceList = document.getElementById('performanceList');

let vehicles = [];
let categories = [];
let activeCategory = 'all';
let searchTerm = '';

function nuiPost(name, data = {}) {
    fetch(`https://${GetParentResourceName()}/${name}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify(data)
    }).catch(() => {});
}

function setCatalogData(data = {}) {
    vehicles = Array.isArray(data.vehicles) ? data.vehicles : [];
    categories = [...new Set(vehicles.map((vehicle) => vehicle.category).filter(Boolean))]
        .sort((a, b) => a.localeCompare(b, 'tr'));
}

function safeText(value, fallback = '-') {
    if (value === undefined || value === null || value === '') return fallback;
    return String(value);
}

function normalize(value) {
    return safeText(value, '').toLocaleLowerCase('tr-TR');
}

function getFilteredVehicles() {
    return vehicles.filter((vehicle) => {
        const matchesCategory = activeCategory === 'all' || vehicle.category === activeCategory;
        const searchPool = [
            vehicle.name,
            vehicle.brand,
            vehicle.category,
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
        const label = category === 'all' ? 'Tüm Araçlar' : category;

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
    if (value <= 0) return 'Stok yok';
    return `${value} adet`;
}

function stockClass(stock) {
    const value = Number(stock || 0);
    if (value <= 0) return 'none';
    if (value <= 1) return 'low';
    return 'available';
}

function getVehicleImage(vehicle) {
    if (vehicle.image && String(vehicle.image).trim() !== '') {
        return `<img src="${vehicle.image}" alt="${safeText(vehicle.name, 'Araç')}" onerror="this.parentElement.innerHTML='<span>${safeText(vehicle.brand, 'M').charAt(0)}</span>'" />`;
    }

    return `<span>${safeText(vehicle.brand, 'M').charAt(0)}</span>`;
}

function renderVehicles() {
    const filtered = getFilteredVehicles();
    activeTitle.textContent = activeCategory === 'all' ? 'Tüm Araçlar' : activeCategory;
    vehicleCount.textContent = `${filtered.length} araç listeleniyor`;

    if (filtered.length === 0) {
        vehicleGrid.innerHTML = `
            <div class="empty-state">
                <strong>Araç bulunamadı</strong>
                <span>Arama veya kategori filtresini değiştir.</span>
            </div>
        `;
        return;
    }

    vehicleGrid.innerHTML = filtered.map((vehicle, index) => `
        <article class="vehicle-card" data-index="${vehicles.indexOf(vehicle)}">
            <div class="vehicle-image">${getVehicleImage(vehicle)}</div>
            <div class="vehicle-brand">${safeText(vehicle.brand, 'Bilinmiyor')}</div>
            <div class="vehicle-name">${safeText(vehicle.name, vehicle.spawncode)}</div>
            <p class="vehicle-desc">${safeText(vehicle.description, 'Bu araç için açıklama bulunamadı.')}</p>
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
        power: 'Güç',
        acceleration: 'Hızlanma',
        handling: 'Yol Tutuşu',
        topspeed: 'Son Hız'
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

    detailBrand.textContent = safeText(vehicle.brand, 'Bilinmiyor');
    detailName.textContent = safeText(vehicle.name, vehicle.spawncode);
    detailDescription.textContent = safeText(vehicle.description, 'Bu araç için açıklama bulunamadı.');
    detailPrice.textContent = safeText(vehicle.price);
    detailStock.textContent = stockText(vehicle.stock);
    detailCategory.textContent = safeText(vehicle.category);
    detailSpawncode.textContent = safeText(vehicle.spawncode || vehicle.model);
    detailTrunk.textContent = safeText(vehicle.trunkspace);

    const performance = vehicle.performance || {};
    performanceList.innerHTML = ['power', 'acceleration', 'handling', 'topspeed'].map((key) => {
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
