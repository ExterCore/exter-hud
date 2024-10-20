fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author "sobing"

description "exter-hud | HUD System LiKE 4.0"

version '1.0'

ui_page 'web/index.html'

client_scripts {
	'client/client.lua',
	'client/open_client.lua',
	'client/cl_pursuit.lua',
}

shared_script {
	'shared/config.lua',
}

server_script {
	'server/server.lua',
	'server/sv_pursuit.lua',
}

files {
	'UI/*',
}