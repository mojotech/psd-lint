App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.BlendingMode extends Views.LayerExpandable
    template: templates.blending_mode
    tagName: 'li'
    className: 'blending-mode'
    events:
      'click .used-in-count': 'expandRow'

    expandRow: ->
      @$('.expandable-content').toggle()
