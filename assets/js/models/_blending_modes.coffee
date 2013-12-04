App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.BlendingModes extends Backbone.Model
    defaults:
      title: "Blending modes used"
      view: 'BlendingModes'

    countCalc: (d) -> _.keys(d).length
    grade: (d) -> undefined
