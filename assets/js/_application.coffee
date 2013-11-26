window.App = new Backbone.Marionette.Application

App.on 'initialize:after', ->
  App.addRegions 'appRegion': '#app'
  App.appRegion.show new App.Views.GradeLayout
