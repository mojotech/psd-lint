App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.FontCounter extends Backbone.Model
    defaults:
      title: "Different fonts in use"
      view: 'FontsUsed'

    countCalc: (d) -> _.keys(d).length
    grade: (d) -> 4 / @countCalc(d)
