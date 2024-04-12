author "The Wrench"
description "Leo car renting"
version "1.5"

fx_version "cerulean"
game "gta5"
lua54 "yes"

shared_script {
    '@ox_lib/init.lua',
    '@ND_Core/init.lua',
    "config.lua"
}
server_scripts {"server.lua"}
client_scripts {
    "client.lua",
}

dependencies {
    "ND_Core",
    "ox_lib"
}
