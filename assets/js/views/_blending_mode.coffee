App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.BlendingMode extends Views.LayerExpandable
    template: templates.blending_mode
    tagName: 'li'
    className: ->
     super + ' blending-mode'
