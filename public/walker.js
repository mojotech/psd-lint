!(function() {
  LNT = window.LNT || {};

  LNT.propertyWalker = function(node, prop) {
    var properties = [node[prop]];

    if (node.children) {
      _.flatten(_.each(node.children, function(n) {
        properties.push(LNT.propertyWalker(n, prop));
      }));
    }

    return properties
  }
}());
