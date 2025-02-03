# Template config
#
set :site_url, "https://harrisonbroadbent.com"
set :site_title, "Harrison Broadbent" # site title for <title> meta tag
set :menu_pages, {
      About: "/about",
      Now: "/now",
      Reading: "/reading",
      Running: "/running",
      Blog: "/blog",
      Stack: "/stack",
      Electronics: "/electronics",
      Sourdough: "/sourdough",
      Woodworking: "/woodworking",
    }
set :trailing_slash, false

# Extensions
#
activate :livereload                # live-reloading in dev
activate :directory_indexes         # for pretty URLs
activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :blog do |blog|
  blog.name = "blog"
  blog.prefix = "blog" 							 # directory prefix
  blog.layout = "blog_layout" 	# layout from source/layouts
  blog.sources = "{title}.html" 		# filename glob
  blog.permalink = "{title}.html"   # format of the URLs middleman generates
  blog.default_extension = ".md" 		# file extension
  blog.publish_future_dated = true  # by default only builds posts with future dates
  blog.new_article_template = File.expand_path("../source/template.erb", __FILE__)
end

activate :blog do |b_electronics|
  b_electronics.name = "electronics"
  b_electronics.prefix = "electronics" # directory prefix
  b_electronics.layout = "markdown_layout" 	  # layout from source/layouts
  b_electronics.sources = "{title}.html" 		  # filename glob
  b_electronics.permalink = "{title}.html"     # format of the URLs middleman generates
  b_electronics.default_extension = ".md" 		  # file extension
  b_electronics.publish_future_dated = true    # by default only builds posts with future dates
  b_electronics.new_article_template = File.expand_path("../source/template.erb", __FILE__)
end

activate :blog do |b_sourdough|
  b_sourdough.name = "sourdough"
  b_sourdough.prefix = "sourdough" # directory prefix
  b_sourdough.layout = "markdown_layout" 	  # layout from source/layouts
  b_sourdough.sources = "{title}.html" 		  # filename glob
  b_sourdough.permalink = "{title}.html"     # format of the URLs middleman generates
  b_sourdough.default_extension = ".md" 		  # file extension
  b_sourdough.publish_future_dated = true    # by default only builds posts with future dates
  b_sourdough.new_article_template = File.expand_path("../source/template.erb", __FILE__)
end

activate :blog do |b_woodworking|
  b_woodworking.name = "woodworking"
  b_woodworking.prefix = "woodworking" # directory prefix
  b_woodworking.layout = "markdown_layout" 	  # layout from source/layouts
  b_woodworking.sources = "{title}.html" 		  # filename glob
  b_woodworking.permalink = "{title}.html"     # format of the URLs middleman generates
  b_woodworking.default_extension = ".md" 		  # file extension
  b_woodworking.publish_future_dated = true    # by default only builds posts with future dates
  b_woodworking.new_article_template = File.expand_path("../source/template.erb", __FILE__)
end

# Middleman doesn't support per-filetype layouts.
# The blog/ files already use the markdown layout, but we need to configure
# these top-level files separately.
#
# See 'Layouts' (https://middlemanapp.com/basics/layouts/)
#
markdown_pages = [
  "about", "blog", "stack", "software",
  "now", "woodworking", "reading", "running", "electronics",
  "sourdough",
]
markdown_pages.each do |pge|
  page "/#{pge}.html", :layout => "markdown_layout"
end

page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false

#-------------#

# MARKDOWN
#
activate :syntax                    # code highlighting
set :markdown_engine, :kramdown     # md parsing
set :markdown,                      # config for :kramdown
    input: "GFM",
    smartypants: true,
    toc_levels: 2..6,               # H2->H6 appear in markdown {:toc} block
    format: :html5

#-------------#

# configure :build do
#   activate :minify_css
#   activate :minify_javascript, compressor: Terser.new
# end
