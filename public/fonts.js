!(function() {
  LNT = window.LNT || {};

  LNT.getFontNames = function() {
    return _(PSD.children).map(function(v) {
      return LNT.propertyWalker(v, function(node, p) {
        if (node.text) {
          p.push(node.text.font.name);
        }
      });
    }).flatten().uniq().valueOf();
  };

  LNT.getFontSizes = function() {
    return _(PSD.children).map(function(v) {
      return LNT.propertyWalker(v, function(node, p) {
        if (node.text) {
          p.push(node.text.font.sizes[0]);
        }
      });
    }).flatten().valueOf();
  };
}());
