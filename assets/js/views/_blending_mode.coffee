App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.BlendingMode extends Views.LayerExpandable
    template: templates.blending_mode
    tagName: 'li'
    __name__: "Blending Mode"
    isABadLayerName: ->
      n = @model.get('name')
      n isnt 'passthru' and n isnt 'normal'

    serializeData: ->
      _.extend {}, @model.attributes,
        badLayerName: @isABadLayerName()

    className: ->
     super + ' blending-mode'

    onDomRefresh: -> @$('[title]').tooltip()

