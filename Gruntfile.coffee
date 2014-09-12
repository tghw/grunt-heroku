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

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.registerTask('default', ['coffee:dev', 'watch'])
