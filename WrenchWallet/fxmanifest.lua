author "The Wrench"
description "WALLETS YEAH"
version "1.5"

fx_version "cerulean"
game "gta5"
lua54 "yes"

shared_script {
    '@ox_lib/init.lua',
}
server_scripts {"server.lua"}
client_scripts {
    "client.lua",
}

dependencies {
    "ox_lib"
}
