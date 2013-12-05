App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
    __name__: "Upload"
  class Views.Upload extends Marionette.Layout
    className: 'uploader'
    getTemplate: ->
      if @uploadComplete
        return templates.processing

      templates.uploader

    templateHelpers:
      workerPath: window.config.workerPath

    onShow: ->
      @$('#fileupload').fileupload
        dataType: 'json'
        acceptFileTypes:  /(\.|\/)(psd)$/i
        start: => @$('#progress').show()
        progressall: (e, data)  =>
          progress = parseInt(data.loaded / data.total * 100, 10)
          @$('#progress .bar').css
              'width': progress + '%'
          if progress is 100
            @uploadComplete = true
            @render()
        done: (e, data) ->
          App.appRegion.show new App.Views.GradeLayout({
            psd: data.result
          })
        error: ->
          alert "Oh no something bad happend, shoot us a note at sam <at> mojotech.com"
          window.location = window.location
