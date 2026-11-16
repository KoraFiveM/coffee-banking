fx_version('cerulean')
game('gta5')

name('coffee-banking')
author('Kora Framework')
description('Example banking presentation: whole yen and a classic Windows desktop skin')
version('0.1.0')

dependency('kora_banking')
dependency('kora_lib')

client_scripts({
    '@kora_lib/init.lua',
    'client.lua',
})

files({
    'web/windows97.css',
})

server_scripts({
    '@kora_lib/init.lua',
    'server.lua',
})
