App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.FontsUsed extends Marionette.CollectionView
    tagName: 'ul'
    className: 'badLayers'
    constructor: ->
      super

      @collection = new Backbone.Collection _.map(
          @model.get('data'),
          (v, k) ->
            v.name = k
            v
          , this
      )

    getItemView: ->
      class SingleLayer extends Backbone.Marionette.ItemView
        tagName: 'li'
        className: 'layer-name'
        attributes: ->
          "style": "font-family: #{@model.get('name')}, helvetica"
        template: _.template("<%- name %>")
