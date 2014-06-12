module.exports = (lineman) ->
  app = lineman.config.application

  files:
    svgmin:
      cwd: 'generated/img'
      dest: 'generated/img'
      src: '{,*/}*.svg'

  config:
    loadNpmTasks: app.loadNpmTasks.concat('grunt-svgmin')

    prependTasks:
      dist: app.prependTasks.dist.concat('svgmin')

    svgmin:
      dist:
        expand: true,
        cwd: '<%= files.svgmin.cwd %>'
        src: '<%= files.svgmin.src %>'
        dest: '<%= files.svgmin.dest %>'