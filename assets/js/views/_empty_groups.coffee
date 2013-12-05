App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.EmptyGroups extends Views.BadLayers
    __name__: "Empty Groups"
    className: 'empty-groups'
