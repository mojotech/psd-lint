!(function() {
  LNT = window.LNT || {};

  LNT.getBlendingModes = function() {
    return _(PSD.children).map(function(v) {
      return LNT.propertyWalker(v, 'blending_mode');
    }).flatten().uniq().valueOf();
  }
}());
