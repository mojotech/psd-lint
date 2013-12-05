App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
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
