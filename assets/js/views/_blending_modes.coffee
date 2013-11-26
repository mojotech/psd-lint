App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.BlendingModes extends Marionette.CollectionView
    tagName: 'ul'
    className: 'blendingModes'
    constructor: ->
      super

      @collection = new Backbone.Collection _.map(
          @model.get('data'),
          (v, k) ->
            {
              name: k
              layers: v
            }
      )

    getItemView: -> Views.BlendingMode
