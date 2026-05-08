Config = {}

Config.Debug = false

-- Sadece target ile çalışır. Marker / E tuşu / turuncu işaret yoktur.
Config.TargetResource = 'qb-target'

Config.Showroom = {
    ped = {
        enabled = true,
        model = 'a_m_y_business_03',
        coords = vector4(-1252.7423, -348.6517, 36.9076, 118.2046),
        scenario = 'WORLD_HUMAN_CLIPBOARD'
    },

    blip = {
        enabled = true,
        sprite = 225,
        color = 47,
        scale = 0.75,
        label = 'Mandalina Showroom'
    },

    target = {
        icon = 'fas fa-car',
        label = 'Araç Kataloğunu Aç',
        distance = 2.0
    }
}

-- Burasi senin showroom/galeri listendir.
-- Menüde SADECE buradaki araçlar görünür.
-- html/vehicledata.json sadece bu araçlara görsel/açıklama/performans bilgisi eklemek için kullanılır.
Config.Vehicles = {
    -- Kompakt
    {
        model = 'blista',
        brand = 'Dinka',
        name = 'Blista',
        category = 'Kompakt',
        price = 18000,
        stock = 3
    },
    {
        model = 'asbo',
        brand = 'Maxwell',
        name = 'Asbo',
        category = 'Kompakt',
        price = 22000,
        stock = 2
    },
    {
        model = 'panto',
        brand = 'Benefactor',
        name = 'Panto',
        category = 'Kompakt',
        price = 12000,
        stock = 4
    },
    {
        model = 'issi2',
        brand = 'Weeny',
        name = 'Issi',
        category = 'Kompakt',
        price = 16000,
        stock = 3
    },
    {
        model = 'prairie',
        brand = 'Bollokan',
        name = 'Prairie',
        category = 'Kompakt',
        price = 30000,
        stock = 2
    },
    {
        model = 'rhapsody',
        brand = 'Declasse',
        name = 'Rhapsody',
        category = 'Kompakt',
        price = 10000,
        stock = 2
    },
    {
        model = 'dilettante',
        brand = 'Karin',
        name = 'Dilettante',
        category = 'Kompakt',
        price = 9000,
        stock = 3
    },
    {
        model = 'brioso',
        brand = 'Grotti',
        name = 'Brioso R/A',
        category = 'Kompakt',
        price = 20000,
        stock = 2
    },

    -- Coupe
    {
        model = 'felon',
        brand = 'Lampadati',
        name = 'Felon',
        category = 'Coupe',
        price = 31000,
        stock = 2
    },
    {
        model = 'felon2',
        brand = 'Lampadati',
        name = 'Felon GT',
        category = 'Coupe',
        price = 37000,
        stock = 1
    },
    {
        model = 'jackal',
        brand = 'Ocelot',
        name = 'Jackal',
        category = 'Coupe',
        price = 29000,
        stock = 2
    },
    {
        model = 'oracle2',
        brand = 'Übermacht',
        name = 'Oracle XS',
        category = 'Coupe',
        price = 35000,
        stock = 2
    },
    {
        model = 'zion',
        brand = 'Übermacht',
        name = 'Zion',
        category = 'Coupe',
        price = 32000,
        stock = 2
    },
    {
        model = 'zion2',
        brand = 'Übermacht',
        name = 'Zion Cabrio',
        category = 'Coupe',
        price = 36000,
        stock = 1
    },
    {
        model = 'exemplar',
        brand = 'Dewbauchee',
        name = 'Exemplar',
        category = 'Coupe',
        price = 40000,
        stock = 1
    },

    -- Sedan
    {
        model = 'tailgater',
        brand = 'Obey',
        name = 'Tailgater',
        category = 'Sedan',
        price = 45000,
        stock = 2
    },
    {
        model = 'schafter2',
        brand = 'Benefactor',
        name = 'Schafter',
        category = 'Sedan',
        price = 65000,
        stock = 3
    },
    {
        model = 'fugitive',
        brand = 'Cheval',
        name = 'Fugitive',
        category = 'Sedan',
        price = 30000,
        stock = 3
    },
    {
        model = 'stanier',
        brand = 'Vapid',
        name = 'Stanier',
        category = 'Sedan',
        price = 25000,
        stock = 4
    },
    {
        model = 'superd',
        brand = 'Enus',
        name = 'Super Diamond',
        category = 'Sedan',
        price = 70000,
        stock = 1
    },
    {
        model = 'warrener',
        brand = 'Vulcar',
        name = 'Warrener',
        category = 'Sedan',
        price = 22000,
        stock = 2
    },
    {
        model = 'primo',
        brand = 'Albany',
        name = 'Primo',
        category = 'Sedan',
        price = 18000,
        stock = 3
    },
    {
        model = 'premier',
        brand = 'Declasse',
        name = 'Premier',
        category = 'Sedan',
        price = 20000,
        stock = 3
    },

    -- Spor
    {
        model = 'sultan',
        brand = 'Karin',
        name = 'Sultan',
        category = 'Spor',
        price = 85000,
        stock = 2
    },
    {
        model = 'comet2',
        brand = 'Pfister',
        name = 'Comet',
        category = 'Spor',
        price = 145000,
        stock = 1
    },
    {
        model = 'elegy2',
        brand = 'Annis',
        name = 'Elegy RH8',
        category = 'Spor',
        price = 150000,
        stock = 1
    },
    {
        model = 'feltzer2',
        brand = 'Benefactor',
        name = 'Feltzer',
        category = 'Spor',
        price = 97000,
        stock = 2
    },
    {
        model = 'seven70',
        brand = 'Dewbauchee',
        name = 'Seven-70',
        category = 'Spor',
        price = 140000,
        stock = 1
    },
    {
        model = 'specter',
        brand = 'Dewbauchee',
        name = 'Specter',
        category = 'Spor',
        price = 160000,
        stock = 1
    },
    {
        model = 'jester',
        brand = 'Dinka',
        name = 'Jester',
        category = 'Spor',
        price = 130000,
        stock = 1
    },
    {
        model = 'carbonizzare',
        brand = 'Grotti',
        name = 'Carbonizzare',
        category = 'Spor',
        price = 155000,
        stock = 1
    },
    {
        model = 'banshee',
        brand = 'Bravado',
        name = 'Banshee',
        category = 'Spor',
        price = 120000,
        stock = 1
    },
    {
        model = 'kuruma',
        brand = 'Karin',
        name = 'Kuruma',
        category = 'Spor',
        price = 72000,
        stock = 2
    },
    {
        model = 'penumbra',
        brand = 'Maibatsu',
        name = 'Penumbra',
        category = 'Spor',
        price = 52000,
        stock = 2
    },

    -- SUV
    {
        model = 'baller2',
        brand = 'Gallivanter',
        name = 'Baller 2',
        category = 'SUV',
        price = 90000,
        stock = 2
    },
    {
        model = 'dubsta',
        brand = 'Benefactor',
        name = 'Dubsta',
        category = 'SUV',
        price = 110000,
        stock = 1
    },
    {
        model = 'granger',
        brand = 'Declasse',
        name = 'Granger',
        category = 'SUV',
        price = 65000,
        stock = 2
    },
    {
        model = 'gresley',
        brand = 'Bravado',
        name = 'Gresley',
        category = 'SUV',
        price = 60000,
        stock = 2
    },
    {
        model = 'huntley',
        brand = 'Enus',
        name = 'Huntley S',
        category = 'SUV',
        price = 95000,
        stock = 1
    },
    {
        model = 'landstalker',
        brand = 'Dundreary',
        name = 'Landstalker',
        category = 'SUV',
        price = 55000,
        stock = 2
    },
    {
        model = 'cavalcade',
        brand = 'Albany',
        name = 'Cavalcade',
        category = 'SUV',
        price = 48000,
        stock = 2
    },
    {
        model = 'toros',
        brand = 'Pegassi',
        name = 'Toros',
        category = 'SUV',
        price = 135000,
        stock = 1
    },

    -- Muscle
    {
        model = 'dominator',
        brand = 'Vapid',
        name = 'Dominator',
        category = 'Muscle',
        price = 62500,
        stock = 2
    },
    {
        model = 'dukes',
        brand = 'Imponte',
        name = 'Dukes',
        category = 'Muscle',
        price = 45000,
        stock = 2
    },
    {
        model = 'blade',
        brand = 'Vapid',
        name = 'Blade',
        category = 'Muscle',
        price = 38000,
        stock = 2
    },
    {
        model = 'voodoo',
        brand = 'Declasse',
        name = 'Voodoo',
        category = 'Muscle',
        price = 30000,
        stock = 2
    },
    {
        model = 'phoenix',
        brand = 'Imponte',
        name = 'Phoenix',
        category = 'Muscle',
        price = 65000,
        stock = 1
    },
    {
        model = 'gauntlet',
        brand = 'Bravado',
        name = 'Gauntlet',
        category = 'Muscle',
        price = 58000,
        stock = 2
    },
    {
        model = 'sabregt',
        brand = 'Declasse',
        name = 'Sabre Turbo',
        category = 'Muscle',
        price = 54000,
        stock = 2
    },

    -- Offroad
    {
        model = 'brawler',
        brand = 'Coil',
        name = 'Brawler',
        category = 'Offroad',
        price = 80000,
        stock = 1
    },
    {
        model = 'caracara2',
        brand = 'Vapid',
        name = 'Caracara 4x4',
        category = 'Offroad',
        price = 95000,
        stock = 1
    },
    {
        model = 'draugur',
        brand = 'Declasse',
        name = 'Draugur',
        category = 'Offroad',
        price = 120000,
        stock = 1
    },
    {
        model = 'riata',
        brand = 'Vapid',
        name = 'Riata',
        category = 'Offroad',
        price = 70000,
        stock = 2
    },
    {
        model = 'sandking',
        brand = 'Vapid',
        name = 'Sandking XL',
        category = 'Offroad',
        price = 65000,
        stock = 2
    },
    {
        model = 'kamacho',
        brand = 'Canis',
        name = 'Kamacho',
        category = 'Offroad',
        price = 82000,
        stock = 1
    },
    {
        model = 'rebel2',
        brand = 'Karin',
        name = 'Rebel',
        category = 'Offroad',
        price = 35000,
        stock = 2
    },

    -- Super
    {
        model = 'adder',
        brand = 'Truffade',
        name = 'Adder',
        category = 'Super',
        price = 280000,
        stock = 1
    },
    {
        model = 'cheetah',
        brand = 'Grotti',
        name = 'Cheetah',
        category = 'Super',
        price = 214000,
        stock = 1
    },
    {
        model = 'fmj',
        brand = 'Vapid',
        name = 'FMJ',
        category = 'Super',
        price = 300000,
        stock = 1
    },
    {
        model = 'ignus',
        brand = 'Pegassi',
        name = 'Ignus',
        category = 'Super',
        price = 420000,
        stock = 1
    },
    {
        model = 'zentorno',
        brand = 'Pegassi',
        name = 'Zentorno',
        category = 'Super',
        price = 340000,
        stock = 1
    },
    {
        model = 'turismor',
        brand = 'Grotti',
        name = 'Turismo R',
        category = 'Super',
        price = 300000,
        stock = 1
    },
    {
        model = 'infernus',
        brand = 'Pegassi',
        name = 'Infernus',
        category = 'Super',
        price = 235000,
        stock = 1
    },
    {
        model = 'entityxf',
        brand = 'Överflöd',
        name = 'Entity XF',
        category = 'Super',
        price = 270000,
        stock = 1
    },

    -- Motosiklet
    {
        model = 'bati',
        brand = 'Pegassi',
        name = 'Bati 801',
        category = 'Motosiklet',
        price = 35000,
        stock = 5
    },
    {
        model = 'hakuchou',
        brand = 'Shitzu',
        name = 'Hakuchou',
        category = 'Motosiklet',
        price = 65000,
        stock = 2
    },
    {
        model = 'akuma',
        brand = 'Dinka',
        name = 'Akuma',
        category = 'Motosiklet',
        price = 55000,
        stock = 3
    },
    {
        model = 'gargoyle',
        brand = 'Western',
        name = 'Gargoyle',
        category = 'Motosiklet',
        price = 32000,
        stock = 2
    },
    {
        model = 'lectro',
        brand = 'Principe',
        name = 'Lectro',
        category = 'Motosiklet',
        price = 28000,
        stock = 2
    },
    {
        model = 'sanchez',
        brand = 'Maibatsu',
        name = 'Sanchez',
        category = 'Motosiklet',
        price = 18000,
        stock = 4
    },
    {
        model = 'pcj',
        brand = 'Shitzu',
        name = 'PCJ 600',
        category = 'Motosiklet',
        price = 24000,
        stock = 3
    },

    -- Van
    {
        model = 'burrito3',
        brand = 'Declasse',
        name = 'Burrito',
        category = 'Van',
        price = 25000,
        stock = 3
    },
    {
        model = 'minivan',
        brand = 'Vapid',
        name = 'Minivan',
        category = 'Van',
        price = 22000,
        stock = 3
    },
    {
        model = 'rumpo',
        brand = 'Bravado',
        name = 'Rumpo',
        category = 'Van',
        price = 28000,
        stock = 3
    },
    {
        model = 'speedo',
        brand = 'Vapid',
        name = 'Speedo',
        category = 'Van',
        price = 30000,
        stock = 2
    },
    {
        model = 'surfer',
        brand = 'BF',
        name = 'Surfer',
        category = 'Van',
        price = 18000,
        stock = 2
    },
    {
        model = 'youga',
        brand = 'Bravado',
        name = 'Youga',
        category = 'Van',
        price = 26000,
        stock = 2
    },
    {
        model = 'moonbeam',
        brand = 'Declasse',
        name = 'Moonbeam',
        category = 'Van',
        price = 32000,
        stock = 2
    }
}