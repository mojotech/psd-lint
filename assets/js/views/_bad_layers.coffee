App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.BadLayers extends Marionette.CollectionView
    tagName: 'ul'
    className: 'badLayers'
    constructor: ->
      super
      @collection = new Backbone.Collection _.map(
        @model.get('data'), (v) -> {name: v}
      )

    getItemView: ->
      class SingleLayer extends Backbone.Marionette.ItemView
        tagName: 'li'
        className: 'layer-name'
        template: _.template("<%- name %>")
