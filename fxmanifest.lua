fx_version 'adamant'

game 'gta5'

description 'rewards'

version '1.2.1'

files {
	'html/index.html',

	'html/jquery.countdown.min.js',
	'html/config.js',
	'html/script.js',
	
	'html/style.css'
}

ui_page {
	'html/index.html'
}

server_scripts {
	'config.lua',
	'server/server.lua',
	'version.lua',
	'@mysql-async/lib/MySQL.lua'
}

client_scripts {
    'config.lua',
	'client/client.lua'
}
