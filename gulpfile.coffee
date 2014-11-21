gulp        = require "gulp"
jade        = require "gulp-jade"
nodemon     = require "gulp-nodemon"


gulp.task "default", [], ->
  nodemon
    script: "app.coffee"
    nodeArgs: ['--nodejs', '--debug']
  return