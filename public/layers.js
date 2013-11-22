!(function() {
  LNT = window.LNT || {};

  LNT.getBadLayerNames = function() {
    return (_.filter(getLayerNames(), function(v) {
      return ~v.indexOf('Layer ');
    }));
  }

  function getLayerNames() {
    return _(PSD.children).map(function(v) {
      return LNT.propertyWalker(v, 'name');
    }).flatten().valueOf();
  }
}());
