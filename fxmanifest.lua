fx_version 'cerulean'
games { 'gta5' }
version '1.0.0'

client_scripts {
    'client/*.lua'
}

files {
    'ui/dist/**'
}

ui_page 'ui/dist/index.html'

dependencies {
    'ox_lib'
}
