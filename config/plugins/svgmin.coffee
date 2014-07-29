module.exports = (lineman) ->
  app = lineman.config.application

  files:
    svgmin:
      cwd: 'dist/img'
      dest: 'dist/img'
      src: '{,*/}*.svg'

  config:
    loadNpmTasks: app.loadNpmTasks.concat('grunt-svgmin')

    appendTasks:
      dist: app.appendTasks.dist.concat('svgmin')

    svgmin:
      dist:
        expand: true,
        cwd: '<%= files.svgmin.cwd %>'
        src: '<%= files.svgmin.src %>'
        dest: '<%= files.svgmin.dest %>'
