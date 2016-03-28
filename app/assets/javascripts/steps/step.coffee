class @Steps.Step
  constructor: (@steps) ->

    @step_input=$('<div class="form-control step_input step-text-area" name="step[]"/>')
    @steps.add_new_step(@step_input)
    @step_input.summernote({ height: 120,focus: true, callbacks: {onInit: @destroy_button} })

  destroy_button: =>
    destroyBtn = $('<button type="button" class="btn btn-default btn-sm btn-small remove-step" title="Remove Step" tabindex="-1"><i class="fa fa-remove"></i></button>');
    destroyBtn.tooltip({container: 'body', placement: 'bottom'});
    fileGroup = $('<div class="note-file btn-group destroy-btn-group"/>');
    fileGroup.append(destroyBtn)
    fileGroup.appendTo(@step_input.next('div.note-editor').find('.note-toolbar'));
    destroyBtn.click =>
      $('#'+destroyBtn.attr('aria-describedby')).remove();
      @steps.remove_step(@step_input)