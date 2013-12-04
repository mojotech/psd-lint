App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.GradeLayout extends Marionette.Layout
    template: templates.grade_layout
    regions:
      'results': '.results'

    onRender: ->
      list = new Backbone.Collection([{
        countCalc: (d) -> d.length
        title: "Poorly named layers"
        data: LNT.getBadLayerNames(@options.psd),
        view: 'BadLayers'
      }, {
        countCalc: (d) -> _.keys(d).length
        title: "Different fonts in use"
        data: LNT.getFontNames(@options.psd)
        view: 'FontsUsed'
      }, {
        countCalc: (d) -> _.keys(d).length
        title: "Blending modes used"
        data: LNT.getBlendingModes(@options.psd)
        view: 'BlendingModes'
      }, {
        countCalc:(d) -> _.keys(d).length
        title: "Different font sizes"
        data: LNT.getFontSizes(@options.psd)
        view: 'FontSizes'
      }, {
        countCalc: (d) -> d.length
        title: "Empty Groups"
        data: LNT.getEmptyGroups(@options.psd)
        view: 'EmptyGroups'
      }])

      @results.show new Views.Results(
        collection: list
      )
