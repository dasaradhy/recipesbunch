class @Steps.Step
  constructor: (@steps,value="") ->

    @step_input=$('<textarea class="form-control step_input step-text-area" name="recipe[steps][]">'+value+'</textarea>')
    @steps.add_new_step(@step_input)
    @step_input.summernote({focus: true, callbacks: {onInit: @destroy_button, onImageUpload: @on_image_upload, onChange: @on_change} })

  destroy_button: =>
    destroyBtn = $('<button type="button" class="btn btn-default btn-sm btn-small remove-step" title="Remove Step" tabindex="-1"><i class="fa fa-remove"></i></button>');
    destroyBtn.tooltip({container: 'body', placement: 'bottom'});
    fileGroup = $('<div class="note-file btn-group destroy-btn-group"/>');
    fileGroup.append(destroyBtn)
    fileGroup.appendTo(@step_input.next('div.note-editor').find('.note-toolbar'));
    destroyBtn.click =>
      $('#'+destroyBtn.attr('aria-describedby')).remove();
      @steps.remove_step(@step_input)

  on_image_upload: (files) =>
    @send_file files[0],(data) =>
      @step_input.summernote("insertImage",data.url)
      $("img[src='"+data.url+"']").addClass('processed');
      $("form[form_for='recipe']").append('<input type="hidden" name="recipe[images][]" value="'+data.url+'">');


  on_change: (content) =>
    image=@step_input.next().find('img:not(.processed)')
    if image.length > 0
      $.get '/images', {image_url: escape(image.attr('src'))}, (data)=>
        #image.attr('src',data.url);
        image.replaceWith('<img class="processed" src="'+data.url+'"/>');
        $("form[form_for='recipe']").append('<input type="hidden" name="recipe[images][]" value="'+data.url+'"/>');
        # @step_input.summernote('insertNode',$('<br/>'));
        @step_input.summernote('editor.insertText','');
        # #image.addClass('processed')
        #@step_input.summernote("focus")

  send_file: ( file, callback ) =>
    data = new FormData()
    data.append("file", file)
    $.ajax {
      url: '/images',
      data: data,
      cache: false,
      contentType: false,
      processData: false,
      type: 'POST',
      success: (data) ->
        callback(data)
    }