!(function() {
  LNT = window.LNT || {};

  LNT.getFontNames = function() {
    return _(PSD.children).map(function(v) {
      return getNodeFontNames(v);
    }).flatten().uniq().valueOf();
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
