App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.GradeLayout extends Marionette.Layout
    template: templates.grade_layout
    regions:
      'results': '.results'

    onRender: ->
      list = new Backbone.Collection([{
        count: "22",
        title: "foo bar"
      }, {
        count: "3",
        title: "sample bat"
      }, {
        count: "83",
        title: "bam bam pow"
      }])

      @results.show new Views.Results(
        collection: list
      )
