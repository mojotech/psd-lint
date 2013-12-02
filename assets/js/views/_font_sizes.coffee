App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.FontSizes extends Views.ExpandableLayers
    getItemView: -> Views.FontSize
