App.module "Routers", (Routers, App, Backbone, Marionette, $, _) ->
  Routers.AppRouter = new (Backbone.Marionette.AppRouter.extend
    routes:
      '': 'app'

    app: ->
      App.addRegions 'appRegion': '#app'
      App.appRegion.show new App.Views.Upload
  )

