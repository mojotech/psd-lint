!(function() {
  LNT = window.LNT || {};

  LNT.getFontNames = function() {
    return _(PSD.children).map(function(v) {
      return getNodeFontNames(v);
    }).flatten().uniq().valueOf();
  }

  LNT.getFontSizes = function() {
    return _(PSD.children).map(function(v) {
      return getNodeFontSizes(v);
    }).flatten().valueOf();
  }

  function getNodeFontSizes(node) {
    var sizes = [];
    if (node.text) {
      sizes.push(node.text.font.sizes[0]);
    }

    if (node.children) {
      _.flatten(_.each(node.children, function(n) {
        sizes.push(getNodeFontSizes(n));
      }));
    }

    return sizes;
  }

  function getNodeFontNames(node) {
    var fonts = [];
    if (node.text) {
      fonts.push(node.text.font.name);
    }

    if (node.children) {
      _.flatten(_.each(node.children, function(n) {
        fonts.push(getNodeFontNames(n));
      }));
    }

    return fonts;
  }
}());
