fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'MandalinaV'
description 'Mandalina Showroom - Target only, config vehicle list with external detail merge'
version '1.5.0'

shared_scripts {
    'config.lua'
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
