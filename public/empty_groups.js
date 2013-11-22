!(function() {
  LNT = window.LNT || {};

  LNT.getEmptyGroups = function() {
    var emptyGroups = [];

    _(PSD.children).each(function(v) {
      if (v.type === "group") {
        if (v.children.length === 0) {
          emptyGroups.push(v.name);
        }
      }
    });

    return emptyGroups;
  };
}());
