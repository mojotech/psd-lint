# utils
#= require "util/_walker.js"

# linters
#= require "linters/_layers.js"
#= require "linters/_layer_types.js"
#= require "linters/_fonts.js"
#= require "linters/_empty_groups.js"
#= require "linters/_blending_modes.js"

# application
#= require "_application"
#= require "_router"

# views
#= require "views/_layer_expandable"
#= require "views/_expandable_layers"
#= require "views/_grade_layout"
#= require "views/_results"
#= require "views/_result_row"
#= require "views/_bad_layers"
#= require "views/_fonts_used"
#= require "views/_single_font"
#= require "views/_blending_modes"
#= require "views/_blending_mode"
#= require "views/_upload"
#= require "views/_font_sizes"
#= require "views/_font_size"
#= require "views/_empty_groups"

$ -> App.start()
