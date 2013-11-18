$('.project-info').html("<%= escape_javascript( render 'projects/project_modal', project: @project ) %>")
$("#project-<%=@project.id %>").modal('show')
$('.project-thumbnails img').on 'click', ->
  $(this).closest('.modal-body').find('.featured-image').attr('src', $(this).attr('data-url'))