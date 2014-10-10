gulp = require 'gulp'
slim = require 'gulp-slim'
less = require 'gulp-less'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
minify = require 'gulp-minify-css'
uglify = require 'gulp-uglify'

gulp.task 'slim', ->
  gulp.src './src/slim/*.slim'
  .pipe slim pretty: true
  .pipe gulp.dest './dist/'

gulp.task 'less', ->
  gulp.src './src/less/*.less'
  .pipe less comprss: true
  .pipe concat 'style.min.css'
  .pipe minify keepBreaks: false
  .pipe gulp.dest './dist/css/'

gulp.task 'coffee', ->
  gulp.src './src/coffee/*.coffee'
  .pipe coffee()
  .pipe concat 'all.min.js'
  .pipe uglify()
  .pipe gulp.dest './dist/js/'

gulp.task 'watch', ->
  gulp.watch './src/slim/*.slim', (event) ->
    gulp.run 'slim'
  gulp.watch './src/less/*.less', (event) ->
    gulp.run 'less'
  gulp.watch './src/coffee/*.coffee', (event) ->
    gulp.run 'coffee'

gulp.task 'default', ->
  gulp.run 'slim'
  gulp.run 'less'
  gulp.run 'coffee'
  gulp.run 'watch'
