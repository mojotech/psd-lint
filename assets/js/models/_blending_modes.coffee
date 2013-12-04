App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.BlendingModes extends Backbone.Model
    defaults: ->
      title: "Blending modes used"
      view: 'BlendingModes'
      resultTemplate: templates.blending_mode_result
      hasBadBlendingModes: @hasBadBlendingModes

    countCalc: (d) -> _.keys(d).length

    hasBadBlendingModes: =>
      bad = false
      _(@get('data')).keys().each (n) =>
        bad = true if n isnt 'passthru' and n isnt 'normal'
      bad
