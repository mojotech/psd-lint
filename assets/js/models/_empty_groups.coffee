App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.EmptyGroups extends Backbone.Model
    defaults:
      title: "Empty Groups"
      view: 'EmptyGroups'

    countCalc: (d) -> d.length
    grade: (d) ->
      if d.length
        return 0
      1
