fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Arda Fuat'
description 'ArdaFuat Showroom - QBCore vehicle showroom/catalog system with locale support and GitHub update checker'
version '1.1.0'

shared_scripts {
    'config.lua',
    'locales/*.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/app.js',
    'html/vehicledata.json'
}

dependencies {
    'qb-core',
    'qb-target'
}
