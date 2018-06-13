####*
## Owl Carousel v2.2.1
## Copyright 2013-2017 David Deutsch
## Licensed under  ()
####
#
#!((a, b, c, d) ->
#
#  e = (b, c) ->
#    @settings = null
#    @options = a.extend({}, e.Defaults, c)
#    @$element = a(b)
#    @_handlers = {}
#    @_plugins = {}
#    @_supress = {}
#    @_current = null
#    @_speed = null
#    @_coordinates = []
#    @_breakpoint = null
#    @_width = null
#    @_items = []
#    @_clones = []
#    @_mergers = []
#    @_widths = []
#    @_invalidated = {}
#    @_pipe = []
#    @_drag =
#      time: null
#      target: null
#      pointer: null
#      stage:
#        start: null
#        current: null
#      direction: null
#    @_states =
#      current: {}
#      tags:
#        initializing: [ 'busy' ]
#        animating: [ 'busy' ]
#        dragging: [ 'interacting' ]
#    a.each([
#      'onResize'
#      'onThrottledResize'
#    ], a.proxy(((b, c) ->
#      @_handlers[c] = a.proxy(@[c], this)
#      return
#    ), this))
#    a.each(e.Plugins, a.proxy(((a, b) ->
#      @_plugins[a.charAt(0).toLowerCase() + a.slice(1)] = new b(this)
#      return
#    ), this))
#    a.each(e.Workers, a.proxy(((b, c) ->
#      @_pipe.push
#        filter: c.filter
#        run: a.proxy(c.run, this)
#      return
#    ), this))
#    @setup()
#    @initialize()
#    return
#
#  e.Defaults =
#    items: 3
#    loop: !1
#    center: !1
#    rewind: !1
#    mouseDrag: !0
#    touchDrag: !0
#    pullDrag: !0
#    freeDrag: !1
#    margin: 0
#    stagePadding: 0
#    merge: !1
#    mergeFit: !0
#    autoWidth: !1
#    startPosition: 0
#    rtl: !1
#    smartSpeed: 250
#    fluidSpeed: !1
#    dragEndSpeed: !1
#    responsive: {}
#    responsiveRefreshRate: 200
#    responsiveBaseElement: b
#    fallbackEasing: 'swing'
#    info: !1
#    nestedItemSelector: !1
#    itemElement: 'div'
#    stageElement: 'div'
#    refreshClass: 'owl-refresh'
#    loadedClass: 'owl-loaded'
#    loadingClass: 'owl-loading'
#    rtlClass: 'owl-rtl'
#    responsiveClass: 'owl-responsive'
#    dragClass: 'owl-drag'
#    itemClass: 'owl-item'
#    stageClass: 'owl-stage'
#    stageOuterClass: 'owl-stage-outer'
#    grabClass: 'owl-grab'
#  e.Width =
#    Default: 'default'
#    Inner: 'inner'
#    Outer: 'outer'
#  e.Type =
#    Event: 'event'
#    State: 'state'
#  e.Plugins = {}
#  e.Workers = [
#    {
#      filter: [
#        'width'
#        'settings'
#      ]
#      run: ->
#        @_width = @$element.width()
#        return
#
#    }
#    {
#      filter: [
#        'width'
#        'items'
#        'settings'
#      ]
#      run: (a) ->
#        a.current = @_items and @_items[@relative(@_current)]
#        return
#
#    }
#    {
#      filter: [
#        'items'
#        'settings'
#      ]
#      run: ->
#        @$stage.children('.cloned').remove()
#        return
#
#    }
#    {
#      filter: [
#        'width'
#        'items'
#        'settings'
#      ]
#      run: (a) ->
#        `var b`
#        `var c`
#        `var d`
#        `var e`
#        b = @settings.margin or ''
#        c = !@settings.autoWidth
#        d = @settings.rtl
#        e =
#          width: 'auto'
#          'margin-left': if d then b else ''
#          'margin-right': if d then '' else b
#        !c and @$stage.children().css(e)
#        a.css = e
#        return
#
#    }
#    {
#      filter: [
#        'width'
#        'items'
#        'settings'
#      ]
#      run: (a) ->
#        `var b`
#        `var c`
#        `var d`
#        `var e`
#        b = (@width() / @settings.items).toFixed(3) - (@settings.margin)
#        c = null
#        d = @_items.length
#        e = !@settings.autoWidth
#        f = []
#        a.items =
#          merge: !1
#          width: b
#        while d--
#          c = @_mergers[d]
#          c = @settings.mergeFit and Math.min(c, @settings.items) or c
#          a.items.merge = c > 1 or a.items.merge
#          f[d] = if e then b * c else @_items[d].width()
#        @_widths = f
#        return
#
#    }
#    {
#      filter: [
#        'items'
#        'settings'
#      ]
#      run: ->
#        `var b`
#        `var c`
#        `var d`
#        `var e`
#        b = []
#        c = @_items
#        d = @settings
#        e = Math.max(2 * d.items, 4)
#        f = 2 * Math.ceil(c.length / 2)
#        g = if d.loop and c.length then (if d.rewind then e else Math.max(e, f)) else 0
#        h = ''
#        i = ''
#        g /= 2
#        while g--
#          b.push(@normalize(b.length / 2, !0))
#          h += c[b[b.length - 1]][0].outerHTML
#          b.push(@normalize(c.length - 1 - ((b.length - 1) / 2), !0))
#          i = c[b[b.length - 1]][0].outerHTML + i
#        @_clones = b
#        a(h).addClass('cloned').appendTo(@$stage)
#        a(i).addClass('cloned').prependTo(@$stage)
#        return
#
#    }
#    {
#      filter: [
#        'width'
#        'items'
#        'settings'
#      ]
#      run: ->
#        `var a`
#        `var b`
#        `var c`
#        `var d`
#        `var e`
#        a = if @settings.rtl then 1 else -1
#        b = @_clones.length + @_items.length
#        c = -1
#        d = 0
#        e = 0
#        f = []
#        while ++c < b
#          d = f[c - 1] or 0
#          e = @_widths[@relative(c)] + @settings.margin
#          f.push(d + e * a)
#        @_coordinates = f
#        return
#
#    }
#    {
#      filter: [
#        'width'
#        'items'
#        'settings'
#      ]
#      run: ->
#        `var a`
#        `var b`
#        `var c`
#        a = @settings.stagePadding
#        b = @_coordinates
#        c =
#          width: Math.ceil(Math.abs(b[b.length - 1])) + 2 * a
#          'padding-left': a or ''
#          'padding-right': a or ''
#        @$stage.css c
#        return
#
#    }
#    {
#      filter: [
#        'width'
#        'items'
#        'settings'
#      ]
#      run: (a) ->
#        `var b`
#        `var c`
#        `var d`
#        b = @_coordinates.length
#        c = !@settings.autoWidth
#        d = @$stage.children()
#        if c and a.items.merge
#          while b--
#            a.css.width = @_widths[@relative(b)]
#            d.eq(b).css(a.css)
#        else
#          c and a.css.width = a.items.width
#          d.css(a.css)
#        return
#
#    }
#    {
#      filter: [ 'items' ]
#      run: ->
#        @_coordinates.length < 1 and @$stage.removeAttr('style')
#        return
#
#    }
#    {
#      filter: [
#        'width'
#        'items'
#        'settings'
#      ]
#      run: (a) ->
#        a.current = if a.current then @$stage.children().index(a.current) else 0
#        a.current = Math.max(@minimum(), Math.min(@maximum(), a.current))
#        @reset(a.current)
#        return
#
#    }
#    {
#      filter: [ 'position' ]
#      run: ->
#        @animate @coordinates(@_current)
#        return
#
#    }
#    {
#      filter: [
#        'width'
#        'position'
#        'items'
#        'settings'
#      ]
#      run: ->
#        `var a`
#        `var b`
#        `var c`
#        `var d`
#        `var e`
#        a = undefined
#        b = undefined
#        c = undefined
#        d = undefined
#        e = if @settings.rtl then 1 else -1
#        f = 2 * @settings.stagePadding
#        g = @coordinates(@current()) + f
#        h = g + @width() * e
#        i = []
#        c = 0
#        d = @_coordinates.length
#        while c < d
#          a = @_coordinates[c - 1] or 0
#          b = Math.abs(@_coordinates[c]) + f * e
#          (@op(a, '<=', g) and @op(a, '>', h) or @op(b, '<', g) and @op(b, '>', h)) and i.push(c)
#          c++
#        @$stage.children('.active').removeClass('active')
#        @$stage.children(':eq(' + i.join('), :eq(') + ')').addClass('active')
#        @settings.center and @$stage.children('.center').removeClass('center')
#        @$stage.children().eq(@current()).addClass('center')
#
#        return
#
#    }
#  ]
#
#  e::initialize = ->
#    `var b`
#    `var c`
#    `var e`
#    if @enter('initializing')
#      @trigger('initialize')
#      @$element.toggleClass(@settings.rtlClass, @settings.rtl)
#      @settings.autoWidth and !@is('pre-loading')
#
#      b = undefined
#      c = undefined
#      e = undefined
#      b = @$element.find('img')
#      c = if @settings.nestedItemSelector then '.' + @settings.nestedItemSelector else d
#      e = @$element.children(c).width()
#      b.length and e <= 0 and @preloadAutoWidthImages(b)
#    @$element.addClass(@options.loadingClass)
#    @$stage = a('<' + @settings.stageElement + ' class="' + @settings.stageClass + '"/>').wrap('<div class="' + @settings.stageOuterClass + '"/>')
#    @$element.append(@$stage.parent())
#    @replace(@$element.children().not(@$stage.parent()))
#    if @$element.is(':visible') then @refresh() else @invalidate('width')
#    @$element.removeClass(@options.loadingClass).addClass(@options.loadedClass)
#    @registerEventHandlers()
#    @leave('initializing')
#    @trigger('initialized')
#    return
#
#  e::setup = ->
#    `var b`
#    `var c`
#    `var d`
#    `var e`
#    b = @viewport()
#    c = @options.responsive
#    d = -1
#    e = null
#    if c then a.each(c, ((a) ->
#      a <= b and a > d and (d = Number(a))
#      return
#    ))
#    e = a.extend({}, @options, c[d])
#    'function' == typeof e.stagePadding and (e.stagePadding = e.stagePadding())
#    delete e.responsive
#    e.responsiveClass and @$element.attr('class', @$element.attr('class').replace(new RegExp('(' + @options.responsiveClass + '-)\\S+\\s', 'g'), '$1' + d))
#else (e = a.extend({}, @options))
#@trigger('change', property:
#  name: 'settings'
#  value: e)
#@_breakpoint = d
#@settings = e
#@invalidate('settings')
#@trigger('changed', property:
#  name: 'settings'
#  value: @settings)
#return
#
#e::optionsLogic = ->
#  @settings.autoWidth and @settings.stagePadding = !1
#  @settings.merge = !1
#  return
#
#e::prepare = (b) ->
#  `var c`
#  c = @trigger('prepare', content: b)
#  c.data or (c.data = a('<' + @settings.itemElement + '/>').addClass(@options.itemClass).append(b))
#  @trigger('prepared', content: c.data)
#  c.data
#
#e::update = ->
#  `var b`
#  `var c`
#  `var d`
#  `var e`
#  b = 0
#  c = @_pipe.length
#  d = a.proxy(((a) ->
#    @[a]
#  ), @_invalidated)
#  e = {}
#  while b < c
#    (@_invalidated.all or a.grep(@_pipe[b].filter, d).length > 0) and @_pipe[b].run(e)
#    b++
#  @_invalidated = {}
#  !@is('valid') and @enter('valid')
#  return
#
#e::width = (a) ->
#  switch a = a or e.Width.Default
#    when e.Width.Inner, e.Width.Outer
#      return @_width
#    else
#      return @_width - (2 * @settings.stagePadding) + @settings.margin
#  return
#
#e::refresh = ->
#  @enter('refreshing')
#  @trigger('refresh')
#  @setup()
#  @optionsLogic()
#  @$element.addClass(@options.refreshClass)
#  @update()
#  @$element.removeClass(@options.refreshClass)
#  @leave('refreshing')
#  @trigger('refreshed')
#  return
#
#e::onThrottledResize = ->
#  b.clearTimeout(@resizeTimer)
#  @resizeTimer = b.setTimeout(@_handlers.onResize, @settings.responsiveRefreshRate)
#  return
#
#e::onResize = ->
#  ! !@_items.length and @_width != @$element.width() and ! !@$element.is(':visible') and @enter('resizing')
#  if @trigger('resize').isDefaultPrevented() then @leave('resizing')
#  !1
#else @invalidate('width')
#@refresh()
#@leave('resizing')
#undefined
#
#e::registerEventHandlers = ->
#  a.support.transition and @$stage.on(a.support.transition.end + '.owl.core', a.proxy(@onTransitionEnd, this))
#  @settings.responsive != !1 and @on(b, 'resize', @_handlers.onThrottledResize)
#  @settings.mouseDrag and @$element.addClass(@options.dragClass)
#  @$stage.on('mousedown.owl.core', a.proxy(@onDragStart, this))
#  @$stage.on('dragstart.owl.core selectstart.owl.core', ->
#    !1
#  )
#
#  @settings.touchDrag and @$stage.on('touchstart.owl.core', a.proxy(@onDragStart, this))
#  @$stage.on('touchcancel.owl.core', a.proxy(@onDragEnd, this))
#
#  return
#
#e::onDragStart = (b) ->
#  `var d`
#  d = null
#  3 != b.which and if a.support.transform then d = @$stage.css('transform').replace(/.*\(|\)| /g, '').split(',')
#  d =
#    x: d[if 16 == d.length then 12 else 4]
#    y: d[if 16 == d.length then 13 else 5]
#else d = @$stage.position()
#d =
#  x: if @settings.rtl then d.left + @$stage.width() - @width() + @settings.margin else d.left
#  y: d.top
#
#@is('animating') and if a.support.transform then @animate(d.x) else @$stage.stop()
#@invalidate('position')
#
#@$element.toggleClass(@options.grabClass, 'mousedown' == b.type)
#@speed(0)
#@_drag.time = (new Date).getTime()
#@_drag.target = a(b.target)
#@_drag.stage.start = d
#@_drag.stage.current = d
#@_drag.pointer = @pointer(b)
#a(c).on('mouseup.owl.core touchend.owl.core', a.proxy(@onDragEnd, this))
#a(c).one('mousemove.owl.core touchmove.owl.core', a.proxy(((b) ->
#  `var d`
#  d = @difference(@_drag.pointer, @pointer(b))
#  a(c).on('mousemove.owl.core touchmove.owl.core', a.proxy(@onDragMove, this))
#  Math.abs(d.x) < Math.abs(d.y) and @is('valid') or b.preventDefault()
#  @enter('dragging')
#  @trigger('drag')
#
#  return
#), this))
#return
#
#e::onDragMove = (a) ->
#  `var b`
#  `var c`
#  `var d`
#  `var e`
#  b = null
#  c = null
#  d = null
#  e = @difference(@_drag.pointer, @pointer(a))
#  f = @difference(@_drag.stage.start, e)
#  @is('dragging') and a.preventDefault()
#  if @settings.loop then b = @coordinates(@minimum())
#  c = @coordinates(@maximum() + 1) - b
#  f.x = ((f.x - b) % c + c) % c + b
#else b = if @settings.rtl then @coordinates(@maximum()) else @coordinates(@minimum())
#c = if @settings.rtl then @coordinates(@minimum()) else @coordinates(@maximum())
#d = if @settings.pullDrag then -1 * e.x / 5 else 0
#f.x = Math.max(Math.min(f.x, b + d), c + d)
#
#@_drag.stage.current = f
#@animate(f.x)
#return
#
#e::onDragEnd = (b) ->
#  `var d`
#  `var e`
#  d = @difference(@_drag.pointer, @pointer(b))
#  e = @_drag.stage.current
#  f = if d.x > 0 ^ @settings.rtl then 'left' else 'right'
#  a(c).off('.owl.core')
#  @$element.removeClass(@options.grabClass)
#  (0 != d.x and @is('dragging') or !@is('valid')) and @speed(@settings.dragEndSpeed or @settings.smartSpeed)
#  @current(@closest(e.x, if 0 != d.x then f else @_drag.direction))
#  @invalidate('position')
#  @update()
#  @_drag.direction = f
#  (Math.abs(d.x) > 3 or (new Date).getTime() - (@_drag.time) > 300) and @_drag.target.one('click.owl.core', ->
#    !1
#  )
#
#  @is('dragging') and @leave('dragging')
#  @trigger('dragged')
#
#  return
#
#e::closest = (b, c) ->
#  `var d`
#  `var e`
#  d = -1
#  e = 30
#  f = @width()
#  g = @coordinates()
#  @settings.freeDrag or a.each(g, a.proxy(((a, h) ->
#    if 'left' == c and b > h - e and b < h + e then (d = a) else if 'right' == c and b > h - f - e and b < h - f + e then (d = a + 1) else @op(b, '<', h) and @op(b, '>', g[a + 1] or h - f) and (d = if 'left' == c then a + 1 else a)
#    d == -1
#  ), this))
#  @settings.loop or (if @op(b, '>', g[@minimum()]) then (d = b = @minimum()) else @op(b, '<', g[@maximum()]) and (d = b = @maximum()))
#  d
#
#e::animate = (b) ->
#  `var c`
#  c = @speed() > 0
#  @is('animating') and @onTransitionEnd()
#  c and @enter('animating')
#  @trigger('translate')
#
#  if a.support.transform3d and a.support.transition then @$stage.css(
#    transform: 'translate3d(' + b + 'px,0px,0px)'
#    transition: @speed() / 1e3 + 's') else if c then @$stage.animate({ left: b + 'px' }, @speed(), @settings.fallbackEasing, a.proxy(@onTransitionEnd, this)) else @$stage.css(left: b + 'px')
#  return
#
#e::is = (a) ->
#  @_states.current[a] and @_states.current[a] > 0
#
#e::current = (a) ->
#  `var b`
#  if a == d
#    return @_current
#  if 0 == @_items.length
#    return d
#  if a = @normalize(a)
#    @_current != a
#
#    b = @trigger('change', property:
#      name: 'position'
#      value: a)
#    b.data != d and (a = @normalize(b.data))
#    @_current = a
#    @invalidate('position')
#    @trigger('changed', property:
#      name: 'position'
#      value: @_current)
#  @_current
#
#e::invalidate = (b) ->
#  'string' == a.type(b) and @_invalidated[b] = !0
#  @is('valid') and @leave('valid')
#
#  a.map(@_invalidated, (a, b) ->
#    b
#  )
#
#e::reset = (a) ->
#  a = @normalize(a)
#  a != d and @_speed = 0
#  @_current = a
#  @suppress([
#    'translate'
#    'translated'
#  ])
#  @animate(@coordinates(a))
#  @release([
#    'translate'
#    'translated'
#  ])
#
#  return
#
#e::normalize = (a, b) ->
#  `var c`
#  `var e`
#  c = @_items.length
#  e = if b then 0 else @_clones.length
#  if !@isNumeric(a) or c < 1 then (a = d) else (a < 0 or a >= c + e) and (a = ((a - (e / 2)) % c + c) % c + e / 2)
#  a
#
#e::relative = (a) ->
#  a -= @_clones.length / 2
#  @normalize(a, !0)
#
#e::maximum = (a) ->
#  `var b`
#  `var c`
#  `var d`
#  `var e`
#  b = undefined
#  c = undefined
#  d = undefined
#  e = @settings
#  f = @_coordinates.length
#  if e.loop
#    f = @_clones.length / 2 + @_items.length - 1
#  else if e.autoWidth or e.merge
#    b = @_items.length
#    c = @_items[--b].width()
#    d = @$element.width()
#    while b-- and c += @_items[b].width() + @settings.margin
#    !(c > d)
#
#    f = b + 1
#  else
#    f = if e.center then @_items.length - 1 else @_items.length - (e.items)
#  a and (f -= @_clones.length / 2)
#  Math.max(f, 0)
#
#e::minimum = (a) ->
#  if a then 0 else @_clones.length / 2
#
#e::items = (a) ->
#  if a == d then @_items.slice() else a = @normalize(a, !0)
#  @_items[a]
#
#e::mergers = (a) ->
#  if a == d then @_mergers.slice() else a = @normalize(a, !0)
#  @_mergers[a]
#
#e::clones = (b) ->
#  `var c`
#  `var e`
#  c = @_clones.length / 2
#  e = c + @_items.length
#
#  f = (a) ->
#    if a % 2 == 0 then e + a / 2 else c - ((a + 1) / 2)
#
#  if b == d then a.map(@_clones, ((a, b) ->
#    f b
#  )) else a.map(@_clones, ((a, c) ->
#    if a == b then f(c) else null
#  ))
#
#e::speed = (a) ->
#  a != d and (@_speed = a)
#  @_speed
#
#e::coordinates = (b) ->
#  `var c`
#  `var e`
#  c = undefined
#  e = 1
#  f = b - 1
#  if b == d then a.map(@_coordinates, a.proxy(((a, b) ->
#    @coordinates b
#  ), this)) else if @settings.center then @settings.rtl and e = -1
#  f = b + 1
#
#  c = @_coordinates[b]
#  c += (@width() - c + (@_coordinates[f] or 0)) / 2 * e
#else (c = @_coordinates[f] or 0)
#c = Math.ceil(c)
#
#e::duration = (a, b, c) ->
#  if 0 == c then 0 else Math.min(Math.max(Math.abs(b - a), 1), 6) * Math.abs(c or @settings.smartSpeed)
#
#e::to = (a, b) ->
#  `var c`
#  `var d`
#  `var e`
#  c = @current()
#  d = null
#  e = a - @relative(c)
#  f = (e > 0) - (e < 0)
#  g = @_items.length
#  h = @minimum()
#  i = @maximum()
#  if @settings.loop then !@settings.rewind and Math.abs(e) > g / 2 and (e += f * -1 * g)
#  a = c + e
#  d = ((a - h) % g + g) % g + h
#  d != a and d - e <= i and d - e > 0 and c = d - e
#  a = d
#  @reset(c)
#
#else if @settings.rewind then i += 1
#a = (a % i + i) % i
#else (a = Math.max(h, Math.min(i, a)))
#@speed(@duration(c, a, b))
#@current(a)
#@$element.is(':visible') and @update()
#return
#
#e::next = (a) ->
#  a = a or !1
#  @to(@relative(@current()) + 1, a)
#  return
#
#e::prev = (a) ->
#  a = a or !1
#  @to(@relative(@current()) - 1, a)
#  return
#
#e::onTransitionEnd = (a) ->
#  if a != d and a.stopPropagation()
#    (a.target or a.srcElement or a.originalTarget) != @$stage.get(0)
#
#    return !1
#  @leave('animating')
#  @trigger('translated')
#  return
#
#e::viewport = ->
#  `var d`
#  d = undefined
#  if @options.responsiveBaseElement != b then (d = a(@options.responsiveBaseElement).width()) else if b.innerWidth then (d = b.innerWidth) else if c.documentElement and c.documentElement.clientWidth then (d = c.documentElement.clientWidth) else console.warn('Can not detect viewport width.')
#  d
#
#e::replace = (b) ->
#  @$stage.empty()
#  @_items = []
#  b and (b = if b instanceof jQuery then b else a(b))
#  @settings.nestedItemSelector and (b = b.find('.' + @settings.nestedItemSelector))
#  b.filter(->
#    1 == @nodeType
#  ).each(a.proxy(((a, b) ->
#    b = @prepare(b)
#    @$stage.append(b)
#    @_items.push(b)
#    @_mergers.push(1 * b.find('[data-merge]').addBack('[data-merge]').attr('data-merge') or 1)
#    return
#  ), this))
#  @reset(if @isNumeric(@settings.startPosition) then @settings.startPosition else 0)
#  @invalidate('items')
#  return
#
#e::add = (b, c) ->
#  `var e`
#  e = @relative(@_current)
#  c = if c == d then @_items.length else @normalize(c, !0)
#  b = if b instanceof jQuery then b else a(b)
#  @trigger('add',
#    content: b
#    position: c)
#  b = @prepare(b)
#  if 0 == @_items.length or c == @_items.length then 0 == @_items.length and @$stage.append(b)
#  0 != @_items.length and @_items[c - 1].after(b)
#  @_items.push(b)
#  @_mergers.push(1 * b.find('[data-merge]').addBack('[data-merge]').attr('data-merge') or 1)
#else @_items[c].before(b)
#@_items.splice(c, 0, b)
#@_mergers.splice(c, 0, 1 * b.find('[data-merge]').addBack('[data-merge]').attr('data-merge') or 1)
#
#@_items[e] and @reset(@_items[e].index())
#@invalidate('items')
#@trigger('added',
#  content: b
#  position: c)
#return
#
#e::remove = (a) ->
#  a = @normalize(a, !0)
#  a != d and @trigger('remove',
#    content: @_items[a]
#    position: a)
#  @_items[a].remove()
#  @_items.splice(a, 1)
#  @_mergers.splice(a, 1)
#  @invalidate('items')
#  @trigger('removed',
#    content: null
#    position: a)
#
#  return
#
#e::preloadAutoWidthImages = (b) ->
#  b.each a.proxy(((b, c) ->
#    @enter('pre-loading')
#    c = a(c)
#    a(new Image).one('load', a.proxy(((a) ->
#      c.attr('src', a.target.src)
#      c.css('opacity', 1)
#      @leave('pre-loading')
#      !@is('pre-loading') and !@is('initializing') and @refresh()
#      return
#    ), this)).attr('src', c.attr('src') or c.attr('data-src') or c.attr('data-src-retina'))
#    return
#  ), this)
#  return
#
#e::destroy = ->
#  `var d`
#  @$element.off('.owl.core')
#  @$stage.off('.owl.core')
#  a(c).off('.owl.core')
#  @settings.responsive != !1 and b.clearTimeout(@resizeTimer)
#  @off(b, 'resize', @_handlers.onThrottledResize)
#
#  for d of @_plugins
#    @_plugins[d].destroy()
#  @$stage.children('.cloned').remove()
#  @$stage.unwrap()
#  @$stage.children().contents().unwrap()
#  @$stage.children().unwrap()
#  @$element.removeClass(@options.refreshClass).removeClass(@options.loadingClass).removeClass(@options.loadedClass).removeClass(@options.rtlClass).removeClass(@options.dragClass).removeClass(@options.grabClass).attr('class', @$element.attr('class').replace(new RegExp(@options.responsiveClass + '-\\S+\\s', 'g'), '')).removeData('owl.carousel')
#  return
#
#e::op = (a, b, c) ->
#  `var d`
#  d = @settings.rtl
#  switch b
#    when '<'
#      return if d then a > c else a < c
#    when '>'
#      return if d then a < c else a > c
#    when '>='
#      return if d then a <= c else a >= c
#    when '<='
#      return if d then a >= c else a <= c
#  return
#
#e::on = (a, b, c, d) ->
#  if a.addEventListener then a.addEventListener(b, c, d) else a.attachEvent and a.attachEvent('on' + b, c)
#  return
#
#e::off = (a, b, c, d) ->
#  if a.removeEventListener then a.removeEventListener(b, c, d) else a.detachEvent and a.detachEvent('on' + b, c)
#  return
#
#e::trigger = (b, c, d, f, g) ->
#  h = item:
#    count: @_items.length
#    index: @current()
#  i = a.camelCase(a.grep([
#    'on'
#    b
#    d
#  ], (a) ->
#    a
#  ).join('-').toLowerCase())
#  j = a.Event([
#    b
#    'owl'
#    d or 'carousel'
#  ].join('.').toLowerCase(), a.extend({ relatedTarget: this }, h, c))
#  @_supress[b] or a.each(@_plugins, (a, b) ->
#    b.onTrigger and b.onTrigger(j)
#    return
#  )
#  @register(
#    type: e.Type.Event
#    name: b)
#  @$element.trigger(j)
#  @settings and 'function' == typeof @settings[i] and @settings[i].call(this, j)
#
#  j
#
#e::enter = (b) ->
#  a.each [ b ].concat(@_states.tags[b] or []), a.proxy(((a, b) ->
#    @_states.current[b] == d and (@_states.current[b] = 0)
#    @_states.current[b]++
#    return
#  ), this)
#  return
#
#e::leave = (b) ->
#  a.each [ b ].concat(@_states.tags[b] or []), a.proxy(((a, b) ->
#    @_states.current[b]--
#    return
#  ), this)
#  return
#
#e::register = (b) ->
#  `var c`
#  if b.type == e.Type.Event
#    if a.event.special[b.name] or (a.event.special[b.name] = {})
#      !a.event.special[b.name].owl
#
#      c = a.event.special[b.name]._default
#
#      a.event.special[b.name]._default = (a) ->
#        if !c or !c.apply or a.namespace and a.namespace.indexOf('owl') != -1 then a.namespace and a.namespace.indexOf('owl') > -1 else c.apply(this, arguments)
#
#a.event.special[b.name].owl = !0
#else
#b.type == e.Type.State and if @_states.tags[b.name] then (@_states.tags[b.name] = @_states.tags[b.name].concat(b.tags)) else (@_states.tags[b.name] = b.tags)
#@_states.tags[b.name] = a.grep(@_states.tags[b.name], a.proxy(((c, d) ->
#  a.inArray(c, @_states.tags[b.name]) == d
#), this))
#return
#
#e::suppress = (b) ->
#  a.each b, a.proxy(((a, b) ->
#    @_supress[b] = !0
#    return
#  ), this)
#  return
#
#e::release = (b) ->
#  a.each b, a.proxy(((a, b) ->
#    delete @_supress[b]
#    return
#  ), this)
#  return
#
#e::pointer = (a) ->
#  `var c`
#  c =
#    x: null
#    y: null
#  a = a.originalEvent or a or b.event
#  a = if a.touches and a.touches.length then a.touches[0] else if a.changedTouches and a.changedTouches.length then a.changedTouches[0] else a
#  if a.pageX then c.x = a.pageX
#  c.y = a.pageY
#else c.x = a.clientX
#c.y = a.clientY
#
#c
#
#e::isNumeric = (a) ->
#  !isNaN(parseFloat(a))
#
#e::difference = (a, b) ->
#  {
#    x: a.x - (b.x)
#    y: a.y - (b.y)
#  }
#
#a.fn.owlCarousel = (b) ->
#  `var c`
#  c = Array::slice.call(arguments, 1)
#  @each ->
#    `var d`
#    d = a(this)
#    f = d.data('owl.carousel')
#    f or f = new e(this, 'object' == typeof b and b)
#    d.data('owl.carousel', f)
#    a.each([
#      'next'
#      'prev'
#      'to'
#      'destroy'
#      'refresh'
#      'replace'
#      'add'
#      'remove'
#    ], (b, c) ->
#      f.register(
#        type: e.Type.Event
#        name: c)
#      f.$element.on(c + '.owl.carousel.core', a.proxy(((a) ->
#        a.namespace and a.relatedTarget != this and @suppress([ c ])
#        f[c].apply(this, [].slice.call(arguments, 1))
#        @release([ c ])
#        return
#      ), f))
#      return
#    )
#
#    'string' == typeof b and '_' != b.charAt(0) and f[b].apply(f, c)
#    return
#
#a.fn.owlCarousel.Constructor = e
#return
#)(window.Zepto or window.jQuery, window, document)
#((a, b, c, d) ->
#
#  e = (b) ->
#    @_core = b
#    @_interval = null
#    @_visible = null
#    @_handlers = 'initialized.owl.carousel': a.proxy(((a) ->
#      a.namespace and @_core.settings.autoRefresh and @watch()
#      return
#    ), this)
#    @_core.options = a.extend({}, e.Defaults, @_core.options)
#    @_core.$element.on(@_handlers)
#    return
#
#  e.Defaults =
#    autoRefresh: !0
#    autoRefreshInterval: 500
#
#  e::watch = ->
#    @_interval or @_visible = @_core.$element.is(':visible')
#    @_interval = b.setInterval(a.proxy(@refresh, this), @_core.settings.autoRefreshInterval)
#    return
#
#  e::refresh = ->
#    @_core.$element.is(':visible') != @_visible and @_visible = !@_visible
#    @_core.$element.toggleClass('owl-hidden', !@_visible)
#    @_visible and @_core.invalidate('width') and @_core.refresh()
#    return
#
#  e::destroy = ->
#    `var a`
#    `var c`
#    a = undefined
#    c = undefined
#    b.clearInterval @_interval
#    for a of @_handlers
#      @_core.$element.off a, @_handlers[a]
#    for c of Object.getOwnPropertyNames(this)
#      'function' != typeof @[c] and (@[c] = null)
#    return
#
#  a.fn.owlCarousel.Constructor.Plugins.AutoRefresh = e
#  return
#)(window.Zepto or window.jQuery, window, document)
#((a, b, c, d) ->
#
#  e = (b) ->
#    @_core = b
#    @_loaded = []
#    @_handlers = 'initialized.owl.carousel change.owl.carousel resized.owl.carousel': a.proxy(((b) ->
#      `var c`
#      `var e`
#      if b.namespace and @_core.settings and @_core.settings.lazyLoad and (b.property and 'position' == b.property.name or 'initialized' == b.type)
#        c = @_core.settings
#        e = c.center and Math.ceil(c.items / 2) or c.items
#        f = c.center and e * -1 or 0
#        g = (if b.property and b.property.value != d then b.property.value else @_core.current()) + f
#        h = @_core.clones().length
#        i = a.proxy(((a, b) ->
#          @load b
#          return
#        ), this)
#        while f++ < e
#          @load(h / 2 + @_core.relative(g))
#          h and a.each(@_core.clones(@_core.relative(g)), i)
#          g++
#      return
#    ), this)
#    @_core.options = a.extend({}, e.Defaults, @_core.options)
#    @_core.$element.on(@_handlers)
#    return
#
#  e.Defaults = lazyLoad: !1
#
#  e::load = (c) ->
#    `var d`
#    `var e`
#    d = @_core.$stage.children().eq(c)
#    e = d and d.find('.owl-lazy')
#    !e or a.inArray(d.get(0), @_loaded) > -1 or e.each(a.proxy(((c, d) ->
#      `var e`
#      e = undefined
#      f = a(d)
#      g = b.devicePixelRatio > 1 and f.attr('data-src-retina') or f.attr('data-src')
#      @_core.trigger('load', {
#        element: f
#        url: g
#      }, 'lazy')
#      if f.is('img') then f.one('load.owl.lazy', a.proxy((->
#        f.css('opacity', 1)
#        @_core.trigger('loaded', {
#          element: f
#          url: g
#        }, 'lazy')
#        return
#      ), this)).attr('src', g) else e = new Image
#      e.onload = a.proxy((->
#        f.css(
#          'background-image': 'url("' + g + '")'
#          opacity: '1')
#        @_core.trigger('loaded', {
#          element: f
#          url: g
#        }, 'lazy')
#        return
#      ), this)
#      e.src = g
#
#      return
#    ), this))
#    @_loaded.push(d.get(0))
#    return
#
#  e::destroy = ->
#    `var a`
#    `var b`
#    a = undefined
#    b = undefined
#    for a of @handlers
#      @_core.$element.off a, @handlers[a]
#    for b of Object.getOwnPropertyNames(this)
#      'function' != typeof @[b] and (@[b] = null)
#    return
#
#  a.fn.owlCarousel.Constructor.Plugins.Lazy = e
#  return
#)(window.Zepto or window.jQuery, window, document)
#((a, b, c, d) ->
#
#  e = (b) ->
#    @_core = b
#    @_handlers =
#      'initialized.owl.carousel refreshed.owl.carousel': a.proxy(((a) ->
#        a.namespace and @_core.settings.autoHeight and @update()
#        return
#      ), this)
#      'changed.owl.carousel': a.proxy(((a) ->
#        a.namespace and @_core.settings.autoHeight and 'position' == a.property.name and @update()
#        return
#      ), this)
#      'loaded.owl.lazy': a.proxy(((a) ->
#        a.namespace and @_core.settings.autoHeight and a.element.closest('.' + @_core.settings.itemClass).index() == @_core.current() and @update()
#        return
#      ), this)
#    @_core.options = a.extend({}, e.Defaults, @_core.options)
#    @_core.$element.on(@_handlers)
#    return
#
#  e.Defaults =
#    autoHeight: !1
#    autoHeightClass: 'owl-height'
#
#  e::update = ->
#    `var b`
#    `var c`
#    `var d`
#    `var e`
#    b = @_core._current
#    c = b + @_core.settings.items
#    d = @_core.$stage.children().toArray().slice(b, c)
#    e = []
#    f = 0
#    a.each(d, (b, c) ->
#      e.push a(c).height()
#      return
#    )
#    f = Math.max.apply(null, e)
#    @_core.$stage.parent().height(f).addClass(@_core.settings.autoHeightClass)
#    return
#
#  e::destroy = ->
#    `var a`
#    `var b`
#    a = undefined
#    b = undefined
#    for a of @_handlers
#      @_core.$element.off a, @_handlers[a]
#    for b of Object.getOwnPropertyNames(this)
#      'function' != typeof @[b] and (@[b] = null)
#    return
#
#  a.fn.owlCarousel.Constructor.Plugins.AutoHeight = e
#  return
#)(window.Zepto or window.jQuery, window, document)
#((a, b, c, d) ->
#
#  e = (b) ->
#    @_core = b
#    @_videos = {}
#    @_playing = null
#    @_handlers =
#      'initialized.owl.carousel': a.proxy(((a) ->
#        a.namespace and @_core.register(
#          type: 'state'
#          name: 'playing'
#          tags: [ 'interacting' ])
#        return
#      ), this)
#      'resize.owl.carousel': a.proxy(((a) ->
#        a.namespace and @_core.settings.video and @isInFullScreen() and a.preventDefault()
#        return
#      ), this)
#      'refreshed.owl.carousel': a.proxy(((a) ->
#        a.namespace and @_core.is('resizing') and @_core.$stage.find('.cloned .owl-video-frame').remove()
#        return
#      ), this)
#      'changed.owl.carousel': a.proxy(((a) ->
#        a.namespace and 'position' == a.property.name and @_playing and @stop()
#        return
#      ), this)
#      'prepared.owl.carousel': a.proxy(((b) ->
#        `var c`
#        if b.namespace
#          c = a(b.content).find('.owl-video')
#          c.length and c.css('display', 'none')
#          @fetch(c, a(b.content))
#        return
#      ), this)
#    @_core.options = a.extend({}, e.Defaults, @_core.options)
#    @_core.$element.on(@_handlers)
#    @_core.$element.on('click.owl.video', '.owl-video-play-icon', a.proxy(((a) ->
#      @play a
#      return
#    ), this))
#    return
#
#  e.Defaults =
#    video: !1
#    videoHeight: !1
#    videoWidth: !1
#
#  e::fetch = (a, b) ->
#    `var c`
#    `var d`
#    `var e`
#    c = do ->
#      if a.attr('data-vimeo-id') then 'vimeo' else if a.attr('data-vzaar-id') then 'vzaar' else 'youtube'
#    d = a.attr('data-vimeo-id') or a.attr('data-youtube-id') or a.attr('data-vzaar-id')
#    e = a.attr('data-width') or @_core.settings.videoWidth
#    f = a.attr('data-height') or @_core.settings.videoHeight
#    g = a.attr('href')
#    if !g
#      throw new Error('Missing video URL.')
#    if d = g.match(/(http:|https:|)\/\/(player.|www.|app.)?(vimeo\.com|youtu(be\.com|\.be|be\.googleapis\.com)|vzaar\.com)\/(video\/|videos\/|embed\/|channels\/.+\/|groups\/.+\/|watch\?v=|v\/)?([A-Za-z0-9._%-]*)(\&\S+)?/)
#      d[3].indexOf('youtu') > -1
#
#      c = 'youtube'
#    else if d[3].indexOf('vimeo') > -1
#      c = 'vimeo'
#    else
#      if !(d[3].indexOf('vzaar') > -1)
#        throw new Error('Video URL not supported.')
#      c = 'vzaar'
#    d = d[6]
#    @_videos[g] =
#      type: c
#      id: d
#      width: e
#      height: f
#    b.attr('data-video', g)
#    @thumbnail(a, @_videos[g])
#    return
#
#  e::thumbnail = (b, c) ->
#    `var d`
#    `var e`
#    d = undefined
#    e = undefined
#    f = undefined
#    g = if c.width and c.height then 'style="width:' + c.width + 'px;height:' + c.height + 'px;"' else ''
#    h = b.find('img')
#    i = 'src'
#    j = ''
#    k = @_core.settings
#
#    l = (a) ->
#      e = '<div class="owl-video-play-icon"></div>'
#      d = if k.lazyLoad then '<div class="owl-video-tn ' + j + '" ' + i + '="' + a + '"></div>' else '<div class="owl-video-tn" style="opacity:1;background-image:url(' + a + ')"></div>'
#      b.after(d)
#      b.after(e)
#      return
#
#    if b.wrap('<div class="owl-video-wrapper"' + g + '></div>')
#      @_core.settings.lazyLoad and i = 'data-src'
#      j = 'owl-lazy'
#
#      h.length
#
#      return l(h.attr(i))
#      h.remove()
#      !1
#
#    if 'youtube' == c.type then f = '//img.youtube.com/vi/' + c.id + '/hqdefault.jpg'
#    l(f)
#else if 'vimeo' == c.type then a.ajax(
#  type: 'GET'
#  url: '//vimeo.com/api/v2/video/' + c.id + '.json'
#  jsonp: 'callback'
#  dataType: 'jsonp'
#  success: ((a) ->
#    f = a[0].thumbnail_large
#    l(f)
#    return
#  )) else 'vzaar' == c.type and a.ajax(
#  type: 'GET'
#  url: '//vzaar.com/api/videos/' + c.id + '.json'
#  jsonp: 'callback'
#  dataType: 'jsonp'
#  success: ((a) ->
#    f = a.framegrab_url
#    l(f)
#    return
#  ))
#return
#
#e::stop = ->
#  @_core.trigger('stop', null, 'video')
#  @_playing.find('.owl-video-frame').remove()
#  @_playing.removeClass('owl-video-playing')
#  @_playing = null
#  @_core.leave('playing')
#  @_core.trigger('stopped', null, 'video')
#  return
#
#e::play = (b) ->
#  `var c`
#  `var d`
#  `var e`
#  c = undefined
#  d = a(b.target)
#  e = d.closest('.' + @_core.settings.itemClass)
#  f = @_videos[e.attr('data-video')]
#  g = f.width or '100%'
#  h = f.height or @_core.$stage.height()
#  @_playing or @_core.enter('playing')
#  @_core.trigger('play', null, 'video')
#  e = @_core.items(@_core.relative(e.index()))
#  @_core.reset(e.index())
#  if 'youtube' == f.type then (c = '<iframe width="' + g + '" height="' + h + '" src="//www.youtube.com/embed/' + f.id + '?autoplay=1&rel=0&v=' + f.id + '" frameborder="0" allowfullscreen></iframe>') else if 'vimeo' == f.type then (c = '<iframe src="//player.vimeo.com/video/' + f.id + '?autoplay=1" width="' + g + '" height="' + h + '" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>') else 'vzaar' == f.type and (c = '<iframe frameborder="0"height="' + h + '"width="' + g + '" allowfullscreen mozallowfullscreen webkitAllowFullScreen src="//view.vzaar.com/' + f.id + '/player?autoplay=true"></iframe>')
#  a('<div class="owl-video-frame">' + c + '</div>').insertAfter(e.find('.owl-video'))
#  @_playing = e.addClass('owl-video-playing')
#  return
#
#e::isInFullScreen = ->
#  `var b`
#  b = c.fullscreenElement or c.mozFullScreenElement or c.webkitFullscreenElement
#  b and a(b).parent().hasClass('owl-video-frame')
#
#e::destroy = ->
#  `var a`
#  `var b`
#  a = undefined
#  b = undefined
#  @_core.$element.off 'click.owl.video'
#  for a of @_handlers
#    @_core.$element.off a, @_handlers[a]
#  for b of Object.getOwnPropertyNames(this)
#    'function' != typeof @[b] and (@[b] = null)
#  return
#
#a.fn.owlCarousel.Constructor.Plugins.Video = e
#return
#)(window.Zepto or window.jQuery, window, document)
#((a, b, c, d) ->
#
#  e = (b) ->
#    @core = b
#    @core.options = a.extend({}, e.Defaults, @core.options)
#    @swapping = !0
#    @previous = d
#    @next = d
#    @handlers =
#      'change.owl.carousel': a.proxy(((a) ->
#        a.namespace and 'position' == a.property.name and @previous = @core.current()
#        @next = a.property.value
#        return
#      ), this)
#      'drag.owl.carousel dragged.owl.carousel translated.owl.carousel': a.proxy(((a) ->
#        a.namespace and (@swapping = 'translated' == a.type)
#        return
#      ), this)
#      'translate.owl.carousel': a.proxy(((a) ->
#        a.namespace and @swapping and (@core.options.animateOut or @core.options.animateIn) and @swap()
#        return
#      ), this)
#    @core.$element.on(@handlers)
#    return
#
#  e.Defaults =
#    animateOut: !1
#    animateIn: !1
#
#  e::swap = ->
#    `var b`
#    `var c`
#    `var d`
#    `var e`
#    if 1 == @core.settings.items and a.support.animation and a.support.transition
#      @core.speed 0
#      b = undefined
#      c = a.proxy(@clear, this)
#      d = @core.$stage.children().eq(@previous)
#      e = @core.$stage.children().eq(@next)
#      f = @core.settings.animateIn
#      g = @core.settings.animateOut
#      @core.current() != @previous and g and b = @core.coordinates(@previous) - @core.coordinates(@next)
#      d.one(a.support.animation.end, c).css(left: b + 'px').addClass('animated owl-animated-out').addClass(g)
#
#      f and e.one(a.support.animation.end, c).addClass('animated owl-animated-in').addClass(f)
#    return
#
#  e::clear = (b) ->
#    a(b.target).css(left: '').removeClass('animated owl-animated-out owl-animated-in').removeClass(@core.settings.animateIn).removeClass(@core.settings.animateOut)
#    @core.onTransitionEnd()
#    return
#
#  e::destroy = ->
#    `var a`
#    `var b`
#    a = undefined
#    b = undefined
#    for a of @handlers
#      @core.$element.off a, @handlers[a]
#    for b of Object.getOwnPropertyNames(this)
#      'function' != typeof @[b] and (@[b] = null)
#    return
#
#  a.fn.owlCarousel.Constructor.Plugins.Animate = e
#  return
#)(window.Zepto or window.jQuery, window, document)
#((a, b, c, d) ->
#
#  e = (b) ->
#    @_core = b
#    @_timeout = null
#    @_paused = !1
#    @_handlers =
#      'changed.owl.carousel': a.proxy(((a) ->
#        if a.namespace and 'settings' == a.property.name then (if @_core.settings.autoplay then @play() else @stop()) else a.namespace and 'position' == a.property.name and @_core.settings.autoplay and @_setAutoPlayInterval()
#        return
#      ), this)
#      'initialized.owl.carousel': a.proxy(((a) ->
#        a.namespace and @_core.settings.autoplay and @play()
#        return
#      ), this)
#      'play.owl.autoplay': a.proxy(((a, b, c) ->
#        a.namespace and @play(b, c)
#        return
#      ), this)
#      'stop.owl.autoplay': a.proxy(((a) ->
#        a.namespace and @stop()
#        return
#      ), this)
#      'mouseover.owl.autoplay': a.proxy((->
#        @_core.settings.autoplayHoverPause and @_core.is('rotating') and @pause()
#        return
#      ), this)
#      'mouseleave.owl.autoplay': a.proxy((->
#        @_core.settings.autoplayHoverPause and @_core.is('rotating') and @play()
#        return
#      ), this)
#      'touchstart.owl.core': a.proxy((->
#        @_core.settings.autoplayHoverPause and @_core.is('rotating') and @pause()
#        return
#      ), this)
#      'touchend.owl.core': a.proxy((->
#        @_core.settings.autoplayHoverPause and @play()
#        return
#      ), this)
#    @_core.$element.on(@_handlers)
#    @_core.options = a.extend({}, e.Defaults, @_core.options)
#    return
#
#  e.Defaults =
#    autoplay: !1
#    autoplayTimeout: 5e3
#    autoplayHoverPause: !1
#    autoplaySpeed: !1
#
#  e::play = (a, b) ->
#    @_paused = !1
#    @_core.is('rotating') or @_core.enter('rotating')
#    @_setAutoPlayInterval()
#
#    return
#
#  e::_getNextTimeout = (d, e) ->
#    @_timeout and b.clearTimeout(@_timeout)
#    b.setTimeout(a.proxy((->
#      @_paused or @_core.is('busy') or @_core.is('interacting') or c.hidden or @_core.next(e or @_core.settings.autoplaySpeed)
#      return
#    ), this), d or @_core.settings.autoplayTimeout)
#
#  e::_setAutoPlayInterval = ->
#    @_timeout = @_getNextTimeout()
#    return
#
#  e::stop = ->
#    @_core.is('rotating') and b.clearTimeout(@_timeout)
#    @_core.leave('rotating')
#    return
#
#  e::pause = ->
#    @_core.is('rotating') and (@_paused = !0)
#    return
#
#  e::destroy = ->
#    `var a`
#    `var b`
#    a = undefined
#    b = undefined
#    @stop()
#    for a of @_handlers
#      @_core.$element.off a, @_handlers[a]
#    for b of Object.getOwnPropertyNames(this)
#      'function' != typeof @[b] and (@[b] = null)
#    return
#
#  a.fn.owlCarousel.Constructor.Plugins.autoplay = e
#  return
#)(window.Zepto or window.jQuery, window, document)
#((a, b, c, d) ->
#  'use strict'
#
#  e = (b) ->
#    @_core = b
#    @_initialized = !1
#    @_pages = []
#    @_controls = {}
#    @_templates = []
#    @$element = @_core.$element
#    @_overrides =
#      next: @_core.next
#      prev: @_core.prev
#      to: @_core.to
#    @_handlers =
#      'prepared.owl.carousel': a.proxy(((b) ->
#        b.namespace and @_core.settings.dotsData and @_templates.push('<div class="' + @_core.settings.dotClass + '">' + a(b.content).find('[data-dot]').addBack('[data-dot]').attr('data-dot') + '</div>')
#        return
#      ), this)
#      'added.owl.carousel': a.proxy(((a) ->
#        a.namespace and @_core.settings.dotsData and @_templates.splice(a.position, 0, @_templates.pop())
#        return
#      ), this)
#      'remove.owl.carousel': a.proxy(((a) ->
#        a.namespace and @_core.settings.dotsData and @_templates.splice(a.position, 1)
#        return
#      ), this)
#      'changed.owl.carousel': a.proxy(((a) ->
#        a.namespace and 'position' == a.property.name and @draw()
#        return
#      ), this)
#      'initialized.owl.carousel': a.proxy(((a) ->
#        a.namespace and !@_initialized and @_core.trigger('initialize', null, 'navigation')
#        @initialize()
#        @update()
#        @draw()
#        @_initialized = !0
#        @_core.trigger('initialized', null, 'navigation')
#        return
#      ), this)
#      'refreshed.owl.carousel': a.proxy(((a) ->
#        a.namespace and @_initialized and @_core.trigger('refresh', null, 'navigation')
#        @update()
#        @draw()
#        @_core.trigger('refreshed', null, 'navigation')
#        return
#      ), this)
#    @_core.options = a.extend({}, e.Defaults, @_core.options)
#    @$element.on(@_handlers)
#    return
#
#  e.Defaults =
#    nav: !1
#    navText: [
#      'prev'
#      'next'
#    ]
#    navSpeed: !1
#    navElement: 'div'
#    navContainer: !1
#    navContainerClass: 'owl-nav'
#    navClass: [
#      'owl-prev'
#      'owl-next'
#    ]
#    slideBy: 1
#    dotClass: 'owl-dot'
#    dotsClass: 'owl-dots'
#    dots: !0
#    dotsEach: !1
#    dotsData: !1
#    dotsSpeed: !1
#    dotsContainer: !1
#
#  e::initialize = ->
#    `var b`
#    `var c`
#    b = undefined
#    c = @_core.settings
#    @_controls.$relative = (if c.navContainer then a(c.navContainer) else a('<div>').addClass(c.navContainerClass).appendTo(@$element)).addClass('disabled')
#    @_controls.$previous = a('<' + c.navElement + '>').addClass(c.navClass[0]).html(c.navText[0]).prependTo(@_controls.$relative).on('click', a.proxy(((a) ->
#      @prev c.navSpeed
#      return
#    ), this))
#    @_controls.$next = a('<' + c.navElement + '>').addClass(c.navClass[1]).html(c.navText[1]).appendTo(@_controls.$relative).on('click', a.proxy(((a) ->
#      @next c.navSpeed
#      return
#    ), this))
#    c.dotsData or (@_templates = [ a('<div>').addClass(c.dotClass).append(a('<span>')).prop('outerHTML') ])
#    @_controls.$absolute = (if c.dotsContainer then a(c.dotsContainer) else a('<div>').addClass(c.dotsClass).appendTo(@$element)).addClass('disabled')
#    @_controls.$absolute.on('click', 'div', a.proxy(((b) ->
#      `var d`
#      d = if a(b.target).parent().is(@_controls.$absolute) then a(b.target).index() else a(b.target).parent().index()
#      b.preventDefault()
#      @to(d, c.dotsSpeed)
#      return
#    ), this))
#    for b of @_overrides
#      @_core[b] = a.proxy(@[b], this)
#    return
#
#  e::destroy = ->
#    `var a`
#    `var b`
#    `var c`
#    `var d`
#    a = undefined
#    b = undefined
#    c = undefined
#    d = undefined
#    for a of @_handlers
#      @$element.off a, @_handlers[a]
#    for b of @_controls
#      @_controls[b].remove()
#    for d of @overides
#      @_core[d] = @_overrides[d]
#    for c of Object.getOwnPropertyNames(this)
#      'function' != typeof @[c] and (@[c] = null)
#    return
#
#  e::update = ->
#    `var a`
#    `var b`
#    `var c`
#    `var d`
#    `var e`
#    a = undefined
#    b = undefined
#    c = undefined
#    d = @_core.clones().length / 2
#    e = d + @_core.items().length
#    f = @_core.maximum(!0)
#    g = @_core.settings
#    h = if g.center or g.autoWidth or g.dotsData then 1 else g.dotsEach or g.items
#    if 'page' != g.slideBy and (g.slideBy = Math.min(g.slideBy, g.items))
#      g.dots or 'page' == g.slideBy
#
#      @_pages = []
#      a = d
#      b = 0
#      c = 0
#      while a < e
#        if b >= h or 0 == b
#          if @_pages.push(
#            start: Math.min(f, a - d)
#            end: a - d + h - 1)
#            Math.min(f, a - d) == f
#
#            break
#          b = 0
#          ++c
#        b += @_core.mergers(@_core.relative(a))
#        a++
#    return
#
#  e::draw = ->
#    `var b`
#    `var c`
#    `var d`
#    `var e`
#    b = undefined
#    c = @_core.settings
#    d = @_core.items().length <= c.items
#    e = @_core.relative(@_core.current())
#    f = c.loop or c.rewind
#    @_controls.$relative.toggleClass('disabled', !c.nav or d)
#    c.nav and @_controls.$previous.toggleClass('disabled', !f and e <= @_core.minimum(!0))
#    @_controls.$next.toggleClass('disabled', !f and e >= @_core.maximum(!0))
#
#    @_controls.$absolute.toggleClass('disabled', !c.dots or d)
#    c.dots and b = @_pages.length - (@_controls.$absolute.children().length)
#    if c.dotsData and 0 != b then @_controls.$absolute.html(@_templates.join('')) else if b > 0 then @_controls.$absolute.append(new Array(b + 1).join(@_templates[0])) else b < 0 and @_controls.$absolute.children().slice(b).remove()
#    @_controls.$absolute.find('.active').removeClass('active')
#    @_controls.$absolute.children().eq(a.inArray(@current(), @_pages)).addClass('active')
#
#    return
#
#  e::onTrigger = (b) ->
#    `var c`
#    c = @_core.settings
#    b.page =
#      index: a.inArray(@current(), @_pages)
#      count: @_pages.length
#      size: c and (if c.center or c.autoWidth or c.dotsData then 1 else c.dotsEach or c.items)
#    return
#
#  e::current = ->
#    `var b`
#    b = @_core.relative(@_core.current())
#    a.grep(@_pages, a.proxy(((a, c) ->
#      a.start <= b and a.end >= b
#    ), this)).pop()
#
#  e::getPosition = (b) ->
#    `var c`
#    `var d`
#    `var e`
#    c = undefined
#    d = undefined
#    e = @_core.settings
#    if 'page' == e.slideBy then c = a.inArray(@current(), @_pages)
#    d = @_pages.length
#    if b then ++c else --c
#    c = @_pages[(c % d + d) % d].start
#else c = @_core.relative(@_core.current())
#d = @_core.items().length
#if b then (c += e.slideBy) else (c -= e.slideBy)
#
#c
#
#e::next = (b) ->
#  a.proxy(@_overrides.to, @_core) @getPosition(!0), b
#  return
#
#e::prev = (b) ->
#  a.proxy(@_overrides.to, @_core) @getPosition(!1), b
#  return
#
#e::to = (b, c, d) ->
#  `var e`
#  e = undefined
#  if !d and @_pages.length then e = @_pages.length
#  a.proxy(@_overrides.to, @_core)(@_pages[(b % e + e) % e].start, c)
#else a.proxy(@_overrides.to, @_core)(b, c)
#return
#
#a.fn.owlCarousel.Constructor.Plugins.Navigation = e
#return
#)(window.Zepto or window.jQuery, window, document)
#((a, b, c, d) ->
#  'use strict'
#
#  e = (c) ->
#    @_core = c
#    @_hashes = {}
#    @$element = @_core.$element
#    @_handlers =
#      'initialized.owl.carousel': a.proxy(((c) ->
#        c.namespace and 'URLHash' == @_core.settings.startPosition and a(b).trigger('hashchange.owl.navigation')
#        return
#      ), this)
#      'prepared.owl.carousel': a.proxy(((b) ->
#        `var c`
#        if b.namespace
#          c = a(b.content).find('[data-hash]').addBack('[data-hash]').attr('data-hash')
#          if !c
#            return
#          @_hashes[c] = b.content
#        return
#      ), this)
#      'changed.owl.carousel': a.proxy(((c) ->
#        `var d`
#        `var e`
#        if c.namespace and 'position' == c.property.name
#          d = @_core.items(@_core.relative(@_core.current()))
#          e = a.map(@_hashes, (a, b) ->
#            if a == d then b else null
#          ).join()
#          if !e or b.location.hash.slice(1) == e
#            return
#          b.location.hash = e
#        return
#      ), this)
#    @_core.options = a.extend({}, e.Defaults, @_core.options)
#    @$element.on(@_handlers)
#    a(b).on('hashchange.owl.navigation', a.proxy(((a) ->
#      `var c`
#      `var e`
#      c = b.location.hash.substring(1)
#      e = @_core.$stage.children()
#      f = @_hashes[c] and e.index(@_hashes[c])
#      f != d and f != @_core.current() and @_core.to(@_core.relative(f), !1, !0)
#      return
#    ), this))
#    return
#
#  e.Defaults = URLhashListener: !1
#
#  e::destroy = ->
#    `var c`
#    `var d`
#    c = undefined
#    d = undefined
#    a(b).off 'hashchange.owl.navigation'
#    for c of @_handlers
#      @_core.$element.off c, @_handlers[c]
#    for d of Object.getOwnPropertyNames(this)
#      'function' != typeof @[d] and (@[d] = null)
#    return
#
#  a.fn.owlCarousel.Constructor.Plugins.Hash = e
#  return
#)(window.Zepto or window.jQuery, window, document)
#((a, b, c, d) ->
#  g = a('<support>').get(0).style
#  h = 'Webkit Moz O ms'.split(' ')
#  i =
#    transition: end:
#      WebkitTransition: 'webkitTransitionEnd'
#      MozTransition: 'transitionend'
#      OTransition: 'oTransitionEnd'
#      transition: 'transitionend'
#    animation: end:
#      WebkitAnimation: 'webkitAnimationEnd'
#      MozAnimation: 'animationend'
#      OAnimation: 'oAnimationEnd'
#      animation: 'animationend'
#  j =
#    csstransforms: ->
#      ! !e('transform')
#    csstransforms3d: ->
#      ! !e('perspective')
#    csstransitions: ->
#      ! !e('transition')
#    cssanimations: ->
#      ! !e('animation')
#
#  e = (b, c) ->
#    `var e`
#    e = !1
#    f = b.charAt(0).toUpperCase() + b.slice(1)
#    a.each((b + ' ' + h.join(f + ' ') + f).split(' '), (a, b) ->
#      if g[b] != d
#        return e = !c or b
#        !1
#
#      return
#    )
#    e
#
#  f = (a) ->
#    e a, !0
#
#  j.csstransitions() and a.support.transition = new String(f('transition'))
#  a.support.transition.end = i.transition.end[a.support.transition]
#
#  j.cssanimations() and a.support.animation = new String(f('animation'))
#  a.support.animation.end = i.animation.end[a.support.animation]
#
#  j.csstransforms() and a.support.transform = new String(f('transform'))
#  a.support.transform3d = j.csstransforms3d()
#
#  return
#)(window.Zepto or window.jQuery, window, document)
#
## ---
## generated by js2coffee 2.2.0