App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.FontSizes extends Marionette.CollectionView
    tagName: 'ul'
    className: 'fontSizes'

    constructor: ->
      super

      @collection = new Backbone.Collection _.map(
          @model.get('data'),
          (v, k) ->
            v.name = k
            v
          , this
      )

    getItemView: -> Views.FontSize
