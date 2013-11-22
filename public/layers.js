!(function() {
  LNT = window.LNT || {};

  LNT.getBadLayerNames = function() {
    return (_.filter(getLayerNames(), function(v) {
      return ~v.indexOf('Layer ');
    }));
  }

  function getLayerNames() {
    return _(PSD.children).map(function(v) {
      return getNodeLayerNames(v);
    }).flatten().valueOf();
  }

  function getNodeLayerNames(node) {
    var names = [node.name];

    if (node.children) {
      _.flatten(_.each(node.children, function(n) {
        names.push(getNodeLayerNames(n));
      }));
    }

    return names
  }
}());
