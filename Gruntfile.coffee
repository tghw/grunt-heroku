module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    coffee:
      dev:
        options:
          bare: true
        files: [
          expand: true
          cwd: 'tasks/'
          src: ['*.coffee']
          dest: 'tasks/'
          ext: '.js'
        ]
    watch:
      coffee:
        files: ['tasks/*.coffee']
        tasks: ['coffee']
    gitcommit:
      compiled:
        options:
          ignoreEmpty: true
        files:
          src: ['tasks/heroku.js']
    bump:
      options:
        files: ['package.json']
        commit: true
        commitMessage: 'Release v%VERSION%'
        commitFiles: ['package.json']
        createTag: true
        tagName: 'v%VERSION%'
        push: true
        pushTo: 'origin'

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-bump')
  grunt.loadNpmTasks('grunt-git')
  grunt.registerTask('deploy', ['coffee:dev', 'gitcommit:compiled', 'bump'])
  grunt.registerTask('default', ['coffee:dev', 'watch'])

