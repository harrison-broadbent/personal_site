# frozen_string_literal: true

activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

activate :syntax
activate :meta_tags

################
### MARKDOWN ###
################

set :markdown_engine, :kramdown
set :markdown, fenced_code_blocks: true, smartypants: true, format: :html5

###############
##### END #####
###############

#-------------#

###############
### LAYOUTS ###
###############

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
page '/notes/*', layout: 'writing_layout'
page '/sourdough/*', layout: 'writing_layout'
page '/electronics/*', layout: 'writing_layout'

###############
##### END #####
###############

# minify files
activate :minify_css
activate :minify_javascript
