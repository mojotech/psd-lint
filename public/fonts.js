!(function() {
  LNT = window.LNT || {};

  LNT.getFontNames = function() {
    return fontHashWalk(function(n) {
      return n.text.font.name;
    })
  };

  LNT.getFontSizes = function() {
    return fontHashWalk(function(n) {
      return n.text.font.sizes;
    });
  };

  function fontHashWalk(keyLookup) {
    var hash = {};

    _(PSD.children).each(function(v) {
      LNT.propertyWalker(v, function(node, p) {
        if (node.text) {
          if (typeof hash[keyLookup(node)] === "undefined") {
            hash[keyLookup(node)] = {
              layers: [node.name]
            }
          } else {
            hash[keyLookup(node)].layers.push(node.name);
          }
        }
      });
    });

    return hash;
  }
}());
