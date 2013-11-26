window.App = new Backbone.Marionette.Application

App.on 'initialize:after', ->
  new App.Views.GradeLayout({
    el: '#app'
  }).render()
