App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.FontUsed extends Views.LayerExpandable
    __name__: "Single Font"
    template: templates.font_used
    tagName: 'li'
    className: ->
      super + ' font-used'
