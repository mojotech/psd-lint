App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.FontCounter extends Models.LintResult
    defaults:
      title: "Different fonts in use"
      view: 'FontsUsed'

    grade: (d) -> 4 / @countCalc(d)
