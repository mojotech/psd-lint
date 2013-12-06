App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.Upload extends Marionette.Layout
    __name__: "Upload"
    className: 'uploader'
    getTemplate: ->
      if @uploadComplete
        return templates.processing

      templates.uploader

    templateHelpers:
      workerPath: window.config.workerPath

    events: ->
      "click .sample": ->
        App.appRegion.show new App.Views.GradeLayout
          psd: window.sample_psd

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
          alert "Oh no something bad happend, try again or shoot us a note at sam <at> mojotech.com"
          window.location = window.location
