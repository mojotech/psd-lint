!(function() {
  LNT = window.LNT || {};

  LNT.getFontNames = function(PSD) {
    return fontHashWalk(function(n) {
      return n.text.font.name;
    }, PSD)
  };

  LNT.getFontSizes = function(PSD) {
    return fontHashWalk(function(n) {
      return n.text.font.sizes[0];
    }, PSD);
  };

  function fontHashWalk(keyLookup, PSD) {
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
