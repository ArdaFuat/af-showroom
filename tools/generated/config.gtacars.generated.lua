Config = {}

Config.Debug = false

-- Current resource version.
-- Keep this value in sync with fxmanifest.lua and version.json when releasing a new update.
Config.Version = '1.1.0'

-- Language setting.
-- Available locales: 'tr', 'en'
Config.Locale = 'tr'

-- GitHub update checker.
-- This checks the latest public version from GitHub when the resource starts.
Config.UpdateChecker = {
    enabled = true,
    url = 'https://raw.githubusercontent.com/ArdaFuat/af-showroom/main/version.json',
    repository = 'https://github.com/ArdaFuat/af-showroom'
}

-- Target only system. No marker / E key text / orange checkpoint.
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
        scale = 0.75
    },

    target = {
        icon = 'fas fa-car',
        distance = 2.0
    }
}

-- This is your showroom/dealership catalog list.
-- ONLY vehicles listed here will be displayed in the menu.
-- html/vehicledata.json only adds image/description/performance data to these vehicles.
Config.Vehicles = {
    -- Supers
    {
        model = 'adder',
        brand = 'Truffade',
        name = 'Adder',
        category = 'Supers',
        price = 280000,
        stock = 1
    },
    {
        model = 'autarch',
        brand = 'Overflod',
        name = 'Autarch',
        category = 'Supers',
        price = 1955000,
        stock = 1
    },
    {
        model = 'banshee2',
        brand = 'Bravado',
        name = 'Banshee 900R',
        category = 'Supers',
        price = 565000,
        stock = 1
    },
    {
        model = 'bullet',
        brand = 'Vapid',
        name = 'Bullet',
        category = 'Supers',
        price = 155000,
        stock = 1
    },
    {
        model = 'champion',
        brand = 'Dewbauchee',
        name = 'Champion',
        category = 'Supers',
        price = 3750000,
        stock = 1
    },
    {
        model = 'cheetah',
        brand = 'Grotti',
        name = 'Cheetah',
        category = 'Supers',
        price = 214000,
        stock = 1
    },
    {
        model = 'cyclone',
        brand = 'Coil',
        name = 'Cyclone',
        category = 'Supers',
        price = 1890000,
        stock = 1
    },
    {
        model = 'cyclone2',
        brand = 'Coil',
        name = 'Cyclone II',
        category = 'Supers',
        price = 2250000,
        stock = 1
    },
    {
        model = 'cyclone2_hsw',
        brand = 'Coil',
        name = 'Cyclone II',
        category = 'Supers',
        price = 475000,
        stock = 1
    },
    {
        model = 'deveste',
        brand = 'Principe',
        name = 'Deveste Eight',
        category = 'Supers',
        price = 1795000,
        stock = 1
    },
    {
        model = 'deveste_hsw',
        brand = 'Principe',
        name = 'Deveste Eight',
        category = 'Supers',
        price = 1110000,
        stock = 1
    },
    {
        model = 'emerus',
        brand = 'Progen',
        name = 'Emerus',
        category = 'Supers',
        price = 2750000,
        stock = 1
    },
    {
        model = 'entity2',
        brand = 'Overflod',
        name = 'Entity XXR',
        category = 'Supers',
        price = 2305000,
        stock = 1
    },
    {
        model = 'entity3',
        brand = 'Overflod',
        name = 'Entity MT',
        category = 'Supers',
        price = 2355000,
        stock = 1
    },
    {
        model = 'entity3_hsw',
        brand = 'Overflod',
        name = 'Entity MT',
        category = 'Supers',
        price = 850000,
        stock = 1
    },
    {
        model = 'entityxf',
        brand = 'Overflod',
        name = 'Entity XF',
        category = 'Supers',
        price = 270000,
        stock = 1
    },
    {
        model = 'fmj',
        brand = 'Vapid',
        name = 'FMJ',
        category = 'Supers',
        price = 300000,
        stock = 1
    },
    {
        model = 'fmj2',
        brand = 'Vapid',
        name = 'FMJ MK V',
        category = 'Supers',
        price = 2965000,
        stock = 1
    },
    {
        model = 'fmj2_hsw',
        brand = 'Vapid',
        name = 'FMJ MK V',
        category = 'Supers',
        price = 1950000,
        stock = 1
    },
    {
        model = 'furia',
        brand = 'Grotti',
        name = 'Furia',
        category = 'Supers',
        price = 2740000,
        stock = 1
    },
    {
        model = 'gp1',
        brand = 'Progen',
        name = 'GP1',
        category = 'Supers',
        price = 1260000,
        stock = 1
    },
    {
        model = 'ignus',
        brand = 'Pegassi',
        name = 'Ignus',
        category = 'Supers',
        price = 420000,
        stock = 1
    },
    {
        model = 'ignus2',
        brand = 'Pegassi',
        name = 'Weaponized Ignus',
        category = 'Supers',
        price = 4500000,
        stock = 1
    },
    {
        model = 'ignus2_hsw',
        brand = 'Pegassi',
        name = 'Weaponized Ignus',
        category = 'Supers',
        price = 500000,
        stock = 1
    },
    {
        model = 'infernus',
        brand = 'Pegassi',
        name = 'Infernus',
        category = 'Supers',
        price = 235000,
        stock = 1
    },
    {
        model = 'italigtb',
        brand = 'Progen',
        name = 'Itali GTB',
        category = 'Supers',
        price = 1189000,
        stock = 1
    },
    {
        model = 'italigtb2',
        brand = 'Progen',
        name = 'Itali GTB Custom',
        category = 'Supers',
        price = 495000,
        stock = 1
    },
    {
        model = 'krieger',
        brand = 'Benefactor',
        name = 'Krieger',
        category = 'Supers',
        price = 2875000,
        stock = 1
    },
    {
        model = 'le7b',
        brand = 'Annis',
        name = 'RE-7B',
        category = 'Supers',
        price = 2475000,
        stock = 1
    },
    {
        model = 'lm87',
        brand = 'Benefactor',
        name = 'LM87',
        category = 'Supers',
        price = 2915000,
        stock = 1
    },
    {
        model = 'luiva',
        brand = 'Progen',
        name = 'Luiva',
        category = 'Supers',
        price = 2697500,
        stock = 1
    },
    {
        model = 'nero',
        brand = 'Truffade',
        name = 'Nero',
        category = 'Supers',
        price = 1440000,
        stock = 1
    },
    {
        model = 'nero2',
        brand = 'Truffade',
        name = 'Nero Custom',
        category = 'Supers',
        price = 605000,
        stock = 1
    },
    {
        model = 'osiris',
        brand = 'Pegassi',
        name = 'Osiris',
        category = 'Supers',
        price = 1950000,
        stock = 1
    },
    {
        model = 'penetrator',
        brand = 'Ocelot',
        name = 'Penetrator',
        category = 'Supers',
        price = 880000,
        stock = 1
    },
    {
        model = 'pfister811',
        brand = 'Pfister',
        name = '811',
        category = 'Supers',
        price = 1135000,
        stock = 1
    },
    {
        model = 'pipistrello',
        brand = 'Overflod',
        name = 'Pipistrello',
        category = 'Supers',
        price = 2950000,
        stock = 1
    },
    {
        model = 'prototipo',
        brand = 'Grotti',
        name = 'X80 Proto',
        category = 'Supers',
        price = 2700000,
        stock = 1
    },
    {
        model = 'reaper',
        brand = 'Pegassi',
        name = 'Reaper',
        category = 'Supers',
        price = 1595000,
        stock = 1
    },
    {
        model = 's80',
        brand = 'Annis',
        name = 'S80RR',
        category = 'Supers',
        price = 2575000,
        stock = 1
    },
    {
        model = 'sc1',
        brand = 'Ubermacht',
        name = 'SC1',
        category = 'Supers',
        price = 1603000,
        stock = 1
    },
    {
        model = 'scramjet',
        brand = 'Declasse',
        name = 'Scramjet',
        category = 'Supers',
        price = 4000000,
        stock = 1
    },
    {
        model = 'sheava',
        brand = 'Emperor',
        name = 'ETR1',
        category = 'Supers',
        price = 1995000,
        stock = 1
    },
    {
        model = 'sultanrs',
        brand = 'Karin',
        name = 'Sultan RS',
        category = 'Supers',
        price = 795000,
        stock = 1
    },
    {
        model = 'suzume',
        brand = 'Overflod',
        name = 'Suzume',
        category = 'Supers',
        price = 3074500,
        stock = 1
    },
    {
        model = 't20',
        brand = 'Progen',
        name = 'T20',
        category = 'Supers',
        price = 2200000,
        stock = 1
    },
    {
        model = 'taipan',
        brand = 'Cheval',
        name = 'Taipan',
        category = 'Supers',
        price = 1980000,
        stock = 1
    },
    {
        model = 'tempesta',
        brand = 'Pegassi',
        name = 'Tempesta',
        category = 'Supers',
        price = 1329000,
        stock = 1
    },
    {
        model = 'tezeract',
        brand = 'Pegassi',
        name = 'Tezeract',
        category = 'Supers',
        price = 2825000,
        stock = 1
    },
    {
        model = 'thrax',
        brand = 'Truffade',
        name = 'Thrax',
        category = 'Supers',
        price = 2325000,
        stock = 1
    },
    {
        model = 'tigon',
        brand = 'Lampadati',
        name = 'Tigon',
        category = 'Supers',
        price = 2310000,
        stock = 1
    },
    {
        model = 'torero2',
        brand = 'Pegassi',
        name = 'Torero XO',
        category = 'Supers',
        price = 2890000,
        stock = 1
    },
    {
        model = 'turismo3',
        brand = 'Grotti',
        name = 'Turismo Omaggio',
        category = 'Supers',
        price = 2845000,
        stock = 1
    },
    {
        model = 'turismor',
        brand = 'Grotti',
        name = 'Turismo R',
        category = 'Supers',
        price = 300000,
        stock = 1
    },
    {
        model = 'tyrant',
        brand = 'Overflod',
        name = 'Tyrant',
        category = 'Supers',
        price = 2515000,
        stock = 1
    },
    {
        model = 'tyrus',
        brand = 'Progen',
        name = 'Tyrus',
        category = 'Supers',
        price = 2550000,
        stock = 1
    },
    {
        model = 'vacca',
        brand = 'Pegassi',
        name = 'Vacca',
        category = 'Supers',
        price = 240000,
        stock = 1
    },
    {
        model = 'vagner',
        brand = 'Dewbauchee',
        name = 'Vagner',
        category = 'Supers',
        price = 1535000,
        stock = 1
    },
    {
        model = 'vigilante',
        brand = 'Grotti',
        name = 'Vigilante',
        category = 'Supers',
        price = 3750000,
        stock = 1
    },
    {
        model = 'virtue',
        brand = 'Ocelot',
        name = 'Virtue',
        category = 'Supers',
        price = 2980000,
        stock = 1
    },
    {
        model = 'visione',
        brand = 'Grotti',
        name = 'Visione',
        category = 'Supers',
        price = 2250000,
        stock = 1
    },
    {
        model = 'voltic',
        brand = 'Coil',
        name = 'Voltic',
        category = 'Supers',
        price = 150000,
        stock = 1
    },
    {
        model = 'voltic2',
        brand = 'Coil',
        name = 'Rocket Voltic',
        category = 'Supers',
        price = 3830400,
        stock = 1
    },
    {
        model = 'xa21',
        brand = 'Ocelot',
        name = 'XA-21',
        category = 'Supers',
        price = 2375000,
        stock = 1
    },
    {
        model = 'xtreme',
        brand = 'Pfister',
        name = 'X-treme',
        category = 'Supers',
        price = 2885000,
        stock = 1
    },
    {
        model = 'zeno',
        brand = 'Overflod',
        name = 'Zeno',
        category = 'Supers',
        price = 2820000,
        stock = 1
    },
    {
        model = 'zentorno',
        brand = 'Pegassi',
        name = 'Zentorno',
        category = 'Supers',
        price = 340000,
        stock = 1
    },
    {
        model = 'zorrusso',
        brand = 'Pegassi',
        name = 'Zorrusso',
        category = 'Supers',
        price = 1925000,
        stock = 1
    },

    -- Motorcycles
    {
        model = 'akuma',
        brand = 'Dinka',
        name = 'Akuma',
        category = 'Motorcycles',
        price = 55000,
        stock = 3
    },
    {
        model = 'avarus',
        brand = 'LCC',
        name = 'Avarus',
        category = 'Motorcycles',
        price = 116000,
        stock = 4
    },
    {
        model = 'bagger',
        brand = 'Western',
        name = 'Bagger',
        category = 'Motorcycles',
        price = 16000,
        stock = 4
    },
    {
        model = 'bati',
        brand = 'Pegassi',
        name = 'Bati 801',
        category = 'Motorcycles',
        price = 35000,
        stock = 5
    },
    {
        model = 'bati2',
        brand = 'Pegassi',
        name = 'Bati 801RR',
        category = 'Motorcycles',
        price = 15000,
        stock = 4
    },
    {
        model = 'bf400',
        brand = 'Nagasaki',
        name = 'BF400',
        category = 'Motorcycles',
        price = 95000,
        stock = 4
    },
    {
        model = 'carbonrs',
        brand = 'Nagasaki',
        name = 'Carbon RS',
        category = 'Motorcycles',
        price = 40000,
        stock = 4
    },
    {
        model = 'chimera',
        brand = 'Nagasaki',
        name = 'Chimera',
        category = 'Motorcycles',
        price = 210000,
        stock = 4
    },
    {
        model = 'cliffhanger',
        brand = 'Western',
        name = 'Cliffhanger',
        category = 'Motorcycles',
        price = 225000,
        stock = 4
    },
    {
        model = 'daemon',
        brand = 'Western',
        name = 'Daemon',
        category = 'Motorcycles',
        price = 0,
        stock = 4
    },
    {
        model = 'daemon2',
        brand = 'Western',
        name = 'Daemon',
        category = 'Motorcycles',
        price = 145000,
        stock = 4
    },
    {
        model = 'deathbike',
        brand = 'Western',
        name = 'Apocalypse Deathbike',
        category = 'Motorcycles',
        price = 1269000,
        stock = 4
    },
    {
        model = 'deathbike2',
        brand = 'Western',
        name = 'Future Shock Deathbike',
        category = 'Motorcycles',
        price = 1269000,
        stock = 4
    },
    {
        model = 'deathbike3',
        brand = 'Western',
        name = 'Nightmare Deathbike',
        category = 'Motorcycles',
        price = 1269000,
        stock = 4
    },
    {
        model = 'defiler',
        brand = 'Shitzu',
        name = 'Defiler',
        category = 'Motorcycles',
        price = 412000,
        stock = 4
    },
    {
        model = 'diablous',
        brand = 'Principe',
        name = 'Diabolus',
        category = 'Motorcycles',
        price = 169000,
        stock = 4
    },
    {
        model = 'diablous2',
        brand = 'Principe',
        name = 'Diabolus Custom',
        category = 'Motorcycles',
        price = 245000,
        stock = 4
    },
    {
        model = 'double',
        brand = 'Dinka',
        name = 'Double-T',
        category = 'Motorcycles',
        price = 12000,
        stock = 4
    },
    {
        model = 'enduro',
        brand = 'Dinka',
        name = 'Enduro',
        category = 'Motorcycles',
        price = 48000,
        stock = 4
    },
    {
        model = 'esskey',
        brand = 'Pegassi',
        name = 'Esskey',
        category = 'Motorcycles',
        price = 264000,
        stock = 4
    },
    {
        model = 'faggio',
        brand = 'Pegassi',
        name = 'Faggio Sport',
        category = 'Motorcycles',
        price = 47500,
        stock = 4
    },
    {
        model = 'faggio2',
        brand = 'Pegassi',
        name = 'Faggio',
        category = 'Motorcycles',
        price = 5000,
        stock = 4
    },
    {
        model = 'faggio3',
        brand = 'Pegassi',
        name = 'Faggio Mod',
        category = 'Motorcycles',
        price = 55000,
        stock = 4
    },
    {
        model = 'fcr',
        brand = 'Pegassi',
        name = 'FCR 1000',
        category = 'Motorcycles',
        price = 135000,
        stock = 4
    },
    {
        model = 'fcr2',
        brand = 'Pegassi',
        name = 'FCR 1000 Custom',
        category = 'Motorcycles',
        price = 196000,
        stock = 4
    },
    {
        model = 'gargoyle',
        brand = 'Western',
        name = 'Gargoyle',
        category = 'Motorcycles',
        price = 32000,
        stock = 2
    },
    {
        model = 'hakuchou',
        brand = 'Shitzu',
        name = 'Hakuchou',
        category = 'Motorcycles',
        price = 65000,
        stock = 2
    },
    {
        model = 'hakuchou2',
        brand = 'Shitzu',
        name = 'Hakuchou Drag',
        category = 'Motorcycles',
        price = 976000,
        stock = 4
    },
    {
        model = 'hakuchou2_hsw',
        brand = 'Shitzu',
        name = 'Hakuchou Drag',
        category = 'Motorcycles',
        price = 1450000,
        stock = 4
    },
    {
        model = 'hexer',
        brand = 'LCC',
        name = 'Hexer',
        category = 'Motorcycles',
        price = 15000,
        stock = 4
    },
    {
        model = 'innovation',
        brand = 'LCC',
        name = 'Innovation',
        category = 'Motorcycles',
        price = 92500,
        stock = 4
    },
    {
        model = 'lectro',
        brand = 'Principe',
        name = 'Lectro',
        category = 'Motorcycles',
        price = 28000,
        stock = 2
    },
    {
        model = 'manchez',
        brand = 'Maibatsu',
        name = 'Manchez',
        category = 'Motorcycles',
        price = 67000,
        stock = 4
    },
    {
        model = 'manchez2',
        brand = 'Maibatsu',
        name = 'Manchez Scout',
        category = 'Motorcycles',
        price = 225000,
        stock = 4
    },
    {
        model = 'manchez3',
        brand = 'Maibatsu',
        name = 'Manchez Scout C',
        category = 'Motorcycles',
        price = 0,
        stock = 4
    },
    {
        model = 'nemesis',
        brand = 'Principe',
        name = 'Nemesis',
        category = 'Motorcycles',
        price = 12000,
        stock = 4
    },
    {
        model = 'nightblade',
        brand = 'Western',
        name = 'Nightblade',
        category = 'Motorcycles',
        price = 100000,
        stock = 4
    },
    {
        model = 'oppressor',
        brand = 'Pegassi',
        name = 'Oppressor',
        category = 'Motorcycles',
        price = 2750000,
        stock = 4
    },
    {
        model = 'oppressor2',
        brand = 'Pegassi',
        name = 'Oppressor Mk II',
        category = 'Motorcycles',
        price = 8000000,
        stock = 4
    },
    {
        model = 'pcj',
        brand = 'Shitzu',
        name = 'PCJ 600',
        category = 'Motorcycles',
        price = 24000,
        stock = 3
    },
    {
        model = 'pizzaboy',
        brand = 'Pegassi',
        name = 'Pizza Boy',
        category = 'Motorcycles',
        price = 195000,
        stock = 4
    },
    {
        model = 'powersurge',
        brand = 'Western',
        name = 'Powersurge',
        category = 'Motorcycles',
        price = 1605000,
        stock = 4
    },
    {
        model = 'ratbike',
        brand = 'Western',
        name = 'Rat Bike',
        category = 'Motorcycles',
        price = 48000,
        stock = 4
    },
    {
        model = 'reever',
        brand = 'Western',
        name = 'Reever',
        category = 'Motorcycles',
        price = 1900000,
        stock = 4
    },
    {
        model = 'rrocket',
        brand = 'Western',
        name = 'Rampant Rocket',
        category = 'Motorcycles',
        price = 925000,
        stock = 4
    },
    {
        model = 'ruffian',
        brand = 'Pegassi',
        name = 'Ruffian',
        category = 'Motorcycles',
        price = 10000,
        stock = 4
    },
    {
        model = 'sanchez',
        brand = 'Maibatsu',
        name = 'Sanchez (livery)',
        category = 'Motorcycles',
        price = 18000,
        stock = 4
    },
    {
        model = 'sanchez2',
        brand = 'Maibatsu',
        name = 'Sanchez',
        category = 'Motorcycles',
        price = 8000,
        stock = 4
    },
    {
        model = 'sanctus',
        brand = 'LCC',
        name = 'Sanctus',
        category = 'Motorcycles',
        price = 1995000,
        stock = 4
    },
    {
        model = 'shinobi',
        brand = 'Nagasaki',
        name = 'Shinobi',
        category = 'Motorcycles',
        price = 2480500,
        stock = 4
    },
    {
        model = 'shotaro',
        brand = 'Nagasaki',
        name = 'Shotaro',
        category = 'Motorcycles',
        price = 2225000,
        stock = 4
    },
    {
        model = 'sovereign',
        brand = 'Western',
        name = 'Sovereign',
        category = 'Motorcycles',
        price = 120000,
        stock = 4
    },
    {
        model = 'stryder',
        brand = 'Nagasaki',
        name = 'Stryder',
        category = 'Motorcycles',
        price = 670000,
        stock = 4
    },
    {
        model = 'thrust',
        brand = 'Dinka',
        name = 'Thrust',
        category = 'Motorcycles',
        price = 75000,
        stock = 4
    },
    {
        model = 'vader',
        brand = 'Shitzu',
        name = 'Vader',
        category = 'Motorcycles',
        price = 9000,
        stock = 4
    },
    {
        model = 'vindicator',
        brand = 'Dinka',
        name = 'Vindicator',
        category = 'Motorcycles',
        price = 630000,
        stock = 4
    },
    {
        model = 'vortex',
        brand = 'Pegassi',
        name = 'Vortex',
        category = 'Motorcycles',
        price = 356000,
        stock = 4
    },
    {
        model = 'wolfsbane',
        brand = 'Western',
        name = 'Wolfsbane',
        category = 'Motorcycles',
        price = 95000,
        stock = 4
    },
    {
        model = 'zombiea',
        brand = 'Western',
        name = 'Zombie Bobber',
        category = 'Motorcycles',
        price = 99000,
        stock = 4
    },
    {
        model = 'zombieb',
        brand = 'Western',
        name = 'Zombie Chopper',
        category = 'Motorcycles',
        price = 122000,
        stock = 4
    },

    -- SUVs
    {
        model = 'aleutian',
        brand = 'Vapid',
        name = 'Aleutian',
        category = 'SUVs',
        price = 1835000,
        stock = 2
    },
    {
        model = 'astron',
        brand = 'Pfister',
        name = 'Astron',
        category = 'SUVs',
        price = 1580000,
        stock = 2
    },
    {
        model = 'astron2',
        brand = 'Pfister',
        name = 'Astron Custom',
        category = 'SUVs',
        price = 1720000,
        stock = 2
    },
    {
        model = 'astron2_hsw',
        brand = 'Pfister',
        name = 'Astron Custom',
        category = 'SUVs',
        price = 395000,
        stock = 2
    },
    {
        model = 'baller',
        brand = 'Gallivanter',
        name = 'Baller',
        category = 'SUVs',
        price = 0,
        stock = 2
    },
    {
        model = 'baller2',
        brand = 'Gallivanter',
        name = 'Baller',
        category = 'SUVs',
        price = 90000,
        stock = 2
    },
    {
        model = 'baller3',
        brand = 'Gallivanter',
        name = 'Baller LE',
        category = 'SUVs',
        price = 149000,
        stock = 2
    },
    {
        model = 'baller4',
        brand = 'Gallivanter',
        name = 'Baller LE LWB',
        category = 'SUVs',
        price = 247000,
        stock = 2
    },
    {
        model = 'baller5',
        brand = 'Gallivanter',
        name = 'Baller LE (Armored)',
        category = 'SUVs',
        price = 374000,
        stock = 2
    },
    {
        model = 'baller6',
        brand = 'Gallivanter',
        name = 'Baller LE LWB (Armored)',
        category = 'SUVs',
        price = 513000,
        stock = 2
    },
    {
        model = 'baller7',
        brand = 'Gallivanter',
        name = 'Baller ST',
        category = 'SUVs',
        price = 890000,
        stock = 2
    },
    {
        model = 'baller8',
        brand = 'Gallivanter',
        name = 'Baller ST-D',
        category = 'SUVs',
        price = 1715000,
        stock = 2
    },
    {
        model = 'bjxl',
        brand = 'Karin',
        name = 'BeeJay XL',
        category = 'SUVs',
        price = 27000,
        stock = 2
    },
    {
        model = 'castigator',
        brand = 'Canis',
        name = 'Castigator',
        category = 'SUVs',
        price = 1650000,
        stock = 2
    },
    {
        model = 'cavalcade',
        brand = 'Albany',
        name = 'Cavalcade',
        category = 'SUVs',
        price = 48000,
        stock = 2
    },
    {
        model = 'cavalcade2',
        brand = 'Albany',
        name = 'Cavalcade',
        category = 'SUVs',
        price = 70000,
        stock = 2
    },
    {
        model = 'cavalcade3',
        brand = 'Albany',
        name = 'Cavalcade XL',
        category = 'SUVs',
        price = 1665000,
        stock = 2
    },
    {
        model = 'contender',
        brand = 'Vapid',
        name = 'Contender',
        category = 'SUVs',
        price = 250000,
        stock = 2
    },
    {
        model = 'dorado',
        brand = 'Bravado',
        name = 'Dorado',
        category = 'SUVs',
        price = 1375000,
        stock = 2
    },
    {
        model = 'dubsta',
        brand = 'Benefactor',
        name = 'Dubsta',
        category = 'SUVs',
        price = 110000,
        stock = 1
    },
    {
        model = 'dubsta2',
        brand = 'Benefactor',
        name = 'Dubsta',
        category = 'SUVs',
        price = 0,
        stock = 2
    },
    {
        model = 'everon3',
        brand = 'Karin',
        name = 'Everon RS',
        category = 'SUVs',
        price = 1665000,
        stock = 2
    },
    {
        model = 'fq2',
        brand = 'Fathom',
        name = 'FQ 2',
        category = 'SUVs',
        price = 50000,
        stock = 2
    },
    {
        model = 'granger',
        brand = 'Declasse',
        name = 'Granger',
        category = 'SUVs',
        price = 65000,
        stock = 2
    },
    {
        model = 'granger2',
        brand = 'Declasse',
        name = 'Granger 3600LX',
        category = 'SUVs',
        price = 2000000,
        stock = 2
    },
    {
        model = 'gresley',
        brand = 'Bravado',
        name = 'Gresley',
        category = 'SUVs',
        price = 60000,
        stock = 2
    },
    {
        model = 'habanero',
        brand = 'Emperor',
        name = 'Habanero',
        category = 'SUVs',
        price = 42000,
        stock = 2
    },
    {
        model = 'huntley',
        brand = 'Enus',
        name = 'Huntley S',
        category = 'SUVs',
        price = 95000,
        stock = 1
    },
    {
        model = 'issi8',
        brand = 'Weeny',
        name = 'Issi Rally',
        category = 'SUVs',
        price = 1835000,
        stock = 2
    },
    {
        model = 'issi8_hsw',
        brand = 'Weeny',
        name = 'Issi Rally',
        category = 'SUVs',
        price = 650000,
        stock = 2
    },
    {
        model = 'iwagen',
        brand = 'Obey',
        name = 'I-Wagen',
        category = 'SUVs',
        price = 1720000,
        stock = 2
    },
    {
        model = 'jubilee',
        brand = 'Enus',
        name = 'Jubilee',
        category = 'SUVs',
        price = 1650000,
        stock = 2
    },
    {
        model = 'landstalker',
        brand = 'Dundreary',
        name = 'Landstalker',
        category = 'SUVs',
        price = 55000,
        stock = 2
    },
    {
        model = 'landstalker2',
        brand = 'Dundreary',
        name = 'Landstalker XL',
        category = 'SUVs',
        price = 1220000,
        stock = 2
    },
    {
        model = 'mesa',
        brand = 'Canis',
        name = 'Mesa',
        category = 'SUVs',
        price = 0,
        stock = 2
    },
    {
        model = 'mesa2',
        brand = 'Canis',
        name = 'Mesa',
        category = 'SUVs',
        price = 0,
        stock = 2
    },
    {
        model = 'novak',
        brand = 'Lampadati',
        name = 'Novak',
        category = 'SUVs',
        price = 608000,
        stock = 2
    },
    {
        model = 'patriot',
        brand = 'Mammoth',
        name = 'Patriot',
        category = 'SUVs',
        price = 50000,
        stock = 2
    },
    {
        model = 'patriot2',
        brand = 'Mammoth',
        name = 'Patriot Stretch',
        category = 'SUVs',
        price = 611800,
        stock = 2
    },
    {
        model = 'radi',
        brand = 'Vapid',
        name = 'Radius',
        category = 'SUVs',
        price = 32000,
        stock = 2
    },
    {
        model = 'rebla',
        brand = 'Ubermacht',
        name = 'Rebla GTS',
        category = 'SUVs',
        price = 1175000,
        stock = 2
    },
    {
        model = 'rocoto',
        brand = 'Obey',
        name = 'Rocoto',
        category = 'SUVs',
        price = 85000,
        stock = 2
    },
    {
        model = 'seminole',
        brand = 'Canis',
        name = 'Seminole',
        category = 'SUVs',
        price = 30000,
        stock = 2
    },
    {
        model = 'seminole2',
        brand = 'Canis',
        name = 'Seminole Frontier',
        category = 'SUVs',
        price = 678000,
        stock = 2
    },
    {
        model = 'serrano',
        brand = 'Benefactor',
        name = 'Serrano',
        category = 'SUVs',
        price = 60000,
        stock = 2
    },
    {
        model = 'squaddie',
        brand = 'Mammoth',
        name = 'Squaddie',
        category = 'SUVs',
        price = 1130000,
        stock = 2
    },
    {
        model = 'toros',
        brand = 'Pegassi',
        name = 'Toros',
        category = 'SUVs',
        price = 135000,
        stock = 1
    },
    {
        model = 'vivanite',
        brand = 'Karin',
        name = 'Vivanite',
        category = 'SUVs',
        price = 1605000,
        stock = 2
    },
    {
        model = 'vivanite_hsw',
        brand = 'Karin',
        name = 'Vivanite',
        category = 'SUVs',
        price = 800000,
        stock = 2
    },
    {
        model = 'woodlander',
        brand = 'Karin',
        name = 'Woodlander',
        category = 'SUVs',
        price = 1611000,
        stock = 2
    },
    {
        model = 'woodlander_hsw',
        brand = 'Karin',
        name = 'Woodlander',
        category = 'SUVs',
        price = 900000,
        stock = 2
    },
    {
        model = 'xls',
        brand = 'Benefactor',
        name = 'XLS',
        category = 'SUVs',
        price = 253000,
        stock = 2
    },
    {
        model = 'xls2',
        brand = 'Benefactor',
        name = 'XLS (Armored)',
        category = 'SUVs',
        price = 522000,
        stock = 2
    },

    -- Sports
    {
        model = 'alpha',
        brand = 'Albany',
        name = 'Alpha',
        category = 'Sports',
        price = 150000,
        stock = 1
    },
    {
        model = 'banshee',
        brand = 'Bravado',
        name = 'Banshee',
        category = 'Sports',
        price = 120000,
        stock = 1
    },
    {
        model = 'banshee_hsw',
        brand = 'Bravado',
        name = 'Banshee',
        category = 'Sports',
        price = 1840000,
        stock = 1
    },
    {
        model = 'banshee3',
        brand = 'Bravado',
        name = 'Banshee GTS',
        category = 'Sports',
        price = 1989500,
        stock = 1
    },
    {
        model = 'banshee3_hsw',
        brand = 'Bravado',
        name = 'Banshee GTS',
        category = 'Sports',
        price = 1900000,
        stock = 1
    },
    {
        model = 'bestiagts',
        brand = 'Grotti',
        name = 'Bestia GTS',
        category = 'Sports',
        price = 610000,
        stock = 1
    },
    {
        model = 'blista2',
        brand = 'Dinka',
        name = 'Blista Compact',
        category = 'Sports',
        price = 42000,
        stock = 1
    },
    {
        model = 'blista3',
        brand = 'Dinka',
        name = 'Go Go Monkey Blista',
        category = 'Sports',
        price = 0,
        stock = 1
    },
    {
        model = 'buffalo',
        brand = 'Bravado',
        name = 'Buffalo',
        category = 'Sports',
        price = 35000,
        stock = 1
    },
    {
        model = 'buffalo2',
        brand = 'Bravado',
        name = 'Buffalo S',
        category = 'Sports',
        price = 96000,
        stock = 1
    },
    {
        model = 'buffalo3',
        brand = 'Bravado',
        name = 'Sprunk Buffalo',
        category = 'Sports',
        price = 535000,
        stock = 1
    },
    {
        model = 'calico',
        brand = 'Karin',
        name = 'Calico GTF',
        category = 'Sports',
        price = 1995000,
        stock = 1
    },
    {
        model = 'carbonizzare',
        brand = 'Grotti',
        name = 'Carbonizzare',
        category = 'Sports',
        price = 155000,
        stock = 1
    },
    {
        model = 'comet2',
        brand = 'Pfister',
        name = 'Comet',
        category = 'Sports',
        price = 145000,
        stock = 1
    },
    {
        model = 'comet3',
        brand = 'Pfister',
        name = 'Comet Retro Custom',
        category = 'Sports',
        price = 645000,
        stock = 1
    },
    {
        model = 'comet4',
        brand = 'Pfister',
        name = 'Comet Safari',
        category = 'Sports',
        price = 710000,
        stock = 1
    },
    {
        model = 'comet5',
        brand = 'Pfister',
        name = 'Comet SR',
        category = 'Sports',
        price = 1145000,
        stock = 1
    },
    {
        model = 'comet6',
        brand = 'Pfister',
        name = 'Comet S2',
        category = 'Sports',
        price = 1878000,
        stock = 1
    },
    {
        model = 'comet7',
        brand = 'Pfister',
        name = 'Comet S2 Cabrio',
        category = 'Sports',
        price = 1797000,
        stock = 1
    },
    {
        model = 'coquette',
        brand = 'Invetero',
        name = 'Coquette',
        category = 'Sports',
        price = 138000,
        stock = 1
    },
    {
        model = 'coquette4',
        brand = 'Invetero',
        name = 'Coquette D10',
        category = 'Sports',
        price = 1510000,
        stock = 1
    },
    {
        model = 'coquette6',
        brand = 'Invetero',
        name = 'Coquette D5',
        category = 'Sports',
        price = 1730000,
        stock = 1
    },
    {
        model = 'corsita',
        brand = 'Lampadati',
        name = 'Corsita',
        category = 'Sports',
        price = 1795000,
        stock = 1
    },
    {
        model = 'coureur',
        brand = 'Penaud',
        name = 'La Coureuse',
        category = 'Sports',
        price = 1990000,
        stock = 1
    },
    {
        model = 'coureur_hsw',
        brand = 'Penaud',
        name = 'La Coureuse',
        category = 'Sports',
        price = 818000,
        stock = 1
    },
    {
        model = 'cypher',
        brand = 'Ubermacht',
        name = 'Cypher',
        category = 'Sports',
        price = 1550000,
        stock = 1
    },
    {
        model = 'drafter',
        brand = 'Obey',
        name = '8F Drafter',
        category = 'Sports',
        price = 718000,
        stock = 1
    },
    {
        model = 'driftcypher',
        brand = 'Ubermacht',
        name = 'Cypher',
        category = 'Sports',
        price = 200000,
        stock = 1
    },
    {
        model = 'drifteuros',
        brand = 'Annis',
        name = 'Euros',
        category = 'Sports',
        price = 200000,
        stock = 1
    },
    {
        model = 'driftfuto',
        brand = 'Karin',
        name = 'Futo GTX',
        category = 'Sports',
        price = 200000,
        stock = 1
    },
    {
        model = 'driftfuto2',
        brand = 'Karin',
        name = 'Futo',
        category = 'Sports',
        price = 200000,
        stock = 1
    },
    {
        model = 'driftjester',
        brand = 'Dinka',
        name = 'Jester RR',
        category = 'Sports',
        price = 200000,
        stock = 1
    },
    {
        model = 'driftremus',
        brand = 'Annis',
        name = 'Remus',
        category = 'Sports',
        price = 200000,
        stock = 1
    },
    {
        model = 'driftrt3000',
        brand = 'Dinka',
        name = 'RT3000',
        category = 'Sports',
        price = 200000,
        stock = 1
    },
    {
        model = 'driftsentinel',
        brand = 'Ubermacht',
        name = 'Sentinel Classic Widebody',
        category = 'Sports',
        price = 200000,
        stock = 1
    },
    {
        model = 'drifttampa',
        brand = 'Declasse',
        name = 'Drift Tampa',
        category = 'Sports',
        price = 200000,
        stock = 1
    },
    {
        model = 'driftzr350',
        brand = 'Annis',
        name = 'ZR350',
        category = 'Sports',
        price = 200000,
        stock = 1
    },
    {
        model = 'elegy',
        brand = 'Annis',
        name = 'Elegy Retro Custom',
        category = 'Sports',
        price = 904000,
        stock = 1
    },
    {
        model = 'elegy2',
        brand = 'Annis',
        name = 'Elegy RH8',
        category = 'Sports',
        price = 150000,
        stock = 1
    },
    {
        model = 'envisage',
        brand = 'Bollokan',
        name = 'Envisage',
        category = 'Sports',
        price = 2472000,
        stock = 1
    },
    {
        model = 'euros',
        brand = 'Annis',
        name = 'Euros',
        category = 'Sports',
        price = 1800000,
        stock = 1
    },
    {
        model = 'everon2',
        brand = 'Karin',
        name = 'Hotring Everon',
        category = 'Sports',
        price = 1790000,
        stock = 1
    },
    {
        model = 'feltzer2',
        brand = 'Benefactor',
        name = 'Feltzer',
        category = 'Sports',
        price = 97000,
        stock = 2
    },
    {
        model = 'flashgt',
        brand = 'Vapid',
        name = 'Flash GT',
        category = 'Sports',
        price = 1675000,
        stock = 1
    },
    {
        model = 'furoregt',
        brand = 'Lampadati',
        name = 'Furore GT',
        category = 'Sports',
        price = 448000,
        stock = 1
    },
    {
        model = 'fusilade',
        brand = 'Schyster',
        name = 'Fusilade',
        category = 'Sports',
        price = 36000,
        stock = 1
    },
    {
        model = 'futo',
        brand = 'Karin',
        name = 'Futo',
        category = 'Sports',
        price = 9000,
        stock = 1
    },
    {
        model = 'futo2',
        brand = 'Karin',
        name = 'Futo GTX',
        category = 'Sports',
        price = 1590000,
        stock = 1
    },
    {
        model = 'gauntlet6',
        brand = 'Bravado',
        name = 'Hotring Hellfire',
        category = 'Sports',
        price = 1810000,
        stock = 1
    },
    {
        model = 'gb200',
        brand = 'Vapid',
        name = 'GB200',
        category = 'Sports',
        price = 940000,
        stock = 1
    },
    {
        model = 'growler',
        brand = 'Pfister',
        name = 'Growler',
        category = 'Sports',
        price = 1627000,
        stock = 1
    },
    {
        model = 'hotring',
        brand = 'Declasse',
        name = 'Hotring Sabre',
        category = 'Sports',
        price = 830000,
        stock = 1
    },
    {
        model = 'imorgon',
        brand = 'Overflod',
        name = 'Imorgon',
        category = 'Sports',
        price = 2165000,
        stock = 1
    },
    {
        model = 'issi7',
        brand = 'Weeny',
        name = 'Issi Sport',
        category = 'Sports',
        price = 897000,
        stock = 1
    },
    {
        model = 'italigto',
        brand = 'Grotti',
        name = 'Itali GTO',
        category = 'Sports',
        price = 1965000,
        stock = 1
    },
    {
        model = 'italirsx',
        brand = 'Grotti',
        name = 'Itali RSX',
        category = 'Sports',
        price = 3465000,
        stock = 1
    },
    {
        model = 'jester',
        brand = 'Dinka',
        name = 'Jester',
        category = 'Sports',
        price = 130000,
        stock = 1
    },
    {
        model = 'jester2',
        brand = 'Dinka',
        name = 'Jester (Racecar)',
        category = 'Sports',
        price = 350000,
        stock = 1
    },
    {
        model = 'jester3',
        brand = 'Dinka',
        name = 'Jester Classic',
        category = 'Sports',
        price = 790000,
        stock = 1
    },
    {
        model = 'jester4',
        brand = 'Dinka',
        name = 'Jester RR',
        category = 'Sports',
        price = 1970000,
        stock = 1
    },
    {
        model = 'jester5',
        brand = 'Dinka',
        name = 'LSCM Jester RR',
        category = 'Sports',
        price = 2290000,
        stock = 1
    },
    {
        model = 'jugular',
        brand = 'Ocelot',
        name = 'Jugular',
        category = 'Sports',
        price = 1225000,
        stock = 1
    },
    {
        model = 'khamelion',
        brand = 'Hijak',
        name = 'Khamelion',
        category = 'Sports',
        price = 100000,
        stock = 1
    },
    {
        model = 'komoda',
        brand = 'Lampadati',
        name = 'Komoda',
        category = 'Sports',
        price = 1700000,
        stock = 1
    },
    {
        model = 'kuruma',
        brand = 'Karin',
        name = 'Kuruma',
        category = 'Sports',
        price = 72000,
        stock = 2
    },
    {
        model = 'kuruma2',
        brand = 'Karin',
        name = 'Kuruma (Armored)',
        category = 'Sports',
        price = 698250,
        stock = 1
    },
    {
        model = 'locust',
        brand = 'Ocelot',
        name = 'Locust',
        category = 'Sports',
        price = 1625000,
        stock = 1
    },
    {
        model = 'lynx',
        brand = 'Ocelot',
        name = 'Lynx',
        category = 'Sports',
        price = 1735000,
        stock = 1
    },
    {
        model = 'massacro',
        brand = 'Dewbauchee',
        name = 'Massacro',
        category = 'Sports',
        price = 275000,
        stock = 1
    },
    {
        model = 'massacro2',
        brand = 'Dewbauchee',
        name = 'Massacro (Racecar)',
        category = 'Sports',
        price = 385000,
        stock = 1
    },
    {
        model = 'neo',
        brand = 'Vysser',
        name = 'Neo',
        category = 'Sports',
        price = 1875000,
        stock = 1
    },
    {
        model = 'neon',
        brand = 'Pfister',
        name = 'Neon',
        category = 'Sports',
        price = 1500000,
        stock = 1
    },
    {
        model = 'ninef',
        brand = 'Obey',
        name = '9F',
        category = 'Sports',
        price = 120000,
        stock = 1
    },
    {
        model = 'ninef2',
        brand = 'Obey',
        name = '9F Cabrio',
        category = 'Sports',
        price = 130000,
        stock = 1
    },
    {
        model = 'niobe',
        brand = 'Ubermacht',
        name = 'Niobe',
        category = 'Sports',
        price = 1880000,
        stock = 1
    },
    {
        model = 'niobe_hsw',
        brand = 'Ubermacht',
        name = 'Niobe',
        category = 'Sports',
        price = 1800000,
        stock = 1
    },
    {
        model = 'omnis',
        brand = 'Obey',
        name = 'Omnis',
        category = 'Sports',
        price = 701000,
        stock = 1
    },
    {
        model = 'omnisegt',
        brand = 'Obey',
        name = 'Omnis e-GT',
        category = 'Sports',
        price = 1795000,
        stock = 1
    },
    {
        model = 'panthere',
        brand = 'Toundra',
        name = 'Panthere',
        category = 'Sports',
        price = 2170000,
        stock = 1
    },
    {
        model = 'paragon',
        brand = 'Enus',
        name = 'Paragon R',
        category = 'Sports',
        price = 905000,
        stock = 1
    },
    {
        model = 'paragon2',
        brand = 'Enus',
        name = 'Paragon R (Armored)',
        category = 'Sports',
        price = 0,
        stock = 1
    },
    {
        model = 'paragon3',
        brand = 'Enus',
        name = 'Paragon S',
        category = 'Sports',
        price = 2010000,
        stock = 1
    },
    {
        model = 'pariah',
        brand = 'Ocelot',
        name = 'Pariah',
        category = 'Sports',
        price = 1420000,
        stock = 1
    },
    {
        model = 'penumbra',
        brand = 'Maibatsu',
        name = 'Penumbra',
        category = 'Sports',
        price = 52000,
        stock = 2
    },
    {
        model = 'penumbra2',
        brand = 'Maibatsu',
        name = 'Penumbra FF',
        category = 'Sports',
        price = 1380000,
        stock = 1
    },
    {
        model = 'r300',
        brand = 'Annis',
        name = '300R',
        category = 'Sports',
        price = 2075000,
        stock = 1
    },
    {
        model = 'raiden',
        brand = 'Coil',
        name = 'Raiden',
        category = 'Sports',
        price = 1375000,
        stock = 1
    },
    {
        model = 'rapidgt',
        brand = 'Dewbauchee',
        name = 'Rapid GT',
        category = 'Sports',
        price = 132000,
        stock = 1
    },
    {
        model = 'rapidgt2',
        brand = 'Dewbauchee',
        name = 'Rapid GT',
        category = 'Sports',
        price = 140000,
        stock = 1
    },
    {
        model = 'rapidgt4',
        brand = 'Dewbauchee',
        name = 'Rapid GT X',
        category = 'Sports',
        price = 2705500,
        stock = 1
    },
    {
        model = 'raptor',
        brand = 'BF',
        name = 'Raptor',
        category = 'Sports',
        price = 648000,
        stock = 1
    },
    {
        model = 'remus',
        brand = 'Annis',
        name = 'Remus',
        category = 'Sports',
        price = 1370000,
        stock = 1
    },
    {
        model = 'revolter',
        brand = 'Ubermacht',
        name = 'Revolter',
        category = 'Sports',
        price = 1610000,
        stock = 1
    },
    {
        model = 'rt3000',
        brand = 'Dinka',
        name = 'RT3000',
        category = 'Sports',
        price = 1715000,
        stock = 1
    },
    {
        model = 'ruston',
        brand = 'Hijak',
        name = 'Ruston',
        category = 'Sports',
        price = 430000,
        stock = 1
    },
    {
        model = 's95',
        brand = 'Karin',
        name = 'S95',
        category = 'Sports',
        price = 1995000,
        stock = 1
    },
    {
        model = 's95_hsw',
        brand = 'Karin',
        name = 'S95',
        category = 'Sports',
        price = 525000,
        stock = 1
    },
    {
        model = 'schafter3',
        brand = 'Benefactor',
        name = 'Schafter V12',
        category = 'Sports',
        price = 116000,
        stock = 1
    },
    {
        model = 'schafter4',
        brand = 'Benefactor',
        name = 'Schafter LWB',
        category = 'Sports',
        price = 208000,
        stock = 1
    },
    {
        model = 'schlagen',
        brand = 'Benefactor',
        name = 'Schlagen GT',
        category = 'Sports',
        price = 1300000,
        stock = 1
    },
    {
        model = 'schwarzer',
        brand = 'Benefactor',
        name = 'Schwartzer',
        category = 'Sports',
        price = 80000,
        stock = 1
    },
    {
        model = 'sentinel3',
        brand = 'Ubermacht',
        name = 'Sentinel Classic',
        category = 'Sports',
        price = 650000,
        stock = 1
    },
    {
        model = 'sentinel4',
        brand = 'Ubermacht',
        name = 'Sentinel Classic Widebody',
        category = 'Sports',
        price = 700000,
        stock = 1
    },
    {
        model = 'sentinel5',
        brand = 'Ubermacht',
        name = 'Sentinel GTS',
        category = 'Sports',
        price = 2172000,
        stock = 1
    },
    {
        model = 'seven70',
        brand = 'Dewbauchee',
        name = 'Seven-70',
        category = 'Sports',
        price = 140000,
        stock = 1
    },
    {
        model = 'sm722',
        brand = 'Benefactor',
        name = 'SM722',
        category = 'Sports',
        price = 2115000,
        stock = 1
    },
    {
        model = 'specter',
        brand = 'Dewbauchee',
        name = 'Specter',
        category = 'Sports',
        price = 160000,
        stock = 1
    },
    {
        model = 'specter2',
        brand = 'Dewbauchee',
        name = 'Specter Custom',
        category = 'Sports',
        price = 252000,
        stock = 1
    },
    {
        model = 'stingertt',
        brand = 'Grotti',
        name = 'Stinger TT',
        category = 'Sports',
        price = 2380000,
        stock = 1
    },
    {
        model = 'stingertt_hsw',
        brand = 'Grotti',
        name = 'Stinger TT',
        category = 'Sports',
        price = 1418000,
        stock = 1
    },
    {
        model = 'streiter',
        brand = 'Benefactor',
        name = 'Streiter',
        category = 'Sports',
        price = 500000,
        stock = 1
    },
    {
        model = 'sugoi',
        brand = 'Dinka',
        name = 'Sugoi',
        category = 'Sports',
        price = 1224000,
        stock = 1
    },
    {
        model = 'sultan',
        brand = 'Karin',
        name = 'Sultan',
        category = 'Sports',
        price = 85000,
        stock = 2
    },
    {
        model = 'sultan2',
        brand = 'Karin',
        name = 'Sultan Classic',
        category = 'Sports',
        price = 1718000,
        stock = 1
    },
    {
        model = 'sultan3',
        brand = 'Karin',
        name = 'Sultan RS Classic',
        category = 'Sports',
        price = 1789000,
        stock = 1
    },
    {
        model = 'surano',
        brand = 'Benefactor',
        name = 'Surano',
        category = 'Sports',
        price = 110000,
        stock = 1
    },
    {
        model = 'tampa2',
        brand = 'Declasse',
        name = 'Drift Tampa',
        category = 'Sports',
        price = 995000,
        stock = 1
    },
    {
        model = 'tenf',
        brand = 'Obey',
        name = '10F',
        category = 'Sports',
        price = 1675000,
        stock = 1
    },
    {
        model = 'tenf2',
        brand = 'Obey',
        name = '10F Widebody',
        category = 'Sports',
        price = 575000,
        stock = 1
    },
    {
        model = 'tropos',
        brand = 'Lampadati',
        name = 'Tropos Rallye',
        category = 'Sports',
        price = 816000,
        stock = 1
    },
    {
        model = 'vectre',
        brand = 'Emperor',
        name = 'Vectre',
        category = 'Sports',
        price = 1785000,
        stock = 1
    },
    {
        model = 'verlierer2',
        brand = 'Bravado',
        name = 'Verlierer',
        category = 'Sports',
        price = 695000,
        stock = 1
    },
    {
        model = 'veto',
        brand = 'Dinka',
        name = 'Veto Classic',
        category = 'Sports',
        price = 895000,
        stock = 1
    },
    {
        model = 'veto2',
        brand = 'Dinka',
        name = 'Veto Modern',
        category = 'Sports',
        price = 995000,
        stock = 1
    },
    {
        model = 'vstr',
        brand = 'Albany',
        name = 'V-STR',
        category = 'Sports',
        price = 1285000,
        stock = 1
    },
    {
        model = 'zr350',
        brand = 'Annis',
        name = 'ZR350',
        category = 'Sports',
        price = 1615000,
        stock = 1
    },
    {
        model = 'zr380',
        brand = 'Annis',
        name = 'Apocalypse ZR380',
        category = 'Sports',
        price = 2138640,
        stock = 1
    },
    {
        model = 'zr3802',
        brand = 'Annis',
        name = 'Future Shock ZR380',
        category = 'Sports',
        price = 2138640,
        stock = 1
    },
    {
        model = 'zr3803',
        brand = 'Annis',
        name = 'Nightmare ZR380',
        category = 'Sports',
        price = 2138640,
        stock = 1
    },

    -- Muscle
    {
        model = 'arbitergt',
        brand = 'Imponte',
        name = 'Arbiter GT',
        category = 'Muscle',
        price = 1580000,
        stock = 2
    },
    {
        model = 'arbitergt_hsw',
        brand = 'Imponte',
        name = 'Arbiter GT',
        category = 'Muscle',
        price = 375000,
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
        model = 'brigham',
        brand = 'Albany',
        name = 'Brigham',
        category = 'Muscle',
        price = 1499000,
        stock = 2
    },
    {
        model = 'broadway',
        brand = 'Classique',
        name = 'Broadway',
        category = 'Muscle',
        price = 925000,
        stock = 2
    },
    {
        model = 'buccaneer',
        brand = 'Albany',
        name = 'Buccaneer',
        category = 'Muscle',
        price = 29000,
        stock = 2
    },
    {
        model = 'buccaneer2',
        brand = 'Albany',
        name = 'Buccaneer Custom',
        category = 'Muscle',
        price = 390000,
        stock = 2
    },
    {
        model = 'buffalo4',
        brand = 'Bravado',
        name = 'Buffalo STX',
        category = 'Muscle',
        price = 2150000,
        stock = 2
    },
    {
        model = 'buffalo5',
        brand = 'Bravado',
        name = 'Buffalo EVX',
        category = 'Muscle',
        price = 2140000,
        stock = 2
    },
    {
        model = 'buffalo5_hsw',
        brand = 'Bravado',
        name = 'Buffalo EVX',
        category = 'Muscle',
        price = 1415000,
        stock = 2
    },
    {
        model = 'chino',
        brand = 'Vapid',
        name = 'Chino',
        category = 'Muscle',
        price = 225000,
        stock = 2
    },
    {
        model = 'chino2',
        brand = 'Vapid',
        name = 'Chino Custom',
        category = 'Muscle',
        price = 180000,
        stock = 2
    },
    {
        model = 'clique',
        brand = 'Vapid',
        name = 'Clique',
        category = 'Muscle',
        price = 909000,
        stock = 2
    },
    {
        model = 'clique2',
        brand = 'Vapid',
        name = 'Clique Wagon',
        category = 'Muscle',
        price = 1205000,
        stock = 2
    },
    {
        model = 'coquette3',
        brand = 'Invetero',
        name = 'Coquette BlackFin',
        category = 'Muscle',
        price = 695000,
        stock = 2
    },
    {
        model = 'deviant',
        brand = 'Schyster',
        name = 'Deviant',
        category = 'Muscle',
        price = 512000,
        stock = 2
    },
    {
        model = 'dominator',
        brand = 'Vapid',
        name = 'Dominator',
        category = 'Muscle',
        price = 62500,
        stock = 2
    },
    {
        model = 'dominator2',
        brand = 'Vapid',
        name = 'Pisswasser Dominator',
        category = 'Muscle',
        price = 315000,
        stock = 2
    },
    {
        model = 'dominator3',
        brand = 'Vapid',
        name = 'Dominator GTX',
        category = 'Muscle',
        price = 725000,
        stock = 2
    },
    {
        model = 'dominator4',
        brand = 'Vapid',
        name = 'Apocalypse Dominator',
        category = 'Muscle',
        price = 1132000,
        stock = 2
    },
    {
        model = 'dominator5',
        brand = 'Vapid',
        name = 'Future Shock Dominator',
        category = 'Muscle',
        price = 1132000,
        stock = 2
    },
    {
        model = 'dominator6',
        brand = 'Vapid',
        name = 'Nightmare Dominator',
        category = 'Muscle',
        price = 1132000,
        stock = 2
    },
    {
        model = 'dominator7',
        brand = 'Vapid',
        name = 'Dominator ASP',
        category = 'Muscle',
        price = 1775000,
        stock = 2
    },
    {
        model = 'dominator8',
        brand = 'Vapid',
        name = 'Dominator GTT',
        category = 'Muscle',
        price = 1220000,
        stock = 2
    },
    {
        model = 'dominator9',
        brand = 'Vapid',
        name = 'Dominator GT',
        category = 'Muscle',
        price = 2195000,
        stock = 2
    },
    {
        model = 'dominator10',
        brand = 'Vapid',
        name = 'Dominator FX',
        category = 'Muscle',
        price = 1550000,
        stock = 2
    },
    {
        model = 'driftdominator9',
        brand = 'Vapid',
        name = 'Dominator GT',
        category = 'Muscle',
        price = 200000,
        stock = 2
    },
    {
        model = 'driftdominator10',
        brand = 'Vapid',
        name = 'Dominator FX',
        category = 'Muscle',
        price = 200000,
        stock = 2
    },
    {
        model = 'driftgauntlet4',
        brand = 'Bravado',
        name = 'Gauntlet Hellfire',
        category = 'Muscle',
        price = 200000,
        stock = 2
    },
    {
        model = 'driftyosemite',
        brand = 'Declasse',
        name = 'Drift Yosemite',
        category = 'Muscle',
        price = 200000,
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
        model = 'dukes2',
        brand = 'Imponte',
        name = 'Duke O\'Death',
        category = 'Muscle',
        price = 665000,
        stock = 2
    },
    {
        model = 'dukes3',
        brand = 'Imponte',
        name = 'Beater Dukes',
        category = 'Muscle',
        price = 378000,
        stock = 2
    },
    {
        model = 'ellie',
        brand = 'Vapid',
        name = 'Ellie',
        category = 'Muscle',
        price = 565000,
        stock = 2
    },
    {
        model = 'eudora',
        brand = 'Willard',
        name = 'Eudora',
        category = 'Muscle',
        price = 1250000,
        stock = 2
    },
    {
        model = 'faction',
        brand = 'Willard',
        name = 'Faction',
        category = 'Muscle',
        price = 36000,
        stock = 2
    },
    {
        model = 'faction2',
        brand = 'Willard',
        name = 'Faction Custom',
        category = 'Muscle',
        price = 335000,
        stock = 2
    },
    {
        model = 'faction3',
        brand = 'Willard',
        name = 'Faction Custom Donk',
        category = 'Muscle',
        price = 695000,
        stock = 2
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
        model = 'gauntlet2',
        brand = 'Bravado',
        name = 'Redwood Gauntlet',
        category = 'Muscle',
        price = 230000,
        stock = 2
    },
    {
        model = 'gauntlet3',
        brand = 'Bravado',
        name = 'Gauntlet Classic',
        category = 'Muscle',
        price = 615000,
        stock = 2
    },
    {
        model = 'gauntlet4',
        brand = 'Bravado',
        name = 'Gauntlet Hellfire',
        category = 'Muscle',
        price = 745000,
        stock = 2
    },
    {
        model = 'gauntlet5',
        brand = 'Bravado',
        name = 'Gauntlet Classic Custom',
        category = 'Muscle',
        price = 815000,
        stock = 2
    },
    {
        model = 'greenwood',
        brand = 'Bravado',
        name = 'Greenwood',
        category = 'Muscle',
        price = 1465000,
        stock = 2
    },
    {
        model = 'hermes',
        brand = 'Albany',
        name = 'Hermes',
        category = 'Muscle',
        price = 535000,
        stock = 2
    },
    {
        model = 'hotknife',
        brand = 'Vapid',
        name = 'Hotknife',
        category = 'Muscle',
        price = 90000,
        stock = 2
    },
    {
        model = 'hustler',
        brand = 'Vapid',
        name = 'Hustler',
        category = 'Muscle',
        price = 625000,
        stock = 2
    },
    {
        model = 'impaler',
        brand = 'Declasse',
        name = 'Impaler',
        category = 'Muscle',
        price = 331835,
        stock = 2
    },
    {
        model = 'impaler2',
        brand = 'Declasse',
        name = 'Apocalypse Impaler',
        category = 'Muscle',
        price = 1209500,
        stock = 2
    },
    {
        model = 'impaler3',
        brand = 'Declasse',
        name = 'Future Shock Impaler',
        category = 'Muscle',
        price = 1209500,
        stock = 2
    },
    {
        model = 'impaler4',
        brand = 'Declasse',
        name = 'Nightmare Impaler',
        category = 'Muscle',
        price = 1209500,
        stock = 2
    },
    {
        model = 'impaler5',
        brand = 'Declasse',
        name = 'Impaler SZ',
        category = 'Muscle',
        price = 1280000,
        stock = 2
    },
    {
        model = 'impaler6',
        brand = 'Declasse',
        name = 'Impaler LX',
        category = 'Muscle',
        price = 1465000,
        stock = 2
    },
    {
        model = 'imperator',
        brand = 'Vapid',
        name = 'Apocalypse Imperator',
        category = 'Muscle',
        price = 2284940,
        stock = 2
    },
    {
        model = 'imperator2',
        brand = 'Vapid',
        name = 'Future Shock Imperator',
        category = 'Muscle',
        price = 2284940,
        stock = 2
    },
    {
        model = 'imperator3',
        brand = 'Vapid',
        name = 'Nightmare Imperator',
        category = 'Muscle',
        price = 2284940,
        stock = 2
    },
    {
        model = 'lurcher',
        brand = 'Albany',
        name = 'Lurcher',
        category = 'Muscle',
        price = 650000,
        stock = 2
    },
    {
        model = 'manana2',
        brand = 'Albany',
        name = 'Manana Custom',
        category = 'Muscle',
        price = 925000,
        stock = 2
    },
    {
        model = 'moonbeam',
        brand = 'Declasse',
        name = 'Moonbeam',
        category = 'Muscle',
        price = 32000,
        stock = 2
    },
    {
        model = 'moonbeam2',
        brand = 'Declasse',
        name = 'Moonbeam Custom',
        category = 'Muscle',
        price = 370000,
        stock = 2
    },
    {
        model = 'nightshade',
        brand = 'Imponte',
        name = 'Nightshade',
        category = 'Muscle',
        price = 585000,
        stock = 2
    },
    {
        model = 'peyote2',
        brand = 'Vapid',
        name = 'Peyote Gasser',
        category = 'Muscle',
        price = 805000,
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
        model = 'picador',
        brand = 'Cheval',
        name = 'Picador',
        category = 'Muscle',
        price = 9000,
        stock = 2
    },
    {
        model = 'ratloader',
        brand = 'Bravado',
        name = 'Rat-Loader',
        category = 'Muscle',
        price = 6000,
        stock = 2
    },
    {
        model = 'ratloader2',
        brand = 'Bravado',
        name = 'Rat-Truck',
        category = 'Muscle',
        price = 37500,
        stock = 2
    },
    {
        model = 'ruiner',
        brand = 'Imponte',
        name = 'Ruiner',
        category = 'Muscle',
        price = 10000,
        stock = 2
    },
    {
        model = 'ruiner2',
        brand = 'Imponte',
        name = 'Ruiner 2000',
        category = 'Muscle',
        price = 3750000,
        stock = 2
    },
    {
        model = 'ruiner3',
        brand = 'Imponte',
        name = 'Ruiner',
        category = 'Muscle',
        price = 0,
        stock = 2
    },
    {
        model = 'ruiner4',
        brand = 'Imponte',
        name = 'Ruiner ZZ-8',
        category = 'Muscle',
        price = 1320000,
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
    {
        model = 'sabregt2',
        brand = 'Declasse',
        name = 'Sabre Turbo Custom',
        category = 'Muscle',
        price = 490000,
        stock = 2
    },
    {
        model = 'slamvan',
        brand = 'Vapid',
        name = 'Slamvan',
        category = 'Muscle',
        price = 49500,
        stock = 2
    },
    {
        model = 'slamvan2',
        brand = 'Vapid',
        name = 'Lost Slamvan',
        category = 'Muscle',
        price = 0,
        stock = 2
    },
    {
        model = 'slamvan3',
        brand = 'Vapid',
        name = 'Slamvan Custom',
        category = 'Muscle',
        price = 415000,
        stock = 2
    },
    {
        model = 'slamvan4',
        brand = 'Vapid',
        name = 'Apocalypse Slamvan',
        category = 'Muscle',
        price = 1321875,
        stock = 2
    },
    {
        model = 'slamvan5',
        brand = 'Vapid',
        name = 'Future Shock Slamvan',
        category = 'Muscle',
        price = 1321875,
        stock = 2
    },
    {
        model = 'slamvan6',
        brand = 'Vapid',
        name = 'Nightmare Slamvan',
        category = 'Muscle',
        price = 1321875,
        stock = 2
    },
    {
        model = 'stalion',
        brand = 'Declasse',
        name = 'Stallion',
        category = 'Muscle',
        price = 71000,
        stock = 2
    },
    {
        model = 'stalion2',
        brand = 'Declasse',
        name = 'Burger Shot Stallion',
        category = 'Muscle',
        price = 277000,
        stock = 2
    },
    {
        model = 'tahoma',
        brand = 'Declasse',
        name = 'Tahoma Coupe',
        category = 'Muscle',
        price = 1500000,
        stock = 2
    },
    {
        model = 'tampa',
        brand = 'Declasse',
        name = 'Tampa',
        category = 'Muscle',
        price = 375000,
        stock = 2
    },
    {
        model = 'tampa3',
        brand = 'Declasse',
        name = 'Weaponized Tampa',
        category = 'Muscle',
        price = 2108050,
        stock = 2
    },
    {
        model = 'tampa4',
        brand = 'Declasse',
        name = 'Tampa GT',
        category = 'Muscle',
        price = 1311000,
        stock = 2
    },
    {
        model = 'tampa4_hsw',
        brand = 'Declasse',
        name = 'Tampa GT',
        category = 'Muscle',
        price = 1400000,
        stock = 2
    },
    {
        model = 'tulip',
        brand = 'Declasse',
        name = 'Tulip',
        category = 'Muscle',
        price = 718000,
        stock = 2
    },
    {
        model = 'tulip2',
        brand = 'Declasse',
        name = 'Tulip M-100',
        category = 'Muscle',
        price = 1658000,
        stock = 2
    },
    {
        model = 'vamos',
        brand = 'Declasse',
        name = 'Vamos',
        category = 'Muscle',
        price = 596000,
        stock = 2
    },
    {
        model = 'vigero',
        brand = 'Declasse',
        name = 'Vigero',
        category = 'Muscle',
        price = 21000,
        stock = 2
    },
    {
        model = 'vigero2',
        brand = 'Declasse',
        name = 'Vigero ZX',
        category = 'Muscle',
        price = 1947000,
        stock = 2
    },
    {
        model = 'vigero2_hsw',
        brand = 'Declasse',
        name = 'Vigero ZX',
        category = 'Muscle',
        price = 550000,
        stock = 2
    },
    {
        model = 'vigero3',
        brand = 'Declasse',
        name = 'Vigero ZX Convertible',
        category = 'Muscle',
        price = 2295000,
        stock = 2
    },
    {
        model = 'vigero3_hsw',
        brand = 'Declasse',
        name = 'Vigero ZX Convertible',
        category = 'Muscle',
        price = 550000,
        stock = 2
    },
    {
        model = 'virgo',
        brand = 'Albany',
        name = 'Virgo',
        category = 'Muscle',
        price = 195000,
        stock = 2
    },
    {
        model = 'virgo2',
        brand = 'Dundreary',
        name = 'Virgo Classic Custom',
        category = 'Muscle',
        price = 240000,
        stock = 2
    },
    {
        model = 'virgo3',
        brand = 'Dundreary',
        name = 'Virgo Classic',
        category = 'Muscle',
        price = 165000,
        stock = 2
    },
    {
        model = 'voodoo',
        brand = 'Declasse',
        name = 'Voodoo Custom',
        category = 'Muscle',
        price = 30000,
        stock = 2
    },
    {
        model = 'voodoo2',
        brand = 'Declasse',
        name = 'Voodoo',
        category = 'Muscle',
        price = 5500,
        stock = 2
    },
    {
        model = 'weevil2',
        brand = 'BF',
        name = 'Weevil Custom',
        category = 'Muscle',
        price = 980000,
        stock = 2
    },
    {
        model = 'yosemite',
        brand = 'Declasse',
        name = 'Yosemite',
        category = 'Muscle',
        price = 485000,
        stock = 2
    },
    {
        model = 'yosemite2',
        brand = 'Declasse',
        name = 'Drift Yosemite',
        category = 'Muscle',
        price = 1308000,
        stock = 2
    },

    -- Sports Classics
    {
        model = 'ardent',
        brand = 'Ocelot',
        name = 'Ardent',
        category = 'Sports Classics',
        price = 1150000,
        stock = 1
    },
    {
        model = 'astrale',
        brand = 'Pfister',
        name = 'Astrale',
        category = 'Sports Classics',
        price = 1475500,
        stock = 1
    },
    {
        model = 'astrale_hsw',
        brand = 'Pfister',
        name = 'Astrale',
        category = 'Sports Classics',
        price = 950000,
        stock = 1
    },
    {
        model = 'btype',
        brand = 'Albany',
        name = 'Roosevelt',
        category = 'Sports Classics',
        price = 750000,
        stock = 1
    },
    {
        model = 'btype2',
        brand = 'Albany',
        name = 'FrÃ¤nken Stange',
        category = 'Sports Classics',
        price = 550000,
        stock = 1
    },
    {
        model = 'btype3',
        brand = 'Albany',
        name = 'Roosevelt Valor',
        category = 'Sports Classics',
        price = 982000,
        stock = 1
    },
    {
        model = 'casco',
        brand = 'Lampadati',
        name = 'Casco',
        category = 'Sports Classics',
        price = 904400,
        stock = 1
    },
    {
        model = 'cheburek',
        brand = 'RUNE',
        name = 'Cheburek',
        category = 'Sports Classics',
        price = 145000,
        stock = 1
    },
    {
        model = 'cheetah2',
        brand = 'Grotti',
        name = 'Cheetah Classic',
        category = 'Sports Classics',
        price = 865000,
        stock = 1
    },
    {
        model = 'cheetah3',
        brand = 'Grotti',
        name = 'LSCM Cheetah Classic',
        category = 'Sports Classics',
        price = 1952500,
        stock = 1
    },
    {
        model = 'coquette2',
        brand = 'Invetero',
        name = 'Coquette Classic',
        category = 'Sports Classics',
        price = 665000,
        stock = 1
    },
    {
        model = 'coquette5',
        brand = 'Invetero',
        name = 'Coquette D1',
        category = 'Sports Classics',
        price = 1500000,
        stock = 1
    },
    {
        model = 'deluxo',
        brand = 'Imponte',
        name = 'Deluxo',
        category = 'Sports Classics',
        price = 5750000,
        stock = 1
    },
    {
        model = 'driftcheburek',
        brand = 'RUNE',
        name = 'Cheburek',
        category = 'Sports Classics',
        price = 200000,
        stock = 1
    },
    {
        model = 'driftjester3',
        brand = 'Dinka',
        name = 'Jester Classic',
        category = 'Sports Classics',
        price = 200000,
        stock = 1
    },
    {
        model = 'driftnebula',
        brand = 'Vulcar',
        name = 'Nebula Turbo',
        category = 'Sports Classics',
        price = 200000,
        stock = 1
    },
    {
        model = 'dynasty',
        brand = 'Weeny',
        name = 'Dynasty',
        category = 'Sports Classics',
        price = 450000,
        stock = 1
    },
    {
        model = 'fagaloa',
        brand = 'Vulcar',
        name = 'Fagaloa',
        category = 'Sports Classics',
        price = 335000,
        stock = 1
    },
    {
        model = 'feltzer3',
        brand = 'Benefactor',
        name = 'Stirling GT',
        category = 'Sports Classics',
        price = 975000,
        stock = 1
    },
    {
        model = 'feltzer3_hsw',
        brand = 'Benefactor',
        name = 'Stirling GT',
        category = 'Sports Classics',
        price = 900000,
        stock = 1
    },
    {
        model = 'gt500',
        brand = 'Grotti',
        name = 'GT500',
        category = 'Sports Classics',
        price = 785000,
        stock = 1
    },
    {
        model = 'gt750',
        brand = 'Grotti',
        name = 'GT750',
        category = 'Sports Classics',
        price = 1247000,
        stock = 1
    },
    {
        model = 'infernus2',
        brand = 'Pegassi',
        name = 'Infernus Classic',
        category = 'Sports Classics',
        price = 915000,
        stock = 1
    },
    {
        model = 'itali2',
        brand = 'Grotti',
        name = 'Itali Classic',
        category = 'Sports Classics',
        price = 2025000,
        stock = 1
    },
    {
        model = 'jb700',
        brand = 'Dewbauchee',
        name = 'JB 700',
        category = 'Sports Classics',
        price = 350000,
        stock = 1
    },
    {
        model = 'jb7002',
        brand = 'Dewbauchee',
        name = 'JB 700W',
        category = 'Sports Classics',
        price = 1470000,
        stock = 1
    },
    {
        model = 'mamba',
        brand = 'Declasse',
        name = 'Mamba',
        category = 'Sports Classics',
        price = 995000,
        stock = 1
    },
    {
        model = 'manana',
        brand = 'Albany',
        name = 'Manana',
        category = 'Sports Classics',
        price = 10000,
        stock = 1
    },
    {
        model = 'michelli',
        brand = 'Lampadati',
        name = 'Michelli GT',
        category = 'Sports Classics',
        price = 1225000,
        stock = 1
    },
    {
        model = 'monroe',
        brand = 'Pegassi',
        name = 'Monroe',
        category = 'Sports Classics',
        price = 490000,
        stock = 1
    },
    {
        model = 'nebula',
        brand = 'Vulcar',
        name = 'Nebula Turbo',
        category = 'Sports Classics',
        price = 797000,
        stock = 1
    },
    {
        model = 'peyote',
        brand = 'Vapid',
        name = 'Peyote',
        category = 'Sports Classics',
        price = 38000,
        stock = 1
    },
    {
        model = 'peyote3',
        brand = 'Vapid',
        name = 'Peyote Custom',
        category = 'Sports Classics',
        price = 620000,
        stock = 1
    },
    {
        model = 'pigalle',
        brand = 'Lampadati',
        name = 'Pigalle',
        category = 'Sports Classics',
        price = 400000,
        stock = 1
    },
    {
        model = 'rapidgt3',
        brand = 'Dewbauchee',
        name = 'Rapid GT Classic',
        category = 'Sports Classics',
        price = 885000,
        stock = 1
    },
    {
        model = 'retinue',
        brand = 'Vapid',
        name = 'Retinue',
        category = 'Sports Classics',
        price = 615000,
        stock = 1
    },
    {
        model = 'retinue2',
        brand = 'Vapid',
        name = 'Retinue Mk II',
        category = 'Sports Classics',
        price = 1620000,
        stock = 1
    },
    {
        model = 'savestra',
        brand = 'Annis',
        name = 'Savestra',
        category = 'Sports Classics',
        price = 990000,
        stock = 1
    },
    {
        model = 'stinger',
        brand = 'Grotti',
        name = 'Stinger',
        category = 'Sports Classics',
        price = 850000,
        stock = 1
    },
    {
        model = 'stingergt',
        brand = 'Grotti',
        name = 'Stinger GT',
        category = 'Sports Classics',
        price = 875000,
        stock = 1
    },
    {
        model = 'stromberg',
        brand = 'Ocelot',
        name = 'Stromberg',
        category = 'Sports Classics',
        price = 2500000,
        stock = 1
    },
    {
        model = 'swinger',
        brand = 'Ocelot',
        name = 'Swinger',
        category = 'Sports Classics',
        price = 909000,
        stock = 1
    },
    {
        model = 'toreador',
        brand = 'Pegassi',
        name = 'Toreador',
        category = 'Sports Classics',
        price = 4250000,
        stock = 1
    },
    {
        model = 'torero',
        brand = 'Pegassi',
        name = 'Torero',
        category = 'Sports Classics',
        price = 998000,
        stock = 1
    },
    {
        model = 'tornado',
        brand = 'Declasse',
        name = 'Tornado',
        category = 'Sports Classics',
        price = 30000,
        stock = 1
    },
    {
        model = 'tornado2',
        brand = 'Declasse',
        name = 'Tornado',
        category = 'Sports Classics',
        price = 0,
        stock = 1
    },
    {
        model = 'tornado3',
        brand = 'Declasse',
        name = 'Tornado',
        category = 'Sports Classics',
        price = 0,
        stock = 1
    },
    {
        model = 'tornado4',
        brand = 'Declasse',
        name = 'Tornado',
        category = 'Sports Classics',
        price = 0,
        stock = 1
    },
    {
        model = 'tornado5',
        brand = 'Declasse',
        name = 'Tornado Custom',
        category = 'Sports Classics',
        price = 375000,
        stock = 1
    },
    {
        model = 'tornado6',
        brand = 'Declasse',
        name = 'Tornado Rat Rod',
        category = 'Sports Classics',
        price = 378000,
        stock = 1
    },
    {
        model = 'turismo2',
        brand = 'Grotti',
        name = 'Turismo Classic',
        category = 'Sports Classics',
        price = 705000,
        stock = 1
    },
    {
        model = 'turismo2_hsw',
        brand = 'Grotti',
        name = 'Turismo Classic',
        category = 'Sports Classics',
        price = 897000,
        stock = 1
    },
    {
        model = 'uranus',
        brand = 'Vapid',
        name = 'Uranus LozSpeed',
        category = 'Sports Classics',
        price = 1140000,
        stock = 1
    },
    {
        model = 'viseris',
        brand = 'Lampadati',
        name = 'Viseris',
        category = 'Sports Classics',
        price = 875000,
        stock = 1
    },
    {
        model = 'z190',
        brand = 'Karin',
        name = '190z',
        category = 'Sports Classics',
        price = 900000,
        stock = 1
    },
    {
        model = 'zion3',
        brand = 'Ubermacht',
        name = 'Zion Classic',
        category = 'Sports Classics',
        price = 812000,
        stock = 1
    },
    {
        model = 'ztype',
        brand = 'Truffade',
        name = 'Z-Type',
        category = 'Sports Classics',
        price = 950000,
        stock = 1
    },

    -- Compacts
    {
        model = 'asbo',
        brand = 'Maxwell',
        name = 'Asbo',
        category = 'Compacts',
        price = 22000,
        stock = 2
    },
    {
        model = 'blista',
        brand = 'Dinka',
        name = 'Blista',
        category = 'Compacts',
        price = 18000,
        stock = 3
    },
    {
        model = 'brioso',
        brand = 'Grotti',
        name = 'Brioso R/A',
        category = 'Compacts',
        price = 20000,
        stock = 2
    },
    {
        model = 'brioso_hsw',
        brand = 'Grotti',
        name = 'Brioso R/A',
        category = 'Compacts',
        price = 1097500,
        stock = 4
    },
    {
        model = 'brioso2',
        brand = 'Grotti',
        name = 'Brioso 300',
        category = 'Compacts',
        price = 610000,
        stock = 4
    },
    {
        model = 'brioso3',
        brand = 'Grotti',
        name = 'Brioso 300 Widebody',
        category = 'Compacts',
        price = 585000,
        stock = 4
    },
    {
        model = 'club',
        brand = 'BF',
        name = 'Club',
        category = 'Compacts',
        price = 1280000,
        stock = 4
    },
    {
        model = 'dilettante',
        brand = 'Karin',
        name = 'Dilettante',
        category = 'Compacts',
        price = 9000,
        stock = 3
    },
    {
        model = 'dilettante2',
        brand = 'Karin',
        name = 'Dilettante',
        category = 'Compacts',
        price = 0,
        stock = 4
    },
    {
        model = 'issi2',
        brand = 'Weeny',
        name = 'Issi',
        category = 'Compacts',
        price = 16000,
        stock = 3
    },
    {
        model = 'issi3',
        brand = 'Weeny',
        name = 'Issi Classic',
        category = 'Compacts',
        price = 360000,
        stock = 4
    },
    {
        model = 'issi4',
        brand = 'Weeny',
        name = 'Apocalypse Issi',
        category = 'Compacts',
        price = 1089000,
        stock = 4
    },
    {
        model = 'issi5',
        brand = 'Weeny',
        name = 'Future Shock Issi',
        category = 'Compacts',
        price = 1089000,
        stock = 4
    },
    {
        model = 'issi6',
        brand = 'Weeny',
        name = 'Nightmare Issi',
        category = 'Compacts',
        price = 1089000,
        stock = 4
    },
    {
        model = 'kanjo',
        brand = 'Dinka',
        name = 'Blista Kanjo',
        category = 'Compacts',
        price = 580000,
        stock = 4
    },
    {
        model = 'panto',
        brand = 'Benefactor',
        name = 'Panto',
        category = 'Compacts',
        price = 12000,
        stock = 4
    },
    {
        model = 'prairie',
        brand = 'Bollokan',
        name = 'Prairie',
        category = 'Compacts',
        price = 30000,
        stock = 2
    },
    {
        model = 'rhapsody',
        brand = 'Declasse',
        name = 'Rhapsody',
        category = 'Compacts',
        price = 10000,
        stock = 2
    },
    {
        model = 'weevil',
        brand = 'BF',
        name = 'Weevil',
        category = 'Compacts',
        price = 870000,
        stock = 4
    },

    -- Sedans
    {
        model = 'asea',
        brand = 'Declasse',
        name = 'Asea',
        category = 'Sedans',
        price = 12000,
        stock = 3
    },
    {
        model = 'asea2',
        brand = 'Declasse',
        name = 'Asea',
        category = 'Sedans',
        price = 0,
        stock = 3
    },
    {
        model = 'asterope',
        brand = 'Karin',
        name = 'Asterope',
        category = 'Sedans',
        price = 26000,
        stock = 3
    },
    {
        model = 'asterope2',
        brand = 'Karin',
        name = 'Asterope GZ',
        category = 'Sedans',
        price = 459000,
        stock = 3
    },
    {
        model = 'chavosv6',
        brand = 'Dinka',
        name = 'Chavos V6',
        category = 'Sedans',
        price = 1420000,
        stock = 3
    },
    {
        model = 'cinquemila',
        brand = 'Lampadati',
        name = 'Cinquemila',
        category = 'Sedans',
        price = 1740000,
        stock = 3
    },
    {
        model = 'cog55',
        brand = 'Enus',
        name = 'Cognoscenti 55',
        category = 'Sedans',
        price = 154000,
        stock = 3
    },
    {
        model = 'cog552',
        brand = 'Enus',
        name = 'Cognoscenti 55 (Armored)',
        category = 'Sedans',
        price = 396000,
        stock = 3
    },
    {
        model = 'cognoscenti',
        brand = 'Enus',
        name = 'Cognoscenti',
        category = 'Sedans',
        price = 254000,
        stock = 3
    },
    {
        model = 'cognoscenti2',
        brand = 'Enus',
        name = 'Cognoscenti (Armored)',
        category = 'Sedans',
        price = 558000,
        stock = 3
    },
    {
        model = 'deity',
        brand = 'Enus',
        name = 'Deity',
        category = 'Sedans',
        price = 1845000,
        stock = 3
    },
    {
        model = 'driftchavosv6',
        brand = 'Dinka',
        name = 'Chavos V6',
        category = 'Sedans',
        price = 200000,
        stock = 3
    },
    {
        model = 'drifthardy',
        brand = 'Annis',
        name = 'Hardy',
        category = 'Sedans',
        price = 200000,
        stock = 3
    },
    {
        model = 'driftvorschlag',
        brand = 'Benefactor',
        name = 'Vorschlaghammer',
        category = 'Sedans',
        price = 200000,
        stock = 3
    },
    {
        model = 'emperor',
        brand = 'Albany',
        name = 'Emperor',
        category = 'Sedans',
        price = 0,
        stock = 3
    },
    {
        model = 'emperor2',
        brand = 'Albany',
        name = 'Emperor',
        category = 'Sedans',
        price = 0,
        stock = 3
    },
    {
        model = 'emperor3',
        brand = 'Albany',
        name = 'Emperor',
        category = 'Sedans',
        price = 0,
        stock = 3
    },
    {
        model = 'fugitive',
        brand = 'Cheval',
        name = 'Fugitive',
        category = 'Sedans',
        price = 30000,
        stock = 3
    },
    {
        model = 'glendale',
        brand = 'Benefactor',
        name = 'Glendale',
        category = 'Sedans',
        price = 200000,
        stock = 3
    },
    {
        model = 'glendale2',
        brand = 'Benefactor',
        name = 'Glendale Custom',
        category = 'Sedans',
        price = 520000,
        stock = 3
    },
    {
        model = 'hardy',
        brand = 'Annis',
        name = 'Hardy',
        category = 'Sedans',
        price = 1380000,
        stock = 3
    },
    {
        model = 'ingot',
        brand = 'Vulcar',
        name = 'Ingot',
        category = 'Sedans',
        price = 9000,
        stock = 3
    },
    {
        model = 'intruder',
        brand = 'Karin',
        name = 'Intruder',
        category = 'Sedans',
        price = 16000,
        stock = 3
    },
    {
        model = 'limo2',
        brand = 'Benefactor',
        name = 'Turreted Limo',
        category = 'Sedans',
        price = 1650000,
        stock = 3
    },
    {
        model = 'minimus',
        brand = 'Annis',
        name = 'Minimus',
        category = 'Sedans',
        price = 1417000,
        stock = 3
    },
    {
        model = 'premier',
        brand = 'Declasse',
        name = 'Premier',
        category = 'Sedans',
        price = 20000,
        stock = 3
    },
    {
        model = 'primo',
        brand = 'Albany',
        name = 'Primo',
        category = 'Sedans',
        price = 18000,
        stock = 3
    },
    {
        model = 'primo2',
        brand = 'Albany',
        name = 'Primo Custom',
        category = 'Sedans',
        price = 400000,
        stock = 3
    },
    {
        model = 'regina',
        brand = 'Dundreary',
        name = 'Regina',
        category = 'Sedans',
        price = 8000,
        stock = 3
    },
    {
        model = 'rhinehart',
        brand = 'Ubermacht',
        name = 'Rhinehart',
        category = 'Sedans',
        price = 1598000,
        stock = 3
    },
    {
        model = 'romero',
        brand = 'Chariot',
        name = 'Romero Hearse',
        category = 'Sedans',
        price = 45000,
        stock = 3
    },
    {
        model = 'schafter2',
        brand = 'Benefactor',
        name = 'Schafter',
        category = 'Sedans',
        price = 65000,
        stock = 3
    },
    {
        model = 'schafter5',
        brand = 'Benefactor',
        name = 'Schafter V12 (Armored)',
        category = 'Sedans',
        price = 325000,
        stock = 3
    },
    {
        model = 'schafter6',
        brand = 'Benefactor',
        name = 'Schafter LWB (Armored)',
        category = 'Sedans',
        price = 438000,
        stock = 3
    },
    {
        model = 'sentinel6',
        brand = 'Ubermacht',
        name = 'Sentinel XS4',
        category = 'Sedans',
        price = 1429000,
        stock = 3
    },
    {
        model = 'stafford',
        brand = 'Enus',
        name = 'Stafford',
        category = 'Sedans',
        price = 1272000,
        stock = 3
    },
    {
        model = 'stanier',
        brand = 'Vapid',
        name = 'Stanier',
        category = 'Sedans',
        price = 25000,
        stock = 4
    },
    {
        model = 'stratum',
        brand = 'Zirconium',
        name = 'Stratum',
        category = 'Sedans',
        price = 10000,
        stock = 3
    },
    {
        model = 'stretch',
        brand = 'Dundreary',
        name = 'Stretch',
        category = 'Sedans',
        price = 30000,
        stock = 3
    },
    {
        model = 'superd',
        brand = 'Enus',
        name = 'Super Diamond',
        category = 'Sedans',
        price = 70000,
        stock = 1
    },
    {
        model = 'surge',
        brand = 'Cheval',
        name = 'Surge',
        category = 'Sedans',
        price = 38000,
        stock = 3
    },
    {
        model = 'tailgater',
        brand = 'Obey',
        name = 'Tailgater',
        category = 'Sedans',
        price = 45000,
        stock = 2
    },
    {
        model = 'tailgater2',
        brand = 'Obey',
        name = 'Tailgater S',
        category = 'Sedans',
        price = 1495000,
        stock = 3
    },
    {
        model = 'vorschlaghammer',
        brand = 'Benefactor',
        name = 'Vorschlaghammer',
        category = 'Sedans',
        price = 1790000,
        stock = 3
    },
    {
        model = 'warrener',
        brand = 'Vulcar',
        name = 'Warrener',
        category = 'Sedans',
        price = 22000,
        stock = 2
    },
    {
        model = 'warrener2',
        brand = 'Vulcar',
        name = 'Warrener HKR',
        category = 'Sedans',
        price = 1260000,
        stock = 3
    },
    {
        model = 'washington',
        brand = 'Albany',
        name = 'Washington',
        category = 'Sedans',
        price = 15000,
        stock = 3
    },

    -- Off-Road
    {
        model = 'bfinjection',
        brand = 'BF',
        name = 'Injection',
        category = 'Off-Road',
        price = 16000,
        stock = 2
    },
    {
        model = 'bifta',
        brand = 'BF',
        name = 'Bifta',
        category = 'Off-Road',
        price = 75000,
        stock = 2
    },
    {
        model = 'blazer',
        brand = 'Nagasaki',
        name = 'Blazer',
        category = 'Off-Road',
        price = 8000,
        stock = 2
    },
    {
        model = 'blazer2',
        brand = 'Nagasaki',
        name = 'Blazer Lifeguard',
        category = 'Off-Road',
        price = 62000,
        stock = 2
    },
    {
        model = 'blazer3',
        brand = 'Nagasaki',
        name = 'Hot Rod Blazer',
        category = 'Off-Road',
        price = 69000,
        stock = 2
    },
    {
        model = 'blazer4',
        brand = 'Nagasaki',
        name = 'Street Blazer',
        category = 'Off-Road',
        price = 81000,
        stock = 2
    },
    {
        model = 'blazer5',
        brand = 'Nagasaki',
        name = 'Blazer Aqua',
        category = 'Off-Road',
        price = 1755600,
        stock = 2
    },
    {
        model = 'bodhi2',
        brand = 'Canis',
        name = 'Bodhi',
        category = 'Off-Road',
        price = 25000,
        stock = 2
    },
    {
        model = 'boor',
        brand = 'Karin',
        name = 'Boor',
        category = 'Off-Road',
        price = 1280000,
        stock = 2
    },
    {
        model = 'brawler',
        brand = 'Coil',
        name = 'Brawler',
        category = 'Off-Road',
        price = 80000,
        stock = 1
    },
    {
        model = 'bruiser',
        brand = 'Benefactor',
        name = 'Apocalypse Bruiser',
        category = 'Off-Road',
        price = 1609000,
        stock = 2
    },
    {
        model = 'bruiser2',
        brand = 'Benefactor',
        name = 'Future Shock Bruiser',
        category = 'Off-Road',
        price = 1609000,
        stock = 2
    },
    {
        model = 'bruiser3',
        brand = 'Benefactor',
        name = 'Nightmare Bruiser',
        category = 'Off-Road',
        price = 1609000,
        stock = 2
    },
    {
        model = 'brutus',
        brand = 'Declasse',
        name = 'Apocalypse Brutus',
        category = 'Off-Road',
        price = 2666650,
        stock = 2
    },
    {
        model = 'brutus2',
        brand = 'Declasse',
        name = 'Future Shock Brutus',
        category = 'Off-Road',
        price = 2666650,
        stock = 2
    },
    {
        model = 'brutus3',
        brand = 'Declasse',
        name = 'Nightmare Brutus',
        category = 'Off-Road',
        price = 2666650,
        stock = 2
    },
    {
        model = 'caracara',
        brand = 'Vapid',
        name = 'Caracara',
        category = 'Off-Road',
        price = 1775000,
        stock = 2
    },
    {
        model = 'caracara2',
        brand = 'Vapid',
        name = 'Caracara 4x4',
        category = 'Off-Road',
        price = 95000,
        stock = 1
    },
    {
        model = 'dloader',
        brand = 'Bravado',
        name = 'Duneloader',
        category = 'Off-Road',
        price = 0,
        stock = 2
    },
    {
        model = 'draugur',
        brand = 'Declasse',
        name = 'Draugur',
        category = 'Off-Road',
        price = 120000,
        stock = 1
    },
    {
        model = 'driftl352',
        brand = 'Declasse',
        name = 'Drift Walton L35',
        category = 'Off-Road',
        price = 1403750,
        stock = 2
    },
    {
        model = 'dubsta3',
        brand = 'Benefactor',
        name = 'Dubsta 6x6',
        category = 'Off-Road',
        price = 249000,
        stock = 2
    },
    {
        model = 'dune',
        brand = 'BF',
        name = 'Dune Buggy',
        category = 'Off-Road',
        price = 20000,
        stock = 2
    },
    {
        model = 'dune2',
        brand = 'BF',
        name = 'Space Docker',
        category = 'Off-Road',
        price = 0,
        stock = 2
    },
    {
        model = 'dune3',
        brand = 'BF',
        name = 'Dune FAV',
        category = 'Off-Road',
        price = 1130500,
        stock = 2
    },
    {
        model = 'dune4',
        brand = 'BF',
        name = 'Ramp Buggy',
        category = 'Off-Road',
        price = 0,
        stock = 2
    },
    {
        model = 'dune5',
        brand = 'BF',
        name = 'Ramp Buggy',
        category = 'Off-Road',
        price = 3192000,
        stock = 2
    },
    {
        model = 'everon',
        brand = 'Karin',
        name = 'Everon',
        category = 'Off-Road',
        price = 1475000,
        stock = 2
    },
    {
        model = 'firebolt',
        brand = 'Vapid',
        name = 'Firebolt ASP',
        category = 'Off-Road',
        price = 1894500,
        stock = 2
    },
    {
        model = 'firebolt_hsw',
        brand = 'Vapid',
        name = 'Firebolt ASP',
        category = 'Off-Road',
        price = 1500000,
        stock = 2
    },
    {
        model = 'freecrawler',
        brand = 'Canis',
        name = 'Freecrawler',
        category = 'Off-Road',
        price = 597000,
        stock = 2
    },
    {
        model = 'hellion',
        brand = 'Annis',
        name = 'Hellion',
        category = 'Off-Road',
        price = 835000,
        stock = 2
    },
    {
        model = 'insurgent',
        brand = 'HVY',
        name = 'Insurgent Pick-Up',
        category = 'Off-Road',
        price = 1795500,
        stock = 2
    },
    {
        model = 'insurgent2',
        brand = 'HVY',
        name = 'Insurgent',
        category = 'Off-Road',
        price = 897750,
        stock = 2
    },
    {
        model = 'insurgent3',
        brand = 'HVY',
        name = 'Insurgent Pick-Up Custom',
        category = 'Off-Road',
        price = 202500,
        stock = 2
    },
    {
        model = 'kalahari',
        brand = 'Canis',
        name = 'Kalahari',
        category = 'Off-Road',
        price = 40000,
        stock = 2
    },
    {
        model = 'kamacho',
        brand = 'Canis',
        name = 'Kamacho',
        category = 'Off-Road',
        price = 82000,
        stock = 1
    },
    {
        model = 'l35',
        brand = 'Declasse',
        name = 'Walton L35',
        category = 'Off-Road',
        price = 1670000,
        stock = 2
    },
    {
        model = 'l352',
        brand = 'Declasse',
        name = 'Walton L35 Stock',
        category = 'Off-Road',
        price = 1303700,
        stock = 2
    },
    {
        model = 'marshall',
        brand = 'Cheval',
        name = 'Marshall',
        category = 'Off-Road',
        price = 500000,
        stock = 2
    },
    {
        model = 'menacer',
        brand = 'HVY',
        name = 'Menacer',
        category = 'Off-Road',
        price = 1775000,
        stock = 2
    },
    {
        model = 'mesa3',
        brand = 'Canis',
        name = 'Mesa',
        category = 'Off-Road',
        price = 87000,
        stock = 2
    },
    {
        model = 'monster',
        brand = 'Vapid',
        name = 'Liberator',
        category = 'Off-Road',
        price = 742014,
        stock = 2
    },
    {
        model = 'monster3',
        brand = 'Bravado',
        name = 'Apocalypse Sasquatch',
        category = 'Off-Road',
        price = 1530875,
        stock = 2
    },
    {
        model = 'monster4',
        brand = 'Bravado',
        name = 'Future Shock Sasquatch',
        category = 'Off-Road',
        price = 1530875,
        stock = 2
    },
    {
        model = 'monster5',
        brand = 'Bravado',
        name = 'Nightmare Sasquatch',
        category = 'Off-Road',
        price = 1530875,
        stock = 2
    },
    {
        model = 'monstrociti',
        brand = 'Maibatsu',
        name = 'MonstroCiti',
        category = 'Off-Road',
        price = 1485000,
        stock = 2
    },
    {
        model = 'monstrociti_hsw',
        brand = 'Maibatsu',
        name = 'MonstroCiti',
        category = 'Off-Road',
        price = 1109000,
        stock = 2
    },
    {
        model = 'nightshark',
        brand = 'HVY',
        name = 'Nightshark',
        category = 'Off-Road',
        price = 1245000,
        stock = 2
    },
    {
        model = 'outlaw',
        brand = 'Nagasaki',
        name = 'Outlaw',
        category = 'Off-Road',
        price = 1268000,
        stock = 2
    },
    {
        model = 'patriot3',
        brand = 'Mammoth',
        name = 'Patriot Mil-Spec',
        category = 'Off-Road',
        price = 1710000,
        stock = 2
    },
    {
        model = 'rancherxl',
        brand = 'Declasse',
        name = 'Rancher XL',
        category = 'Off-Road',
        price = 9000,
        stock = 2
    },
    {
        model = 'rancherxl2',
        brand = 'Declasse',
        name = 'Rancher XL',
        category = 'Off-Road',
        price = 0,
        stock = 2
    },
    {
        model = 'ratel',
        brand = 'Vapid',
        name = 'Ratel',
        category = 'Off-Road',
        price = 1873000,
        stock = 2
    },
    {
        model = 'rcbandito',
        brand = 'Unknown',
        name = 'RC Bandito',
        category = 'Off-Road',
        price = 1590000,
        stock = 2
    },
    {
        model = 'rebel',
        brand = 'Karin',
        name = 'Rusty Rebel',
        category = 'Off-Road',
        price = 3000,
        stock = 2
    },
    {
        model = 'rebel2',
        brand = 'Karin',
        name = 'Rebel',
        category = 'Off-Road',
        price = 35000,
        stock = 2
    },
    {
        model = 'riata',
        brand = 'Vapid',
        name = 'Riata',
        category = 'Off-Road',
        price = 70000,
        stock = 2
    },
    {
        model = 'sandking',
        brand = 'Vapid',
        name = 'Sandking XL',
        category = 'Off-Road',
        price = 65000,
        stock = 2
    },
    {
        model = 'sandking2',
        brand = 'Vapid',
        name = 'Sandking SWB',
        category = 'Off-Road',
        price = 38000,
        stock = 2
    },
    {
        model = 'technical',
        brand = 'Karin',
        name = 'Technical',
        category = 'Off-Road',
        price = 1263500,
        stock = 2
    },
    {
        model = 'technical2',
        brand = 'Karin',
        name = 'Technical Aqua',
        category = 'Off-Road',
        price = 1489600,
        stock = 2
    },
    {
        model = 'technical3',
        brand = 'Karin',
        name = 'Technical Custom',
        category = 'Off-Road',
        price = 142500,
        stock = 2
    },
    {
        model = 'terminus',
        brand = 'Canis',
        name = 'Terminus',
        category = 'Off-Road',
        price = 1877500,
        stock = 2
    },
    {
        model = 'trophytruck',
        brand = 'Vapid',
        name = 'Trophy Truck',
        category = 'Off-Road',
        price = 550000,
        stock = 2
    },
    {
        model = 'trophytruck2',
        brand = 'Vapid',
        name = 'Desert Raid',
        category = 'Off-Road',
        price = 695000,
        stock = 2
    },
    {
        model = 'vagrant',
        brand = 'Maxwell',
        name = 'Vagrant',
        category = 'Off-Road',
        price = 2214000,
        stock = 2
    },
    {
        model = 'verus',
        brand = 'Dinka',
        name = 'Verus',
        category = 'Off-Road',
        price = 192000,
        stock = 2
    },
    {
        model = 'winky',
        brand = 'Vapid',
        name = 'Winky',
        category = 'Off-Road',
        price = 1100000,
        stock = 2
    },
    {
        model = 'yosemite3',
        brand = 'Declasse',
        name = 'Yosemite Rancher',
        category = 'Off-Road',
        price = 700000,
        stock = 2
    },
    {
        model = 'yosemite1500',
        brand = 'Declasse',
        name = 'Yosemite 1500',
        category = 'Off-Road',
        price = 1205000,
        stock = 2
    },
    {
        model = 'zhaba',
        brand = 'RUNE',
        name = 'Zhaba',
        category = 'Off-Road',
        price = 2400000,
        stock = 2
    },

    -- Vans
    {
        model = 'bison',
        brand = 'Bravado',
        name = 'Bison',
        category = 'Vans',
        price = 30000,
        stock = 3
    },
    {
        model = 'bison2',
        brand = 'Bravado',
        name = 'Bison',
        category = 'Vans',
        price = 0,
        stock = 3
    },
    {
        model = 'bison3',
        brand = 'Bravado',
        name = 'Bison',
        category = 'Vans',
        price = 0,
        stock = 3
    },
    {
        model = 'bobcatxl',
        brand = 'Vapid',
        name = 'Bobcat XL',
        category = 'Vans',
        price = 23000,
        stock = 3
    },
    {
        model = 'boxville',
        brand = 'Brute',
        name = 'Boxville',
        category = 'Vans',
        price = 398000,
        stock = 3
    },
    {
        model = 'boxville2',
        brand = 'Brute',
        name = 'Boxville',
        category = 'Vans',
        price = 0,
        stock = 3
    },
    {
        model = 'boxville3',
        brand = 'Brute',
        name = 'Boxville',
        category = 'Vans',
        price = 0,
        stock = 3
    },
    {
        model = 'boxville4',
        brand = 'Brute',
        name = 'Boxville',
        category = 'Vans',
        price = 59850,
        stock = 3
    },
    {
        model = 'boxville5',
        brand = 'Brute',
        name = 'Armored Boxville',
        category = 'Vans',
        price = 1300000,
        stock = 3
    },
    {
        model = 'boxville6',
        brand = 'Brute',
        name = 'Boxville (LSDS)',
        category = 'Vans',
        price = 475000,
        stock = 3
    },
    {
        model = 'burrito',
        brand = 'Declasse',
        name = 'Burrito',
        category = 'Vans',
        price = 0,
        stock = 3
    },
    {
        model = 'burrito2',
        brand = 'Declasse',
        name = 'Bugstars Burrito',
        category = 'Vans',
        price = 598500,
        stock = 3
    },
    {
        model = 'burrito3',
        brand = 'Declasse',
        name = 'Burrito',
        category = 'Vans',
        price = 25000,
        stock = 3
    },
    {
        model = 'burrito4',
        brand = 'Declasse',
        name = 'Burrito',
        category = 'Vans',
        price = 0,
        stock = 3
    },
    {
        model = 'burrito5',
        brand = 'Declasse',
        name = 'Burrito',
        category = 'Vans',
        price = 0,
        stock = 3
    },
    {
        model = 'camper',
        brand = 'Brute',
        name = 'Camper',
        category = 'Vans',
        price = 0,
        stock = 3
    },
    {
        model = 'gburrito',
        brand = 'Declasse',
        name = 'Gang Burrito',
        category = 'Vans',
        price = 0,
        stock = 3
    },
    {
        model = 'gburrito2',
        brand = 'Declasse',
        name = 'Gang Burrito',
        category = 'Vans',
        price = 86450,
        stock = 3
    },
    {
        model = 'journey',
        brand = 'Zirconium',
        name = 'Journey',
        category = 'Vans',
        price = 15000,
        stock = 3
    },
    {
        model = 'journey2',
        brand = 'Zirconium',
        name = 'Journey II',
        category = 'Vans',
        price = 790000,
        stock = 3
    },
    {
        model = 'minivan',
        brand = 'Vapid',
        name = 'Minivan',
        category = 'Vans',
        price = 22000,
        stock = 3
    },
    {
        model = 'minivan2',
        brand = 'Vapid',
        name = 'Minivan Custom',
        category = 'Vans',
        price = 330000,
        stock = 3
    },
    {
        model = 'paradise',
        brand = 'Bravado',
        name = 'Paradise',
        category = 'Vans',
        price = 25000,
        stock = 3
    },
    {
        model = 'pony',
        brand = 'Brute',
        name = 'Pony',
        category = 'Vans',
        price = 0,
        stock = 3
    },
    {
        model = 'pony2',
        brand = 'Brute',
        name = 'Pony',
        category = 'Vans',
        price = 0,
        stock = 3
    },
    {
        model = 'rumpo',
        brand = 'Bravado',
        name = 'Rumpo',
        category = 'Vans',
        price = 28000,
        stock = 3
    },
    {
        model = 'rumpo2',
        brand = 'Bravado',
        name = 'Rumpo',
        category = 'Vans',
        price = 0,
        stock = 3
    },
    {
        model = 'rumpo3',
        brand = 'Bravado',
        name = 'Rumpo Custom',
        category = 'Vans',
        price = 130000,
        stock = 3
    },
    {
        model = 'speedo',
        brand = 'Vapid',
        name = 'Speedo',
        category = 'Vans',
        price = 30000,
        stock = 2
    },
    {
        model = 'speedo2',
        brand = 'Vapid',
        name = 'Clown Van',
        category = 'Vans',
        price = 0,
        stock = 3
    },
    {
        model = 'speedo4',
        brand = 'Vapid',
        name = 'Speedo Custom',
        category = 'Vans',
        price = 0,
        stock = 3
    },
    {
        model = 'speedo5',
        brand = 'Vapid',
        name = 'Speedo Custom',
        category = 'Vans',
        price = 0,
        stock = 3
    },
    {
        model = 'surfer',
        brand = 'BF',
        name = 'Surfer',
        category = 'Vans',
        price = 18000,
        stock = 2
    },
    {
        model = 'surfer2',
        brand = 'BF',
        name = 'Surfer',
        category = 'Vans',
        price = 0,
        stock = 3
    },
    {
        model = 'surfer3',
        brand = 'BF',
        name = 'Surfer Custom',
        category = 'Vans',
        price = 590000,
        stock = 3
    },
    {
        model = 'taco',
        brand = 'Brute',
        name = 'Taco Van',
        category = 'Vans',
        price = 345000,
        stock = 3
    },
    {
        model = 'youga',
        brand = 'Bravado',
        name = 'Youga',
        category = 'Vans',
        price = 26000,
        stock = 2
    },
    {
        model = 'youga2',
        brand = 'Bravado',
        name = 'Youga Classic',
        category = 'Vans',
        price = 195000,
        stock = 3
    },
    {
        model = 'youga3',
        brand = 'Bravado',
        name = 'Youga Classic 4x4',
        category = 'Vans',
        price = 1288000,
        stock = 3
    },
    {
        model = 'youga4',
        brand = 'Vapid',
        name = 'Youga Custom',
        category = 'Vans',
        price = 0,
        stock = 3
    },
    {
        model = 'youga5',
        brand = 'Vapid',
        name = 'Youga Custom',
        category = 'Vans',
        price = 0,
        stock = 3
    },

    -- Coupes
    {
        model = 'cogcabrio',
        brand = 'Enus',
        name = 'Cognoscenti Cabrio',
        category = 'Coupes',
        price = 185000,
        stock = 2
    },
    {
        model = 'driftfr36',
        brand = 'Fathom',
        name = 'FR36',
        category = 'Coupes',
        price = 200000,
        stock = 2
    },
    {
        model = 'driftsentinel2',
        brand = 'Ubermacht',
        name = 'Sentinel XS',
        category = 'Coupes',
        price = 200000,
        stock = 2
    },
    {
        model = 'eurosx32',
        brand = 'Annis',
        name = 'Euros X32',
        category = 'Coupes',
        price = 1499000,
        stock = 2
    },
    {
        model = 'eurosx32_hsw',
        brand = 'Annis',
        name = 'Euros X32',
        category = 'Coupes',
        price = 1200000,
        stock = 2
    },
    {
        model = 'exemplar',
        brand = 'Dewbauchee',
        name = 'Exemplar',
        category = 'Coupes',
        price = 40000,
        stock = 1
    },
    {
        model = 'f620',
        brand = 'Ocelot',
        name = 'F620',
        category = 'Coupes',
        price = 80000,
        stock = 2
    },
    {
        model = 'felon',
        brand = 'Lampadati',
        name = 'Felon',
        category = 'Coupes',
        price = 31000,
        stock = 2
    },
    {
        model = 'felon2',
        brand = 'Lampadati',
        name = 'Felon GT',
        category = 'Coupes',
        price = 37000,
        stock = 1
    },
    {
        model = 'fr36',
        brand = 'Fathom',
        name = 'FR36',
        category = 'Coupes',
        price = 1610000,
        stock = 2
    },
    {
        model = 'jackal',
        brand = 'Ocelot',
        name = 'Jackal',
        category = 'Coupes',
        price = 29000,
        stock = 2
    },
    {
        model = 'kanjosj',
        brand = 'Dinka',
        name = 'Kanjo SJ',
        category = 'Coupes',
        price = 1370000,
        stock = 2
    },
    {
        model = 'oracle',
        brand = 'Ubermacht',
        name = 'Oracle XS',
        category = 'Coupes',
        price = 82000,
        stock = 2
    },
    {
        model = 'oracle2',
        brand = 'Ubermacht',
        name = 'Oracle',
        category = 'Coupes',
        price = 35000,
        stock = 2
    },
    {
        model = 'postlude',
        brand = 'Dinka',
        name = 'Postlude',
        category = 'Coupes',
        price = 1310000,
        stock = 2
    },
    {
        model = 'previon',
        brand = 'Karin',
        name = 'Previon',
        category = 'Coupes',
        price = 1490000,
        stock = 2
    },
    {
        model = 'sentinel',
        brand = 'Ubermacht',
        name = 'Sentinel XS',
        category = 'Coupes',
        price = 60000,
        stock = 2
    },
    {
        model = 'sentinel_hsw',
        brand = 'Ubermacht',
        name = 'Sentinel XS',
        category = 'Coupes',
        price = 1374000,
        stock = 2
    },
    {
        model = 'sentinel2',
        brand = 'Ubermacht',
        name = 'Sentinel',
        category = 'Coupes',
        price = 95000,
        stock = 2
    },
    {
        model = 'windsor',
        brand = 'Enus',
        name = 'Windsor',
        category = 'Coupes',
        price = 845000,
        stock = 2
    },
    {
        model = 'windsor2',
        brand = 'Enus',
        name = 'Windsor Drop',
        category = 'Coupes',
        price = 900000,
        stock = 2
    },
    {
        model = 'zion',
        brand = 'Ubermacht',
        name = 'Zion',
        category = 'Coupes',
        price = 32000,
        stock = 2
    },
    {
        model = 'zion2',
        brand = 'Ubermacht',
        name = 'Zion Cabrio',
        category = 'Coupes',
        price = 36000,
        stock = 1
    },

}