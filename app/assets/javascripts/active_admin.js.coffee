#= require active_admin/base
#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require highcharts
#= require chartkick
#= require best_in_place
#= require jquery.purr
#= require best_in_place.purr
#= require ./init
#= require ./question_index

$(document).ready ->
  jQuery(".best_in_place").best_in_place()
