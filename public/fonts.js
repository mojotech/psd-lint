!(function() {
  LNT = window.LNT || {};

  LNT.getFontNames = function() {
    var fonts = {};
    _(PSD.children).each(function(v) {
      LNT.propertyWalker(v, function(node, p) {
        if (node.text) {
          if (typeof fonts[node.text.font.name] === "undefined") {
            fonts[node.text.font.name] = {
              layers: [node.name]
            }
          } else {
            fonts[node.text.font.name].layers.push(node.name);
          }
        }
      });
    });

    return fonts;
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
