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

# grader
#= require "_grader.js"

$ -> App.start()
