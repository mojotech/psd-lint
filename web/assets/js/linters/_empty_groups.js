!(function() {
  LNT = window.LNT || {};

  LNT.getEmptyGroups = function(PSD) {
    var emptyGroups = [];

    _(PSD.children).each(function(v) {
      LNT.propertyWalker(v, function(n, prop) {
        if (n.type === "group" && !hasChildren(n)) {
          emptyGroups.push(n.name);
        }
      });
    });

    return emptyGroups;
  };

  function hasChildren(n) {
    if (typeof n.children === "undefined")  {
      return false
    }
    return !!(n.children.length > 0);
  }
}());
