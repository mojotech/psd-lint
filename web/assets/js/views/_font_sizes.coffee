App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.FontSizes extends Views.ExpandableLayers
    __name__: "Font Sizes"
    getItemView: -> Views.FontSize
