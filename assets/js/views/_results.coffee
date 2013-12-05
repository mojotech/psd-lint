App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.Results extends Marionette.CompositeView
    getTemplate: -> templates.results
    itemViewContainer: 'ul'
    getItemView: -> Views.ResultRow

    serializeData: ->
      grades = _.filter @collection.map((m) ->
        return m.grade(m.get('data')) if m.grade?
      ), (v) -> return v?

      grade = (_.reduce grades, (m, n) -> m + n) / grades.length

      grade: grade
      letter: (new App.Models.LintResult).toLetter(grade)
