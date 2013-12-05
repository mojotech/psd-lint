App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.ExpandableLayers extends Marionette.CollectionView
    tagName: 'ul'
    __name__: "Expandable Layers"
    constructor: ->
      super

      @collection = new Backbone.Collection _.map(
          @model.get('data'),
          (v, k) ->
            v.name = k
            v
          , this
      )
