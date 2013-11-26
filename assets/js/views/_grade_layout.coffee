App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.GradeLayout extends Marionette.Layout
    template: templates.grade_layout
    regions:
      'results': '.results'

    onRender: ->
      list = new Backbone.Collection([{
        count: LNT.getBadLayerNames().length,
        title: "Poorly named layers"
        data: LNT.getBadLayerNames(),
        view: 'BadLayers'
      }, {
        count: _.keys(LNT.getFontNames()).length,
        title: "Different fonts in use"
        data: LNT.getFontNames()
      }, {
        count: _.keys(LNT.getBlendingModes()).length,
        title: "Blending modes used"
        data: LNT.getBlendingModes()
      }, {
        count: _.keys(LNT.getFontSizes()).length,
        title: "Different font sizes"
        data: LNT.getFontSizes()
      }, {
        count: LNT.getEmptyGroups().length,
        title: "Empty Groups"
        data: LNT.getEmptyGroups()
      }])

      @results.show new Views.Results(
        collection: list
      )
