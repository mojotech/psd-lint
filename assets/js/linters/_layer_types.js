!(function() {
  LNT = window.LNT || {};

  LNT.getLayerTypes = function() {
    var nodeTypes = _(PSD.children).map(function(v) {
      return LNT.propertyWalker(v, 'type');
    }).flatten().valueOf();

    var layers = _.findWhere(nodeTypes, function(v) { return v === "layer"});

    return {
      layerCount: layers.length,
      groupCount: _.without(nodeTypes, layers).length
    }
  }
}());
