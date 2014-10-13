gulp = require 'gulp'
slim = require 'gulp-slim'
less = require 'gulp-less'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
minify = require 'gulp-minify-css'
uglify = require 'gulp-uglify'
plumber = require 'gulp-plumber'
webserver = require 'gulp-webserver'

gulp.task 'slim', ->
  gulp.src './src/slim/*.slim'
  .pipe plumber()
  .pipe slim pretty: true
  .pipe gulp.dest './dist/'

gulp.task 'less', ->
  gulp.src './src/less/*.less'
  .pipe plumber()
  .pipe less comprss: true
  .pipe concat 'style.min.css'
  .pipe minify keepBreaks: false
  .pipe gulp.dest './dist/css/'

gulp.task 'coffee', ->
  gulp.src './src/coffee/*.coffee'
  .pipe plumber()
  .pipe coffee()
  .pipe concat 'all.min.js'
  .pipe uglify()
  .pipe gulp.dest './dist/js/'

gulp.task 'watch', ['slim', 'less', 'coffee'], ->
  gulp.watch './src/slim/*.slim', ['slim']
  gulp.watch './src/less/*.less', ['less']
  gulp.watch './src/coffee/*.coffee', ['coffee']

gulp.task 'webserver', ->
  gulp.src './dist/'
  .pipe webserver livereload: false

gulp.task 'default', ['slim', 'less', 'coffee', 'watch', 'webserver']
