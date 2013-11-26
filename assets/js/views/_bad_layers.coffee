App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.BadLayers extends Marionette.CollectionView
    tagName: 'ul'
    className: 'bad-layers'
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
