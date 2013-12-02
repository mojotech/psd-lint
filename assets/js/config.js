(function() {
  var data;

  data = {
    title: 'PSD Lint',
    workerPath: 'http://localhost:4567/'
  };

  if ((typeof module !== "undefined" && module !== null ? module.exports : void 0) != null) {
    module.exports = data;
  } else {
    window.config = data;
  }

}).call(this);
