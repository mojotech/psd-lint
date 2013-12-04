App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.BlendingMode extends Views.LayerExpandable
    template: templates.blending_mode
    tagName: 'li'
    isABadLayerName: ->
      n = @model.get('name')
      n isnt 'passthru' and n isnt 'normal'

    serializeData: ->
      _.extend {}, @model.attributes,
        badLayerName: @isABadLayerName()

    className: ->
     super + ' blending-mode'

    onShow: -> @$('[title]').tooltip()

