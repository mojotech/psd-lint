App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.BadLayers extends Marionette.CollectionView
    tagName: 'ul'
    __name__: "Bad Layers"
    constructor: ->
      super
      unless @collection
        @collection = new Backbone.Collection _.map(
          @model.get('data'), (v) -> {name: v}
        )

    getItemView: ->
      class SingleLayer extends Backbone.Marionette.ItemView
        tagName: 'li'
        className: 'layer-name text-orb'
        template: _.template("<%- name %>")
