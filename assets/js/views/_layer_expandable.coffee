App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.LayerExpandable extends Marionette.Layout
    regions:
      'expandable': '.expandable-content'

    className: -> "expandable-row"
    onShow: ->
      @expandable.show new Views.BadLayers({
        collection: new Backbone.Collection(
          _.map(@model.get('layers'), (v) -> {name: v})
        )
      })

    events:
      'click .used-in-count': 'expandRow'

    expandRow: ->
      @$('.expandable-content').toggle()
