class @Steps

  constructor: (selector) ->
    @steps_cnt=0
    @add_step=$('<input class="btn btn-default form-group" id="add-step-button" type="button" value="Add step"/>')
    @add_step.click =>
      step = new Steps.Step(@)
    $(selector).append(@add_step)
    step = new Steps.Step(@)

  add_new_step: (step) ->
    @steps_cnt+=1
    step.insertBefore(@add_step)

  remove_step: (step) ->
    if @steps_cnt == 1
      alert("Can't remove all steps")
    else
      # step.remove()
      step.summernote('destroy')
      step.remove()
      @steps_cnt-=1