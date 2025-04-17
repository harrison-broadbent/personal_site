---
title: Add an RSS feed to your Middleman blog
description: Learn how to quickly add an RSS feed to any website built in the Middleman Ruby gem. Plus, copy the RSS feed builder code directly into your own app.
date: April 17th, 2025
---

<details class='bg-stone-100 px-3 py-1 border border-stone-200 rounded-sm italic'>
<summary>Table of Contents</summary>
<aside markdown="1">
* seed list
{:toc}
</aside>
</details>

**You're probably trying to add an RSS feed to your Middleman website.** Unfortunately, Middleman doesn't ship with an RSS feed, nor are there any all-in-one gems to easily add one.

However! Middleman _does_ integrate with the [builder gem](https://github.com/jimweirich/builder), which renders XML data using Ruby code. We can use the `builder` gem to render a `feed.xml` file for us by specifying a `feed.xml.builder` file. This is similar to specifying a `sitemap.xml` file using a `sitemap.xml.builder` file, just with different syntax.

> I've packaged up the `feed.xml.builder` file below with a bunch of other features and released it as a [Middleman & Tailwind CSS Starter Blog Template](https://github.com/harrison-broadbent/ruby-middleman-tailwind-starter-blog) which you might like.
>
> You can view it live here — [middleman blog template (live)](https://ruby-middleman-tailwind-starter-blog.pages.dev) — and the sitemap here, [middleman template sitemap](https://ruby-middleman-tailwind-starter-blog.pages.dev/feed.xml).

Below is a working RSS feed builder I'm using in my Middleman blogs (including this one!).

## RSS Feed builder for your Middleman site

Here's the `feed.xml.builder` file I use to generate my RSS feed. Below it is a short explanation, but if you copy the code below into your Middleman app at `source/feed.xml.builder`, it should work automatically.

```ruby
# source/feed.xml.builder
#
site_url   = config.site_url
title      = "[insert title]"
desc       = "[insert description]"

# All posts in reverse‑chronological order
posts = blog.articles.sort_by(&:date).reverse

xml.instruct! :xml, version: '1.0', encoding: 'utf-8'
xml.rss version: "2.0", "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title       title
    xml.link        site_url
    xml.description desc
    xml.language    'en-us'
    xml.lastBuildDate(posts.first.date.to_time.rfc2822) if posts.any?
    xml.tag!("atom:link", href: "#{site_url}/feed.xml", rel: "self", type: "application/rss+xml")

    posts.each do |post|
      xml.item do
        xml.guid        "#{site_url}#{post.url}"
        xml.link        "#{site_url}#{post.url}"
        xml.title       post.data.title
        xml.pubDate     post.date.to_time.rfc2822
        xml.description post.data.description
      end
    end
  end
end
```

This RSS feed is fully compliant and passed the [W3C RSS Feed validator](https://validator.w3.org/feed/). Just copy it into your Middleman app, add your site title and description, and you should be golden.

To break down how it works:

- We first grab all the blog posts and store them in `posts`. If you have multiple blogs, you should specify the blog name like `blog("name").articles...`.
- Next we setup all the metadata for the RSS feed — information on your websites, it's URL etc. We use `xml.tag!` to insert a raw tag for `atom:link` which is needed for compliance to the RSS spec.
- Finally, we add each blog post into the RSS feed and include a bit of information about them. _This setup assumes each of your blog posts has `title`, `description`, and `date` available in it's frontmatter._

## Conclusion

Thanks for reading!

I hope this helped you add an RSS feed to your Middleman site.
