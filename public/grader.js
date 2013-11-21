!(function() {
  console.log(getBadLayerNames());
  console.log(getFontNames());
})()


function getLayerNames() {
  return _(PSD.children).map(function(v) {
    return getNodeLayerNames(v);
  }).flatten().valueOf();
}

function getFontNames() {
  return _(PSD.children).map(function(v) {
    return getNodeFontNames(v);
  }).flatten().uniq().valueOf();
}

function getNodeLayerNames(node) {
  var names = [node.name];

  if (node.children) {
    _.flatten(_.each(node.children, function(n) {
      names.push(getNodeLayerNames(n));
    }));
  }

  return names
}

function getBadLayerNames() {
  return (_.filter(getLayerNames(), function(v) {
    return ~v.indexOf('Layer ');
  }));
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
