module.exports =
  ignore_files: ['_*', 'readme*', '.gitignore',
    '.DS_Store', 'layout.jade', 'app.rb', 'config.ru', 'Gemfile',
    'Gemfile.lock', 'readme.md'
    ]
  ignore_folders: ['.git']

  watcher_ignore_folders: ['components']

  locals: module.require('./assets/js/config')
  templates: 'assets/js/templates'
