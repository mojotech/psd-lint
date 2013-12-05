App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.ResultRow extends Marionette.Layout
    tagName: 'li'
    className: 'result'
    __name__: "Result Row"

    regions:
      expandableContent: '.expandable-content'

    events:
      'click .expand': 'expandRow'

    getTemplate: ->
      if @model.get('resultTemplate')?
        return @model.get('resultTemplate')
      templates.result_row

    expandRow: ->
      @$el.toggleClass 'expanded'

    serializeData: ->
      _.extend {}, @model.attributes,
        grade: @model.toLetter?(@model.grade?(@model.get('data')))

    templateHelpers: ->
      countCalulation: @model.countCalc

    onShow: ->
      v = App.Views[@model.get('view')]
      @expandableContent.show new v(model: @model)

    onDomRefresh: -> @$('[title]').tooltip()
