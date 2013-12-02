$ ->
  $('#fileupload').fileupload
    dataType: 'json'
    progressall: (e, data)  ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      $('#progress .bar').css
          'width': progress + '%'
    done: (e, data) ->
      console.log arguments
