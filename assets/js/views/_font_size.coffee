App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.FontSize extends Views.LayerExpandable
    tagName: 'li'
    className: ->
      super + ' font-size'
    getTemplate: -> templates.font_size
