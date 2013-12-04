LNT = window.LNT || {}

LNT.getTotalCount = _.memoize (PSD) ->
  count = 0

  _(PSD.children).each (v) ->
    count++
    LNT.propertyWalker v, -> count++

  count
