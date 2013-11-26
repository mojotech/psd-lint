#= require "test/_test_psd.js"

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

# views
#= require "views/_grade_layout"
#= require "views/_results"
#= require "views/_result_row"
#= require "views/_bad_layers"
#= require "views/_fonts_used"
#= require "views/_single_font"

$ -> App.start()
