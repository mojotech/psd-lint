App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.LintResult extends Backbone.Model
    toLetter: (percent) ->
      if percent >= .90
        return 'A'
      if percent >= .76
        return 'B'
      if percent >= .65
        return 'C'
      if percent >= .58
        return 'D'
      'F'

    countCalc: (d) -> _.keys(d).length
