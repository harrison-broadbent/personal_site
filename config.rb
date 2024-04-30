# frozen_string_literal: true

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :meta_tags
activate :sitemap, :gzip => false, :hostname => "https://harrisonbroadbent.com"

#-------------#

# MARKDOWN
#
activate :syntax
set :markdown_engine, :kramdown
set :markdown, input: "GFM", smartypants: true, format: :html5

#-------------#

# LAYOUTS
#
# Per-page layout changes
page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false

# With alternative layout
page "/notes/*", layout: "writing_layout"
page "/woodworking/*", layout: "writing_layout"
page "/sourdough/*", layout: "writing_layout"
page "/electronics/*", layout: "writing_layout"

#-------------#

# MINIFY
#
# activate :minify_css # does not work with tailwindcss
activate :minify_javascript
