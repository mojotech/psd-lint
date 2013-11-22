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
    var fontSizes = {};

    _(PSD.children).each(function(v) {
      LNT.propertyWalker(v, function(node, p) {
        if (node.text) {
          if (typeof fontSizes[node.text.font.sizes[0]] === "undefined") {
            fontSizes[node.text.font.sizes[0]] = {
              layers: [node.name]
            }
          } else {
            fontSizes[node.text.font.sizes].layers.push(node.name);
          }
        }
      });
    });

    return fontSizes;
  };
}());
