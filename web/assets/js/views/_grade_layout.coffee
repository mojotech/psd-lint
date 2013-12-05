App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.GradeLayout extends Marionette.Layout
    __name__: "Grade Layout"
    template: templates.grade_layout
    regions:
      'results': '.results'

    onRender: ->
      list = new Backbone.Collection([
        new App.Models.PoorlyNamed
          data: LNT.getBadLayerNames(@options.psd)
          psd: @options.psd
      ,
        new App.Models.FontCounter
          data: LNT.getFontNames(@options.psd)
      ,
        new App.Models.BlendingModes
          data: LNT.getBlendingModes(@options.psd)
      ,
        new App.Models.FontSizes
          data: LNT.getFontSizes(@options.psd)
      ,
        new App.Models.EmptyGroups
          data: LNT.getEmptyGroups(@options.psd)
      ])

      @results.show new Views.Results(
        collection: list
      )
