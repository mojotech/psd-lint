App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.ResultRow extends Marionette.Layout
    tagName: 'li'
    template: templates.result_row
    className: 'result'
