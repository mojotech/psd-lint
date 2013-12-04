!(function() {
  LNT = window.LNT || {};

  LNT.getBadLayerNames = function(PSD) {
    return (_.filter(getLayerNames(PSD), function(v) {
      return ~v.indexOf('Layer ') || ~v.indexOf(' copy');
    }));
  }

  function getLayerNames(PSD) {
    return _(PSD.children).map(function(v) {
      return LNT.propertyWalker(v, 'name');
    }).flatten().valueOf();
  }
}());
