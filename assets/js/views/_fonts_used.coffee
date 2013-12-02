App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.FontsUsed extends Views.ExpandableLayers
    getItemView: -> Views.FontUsed
