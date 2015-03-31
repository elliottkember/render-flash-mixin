RenderFlashMixin =

  _flash: (colour) ->
    # We only want to display this outline in development mode!
    # Unfortunately, React doesn't seem to expose its development/production mode
    # easily, so we have to use a constant here.
    # Uncomment this and replace PRODUCTION with whatever your system uses to detect prod/dev environments.
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
