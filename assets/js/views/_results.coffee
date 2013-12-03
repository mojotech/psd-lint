App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.Results extends Marionette.CollectionView
    tagName: 'ul'
    getItemView: -> Views.ResultRow
