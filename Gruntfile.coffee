module.exports = (grunt) ->
  remapify = require 'remapify'
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-browserify')

  grunt.initConfig

    browserify:
      dist:
        src: 'js/**/*.coffee'
        dest: 'build/bundle.js'
        options: transform: ['coffeeify']
      test:
        files: "build/testBundle.js": ["test/**/*.coffee"]
        options:
          debug: true
          alias: ['./js/encryptor.coffee:encryptor']
          transform: ['coffeeify']


    watch:
      coffee:
        files: ['js/*.coffee']
        tasks: ['browserify:dist']
      testCoffee:
        files: 'test/**/*.coffee'
        tasks: ['browserify:test']
