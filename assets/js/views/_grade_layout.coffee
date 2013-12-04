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
        grade: (d) =>
          d.length / LNT.getTotalCount(@options.psd) + .20
      }, {
        countCalc: (d) -> _.keys(d).length
        title: "Different fonts in use"
        data: LNT.getFontNames(@options.psd)
        view: 'FontsUsed'
        grade: (d) -> 4 / _.keys(d).length
      }, {
        countCalc: (d) -> _.keys(d).length
        title: "Blending modes used"
        data: LNT.getBlendingModes(@options.psd)
        view: 'BlendingModes'
        grade: (d) -> undefined
      }, {
        countCalc:(d) -> _.keys(d).length
        title: "Different font sizes"
        data: LNT.getFontSizes(@options.psd)
        view: 'FontSizes'
        grade: (d) -> 6  / _.keys(d).length
      }, {
        countCalc: (d) -> d.length
        title: "Empty Groups"
        data: LNT.getEmptyGroups(@options.psd)
        view: 'EmptyGroups'
        grade: (d) ->
          if d.length
            return 0
          1
      }])

      @results.show new Views.Results(
        collection: list
      )
