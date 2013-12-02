App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.GradeLayout extends Marionette.Layout
    template: templates.grade_layout
    regions:
      'results': '.results'

    onRender: ->
      list = new Backbone.Collection([{
        count: LNT.getBadLayerNames(@options.psd).length,
        title: "Poorly named layers"
        data: LNT.getBadLayerNames(@options.psd),
        view: 'BadLayers'
      }, {
        count: _.keys(LNT.getFontNames(@options.psd)).length,
        title: "Different fonts in use"
        data: LNT.getFontNames(@options.psd)
        view: 'FontsUsed'
      }, {
        count: _.keys(LNT.getBlendingModes(@options.psd)).length,
        title: "Blending modes used"
        data: LNT.getBlendingModes(@options.psd)
        view: 'BlendingModes'
      }, {
        count: _.keys(LNT.getFontSizes(@options.psd)).length,
        title: "Different font sizes"
        data: LNT.getFontSizes(@options.psd)
      }, {
        count: LNT.getEmptyGroups(@options.psd).length,
        title: "Empty Groups"
        data: LNT.getEmptyGroups(@options.psd)
      }])

      @results.show new Views.Results(
        collection: list
      )
