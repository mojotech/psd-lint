window.App = new Backbone.Marionette.Application

App.on 'initialize:after', ->
  Backbone.history.start()
