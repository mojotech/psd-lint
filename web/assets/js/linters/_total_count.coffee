LNT = window.LNT || {}

LNT.getTotalCount = _.memoize (PSD) ->
  count = 1

  _(PSD.children).each (v) ->
    count++
    LNT.propertyWalker v, -> count++

  count
