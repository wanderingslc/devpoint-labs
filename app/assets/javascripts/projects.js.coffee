# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> 
  $('.carousel').carousel()
  $('.has_tooltip').tooltip()
  
  $('.project-tile').hover ->
    $(this).children('.project-title').slideToggle(300)

  $('.project-thumbnails img').on 'click', ->
    $(this).closest('.modal-body').find('.featured-image').attr('src', $(this).attr('data-url'))
    
