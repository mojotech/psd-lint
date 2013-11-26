App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.FontUsed extends Marionette.Layout
    template: templates.font_used
    tagName: 'li'
    className: 'font-used'
    regions:
      'expandable': '.expandable-content'

    onShow: ->
      @expandable.show new Views.BadLayers({
        collection: new Backbone.Collection(
          _.map(@model.get('layers'), (v) -> {name: v})
        )
      })
