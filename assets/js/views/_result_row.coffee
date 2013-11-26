App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.ResultRow extends Marionette.Layout
    tagName: 'li'
    template: templates.result_row
    className: 'result'
    regions:
      expandableContent: '.expandable-content'

    onShow: ->
      if @model?.get('view')?
        v = App.Views[@model.get('view')]
        @expandableContent.show new v(model: @model)