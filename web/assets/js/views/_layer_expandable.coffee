App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.LayerExpandable extends Marionette.Layout
    __name__: "Layer Expandable"
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
      @$el.toggleClass 'expanded'
