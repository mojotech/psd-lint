App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.FontUsed extends Views.LayerExpandable
    template: templates.font_used
    tagName: 'li'
    className: 'font-used'

    events:
      'click .used-in-count': 'expandRow'

    expandRow: ->
      @$('.expandable-content').toggle()
