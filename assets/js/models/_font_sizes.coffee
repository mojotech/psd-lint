App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.FontSizes extends Models.LintResult
    defaults:
      title: "Different font sizes"
      view: 'FontSizes'

    grade: (d) -> 6  / @countCalc(d)
