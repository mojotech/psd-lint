App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.EmptyGroups extends Models.LintResult
    defaults:
      title: "Empty Groups"
      view: 'EmptyGroups'

    countCalc: (d) -> d.length
    grade: (d) ->
      if @countCalc(d)
        return 0
      1
