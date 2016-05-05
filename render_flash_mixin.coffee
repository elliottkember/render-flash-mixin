RenderFlashMixin =

  _flash: (colour) ->
    if @isMounted() # and not PRODUCTION
      @_show_flash(colour)
      setTimeout @_hide_flash, 400

  _show_flash: (colour) ->
    $j(@getDOMNode()).css({'outline': "2px solid #{colour}"})

  _hide_flash: ->
    $j(@getDOMNode()).css({'outline': "none"}) if @isMounted()

  componentDidMount: ->
    @_flash('red')

  componentDidUpdate: ->
    @_flash('green')
