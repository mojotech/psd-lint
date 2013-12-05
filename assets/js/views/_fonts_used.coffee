App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.FontsUsed extends Views.ExpandableLayers
    __name__: "Fonts Used"
    getItemView: -> Views.FontUsed
