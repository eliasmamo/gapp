gulp        = require "gulp"
jade        = require "gulp-jade"
sass        = require "gulp-sass"
sourcemaps  = require "gulp-sourcemaps"
coffee      = require "gulp-coffee"
concat      = require "gulp-concat"
nodemon     = require "gulp-nodemon"
clean       = require "gulp-clean"
wrap        = require "gulp-wrap-amd"

paths       = require "./config/paths"

gulp.task "compileVendorStyles", ->
  gulp.src paths.app_vendor_styles
    .pipe sourcemaps.init()
    .pipe concat "vendor.css"
    .pipe sourcemaps.write()
    .pipe gulp.dest paths.pub_vendor_styles

gulp.task 'compileAppStyles', ->
  gulp.src paths.app_styles
    .pipe sass()
    .pipe concat "application.css"
    .pipe gulp.dest paths.pub_app_styles

gulp.task "cleanVendorScripts", ->
  gulp.src paths.pub_vendor_js, read: false
    .pipe clean force: true

gulp.task "compileVendorScripts", ["cleanVendorScripts"], ->
  gulp.src paths.app_vendor_js
    .pipe gulp.dest paths.pub_vendor_js

gulp.task "cleanAppScripts", ->
  gulp.src paths.pub_app_scripts, read: false
    .pipe clean force: true

gulp.task "compileAppScripts", ["cleanAppScripts"], ->
  gulp.src paths.app_scripts
    .pipe coffee()
    .pipe gulp.dest paths.pub_app_scripts

gulp.task "compileTemplateScripts", ["cleanAppScripts"], ->
  gulp.src paths.app_templates
    .pipe jade client: true
    .pipe wrap deps: ['runtime'], params: ['jade']
    .pipe gulp.dest paths.pub_app_scripts

gulp.task "watch", ->
  gulp.watch paths.app_styles,    ["compileAppStyles"]
  gulp.watch paths.app_scripts,   ["compileVendorScripts", "compileAppScripts", "compileTemplateScripts"]
  gulp.watch paths.app_templates, ["compileVendorScripts", "compileAppScripts", "compileTemplateScripts"]
  return

gulp.task "default"
, [
    "compileVendorStyles"
    "compileAppStyles"
    "compileVendorScripts"
    "compileTemplateScripts"
    "compileAppScripts"
    "watch"
  ]
, ->
  nodemon
    script: "app.coffee"
    nodeArgs: ['--nodejs', '--debug']
  return