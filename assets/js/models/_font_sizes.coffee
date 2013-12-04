App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.FontSizes extends Backbone.Model
    defaults:
      title: "Different font sizes"
      view: 'FontSizes'

    countCalc: (d) -> _.keys(d).length
    grade: (d) -> 6  / _.keys(d).length
