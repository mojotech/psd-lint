App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.ResultRow extends Marionette.Layout
    tagName: 'li'
    getTemplate: ->
      if @model.get('resultTemplate')?
        return @model.get('resultTemplate')
      templates.result_row

    className: 'result'
    regions:
      expandableContent: '.expandable-content'

    events:
      'click .expand': 'expandRow'

    expandRow: ->
      @$el.toggleClass 'expanded'

    serializeData: ->
      _.extend {}, @model.attributes,
        grade: @model.grade?(@model.get('data'))

    templateHelpers: ->
      countCalulation: @model.countCalc

    onShow: ->
      v = App.Views[@model.get('view')]
      @expandableContent.show new v(model: @model)
