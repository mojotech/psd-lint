module.exports =
  ignore_files: [
    '_*',
    'readme*',
    'Dockerfile'
    ]
  ignore_folders: ['.git', 'config']

  watcher_ignore_folders: ['components']

  locals: module.require('./assets/js/config')
  templates: 'assets/js/templates'
