---
title: Redirect www. URLs to non-www within Cloudflare
description: In this article, I show you how to redirect a www. URL to the non-www URL within Cloudflare, using a custom Redirect Rule. Cloudflare has only recently supported using Redirect Rules to map a www. request to your root domain; This article walks you through setting one up.
date: November 16 2024
---

> In this article, I show you how to redirect a www. URL to the non-www URL within Cloudflare, using a custom Redirect Rule. Cloudflare has only recently supported using Redirect Rules to map a www. request to your root domain; This article walks you through setting one up.

<!-- table of contents (html disclosure + kramdown {:toc}) -->
<details class='italic bg-stone-100 py-1 px-3 rounded-sm border border-stone-200' open><summary>Table of Contents</summary><aside markdown="1">
* seed list
{:toc}
</aside></details>

## Introduction

I've occasionally run into the annoying problem of trying to map `www.` requests to the non-www version (aka the "root" or "apex"). Given I use [Cloudflare](https://cloudflare.com) to manage most of my domains, and given everything else they offer, I figured they'd have a way to re-map these routes.

**Turns out, [Redirect Rules](https://developers.cloudflare.com/rules/url-forwarding/) are what I — and probably you — are after.**

Cloudflare's Redirect Rules let you re-map requests to your website and forward them to another URL, including using wildcards (`*`) and wildcard passthroughs (`${1}, ${2}` etc.). These are what we'll use to re-map a request from `www.yoursite.com` to `yoursite.com`.

You can specify a `30x` status code for your redirect, which makes these quite versatile. You'll almost certainly want to use a 301 redirect — [as of mid-2016, they don't affect SEO](https://ahrefs.com/blog/301-redirects/#do-301-redirects-affect-seo:~:text=However%2C%20Google%20changed%20its%20official%20stance%C2%A0on%20this%20matter%20in%C2%A02016%3A).

## Creating a Redirect Rule to map `www.` requests to non-www.

> Note: As of Sept 5th, Cloudflare has a [selection of Rules Templates](https://community.cloudflare.com/t/new-rules-templates-in-one-click/708089) you can pick directly from, _including a "Redirect from WWW to Root" rule!_ This is probably exactly what you're after — just go to **Rules > Templates > Redirect from WWW to Root > Create a Rule**, and you should be all set!

It takes less than 2 minutes to use Cloudflare to redirect `www` requests to non-www ones. Open your Cloudflare Dashboard, select a website, then go to **Rules > Redirect Rules > Single Redirects > [+ Create rule]**.

You might get prompted to directly create a "Redirect from WWW to Root" rule, in which case just click "Create a Rule", save it, and you're done!

To add a WWW to Root redirect rule manually though, do the following:

1. Give your rule a name,
2. Make sure `Wildcard pattern` is selected, then set "Request URL" to `https://www.*` — this globs everything after `www.`, which we can access using `${1}` in the Target URL section.
3. Set "Target URL" to `https://${1}`, and status code to `301` — a 301 redirect status indicates a permanent redirect, and [as of mid-2016, don't affect SEO](https://ahrefs.com/blog/301-redirects/#do-301-redirects-affect-seo:~:text=However%2C%20Google%20changed%20its%20official%20stance%C2%A0on%20this%20matter%20in%C2%A02016%3A).
4. You probably want to check "Preserve query string" to ensure any query params to the original www URL are passed-through by Cloudflare to the non-www URL.
5. Click "Deploy" and you're done!

## Conclusion

Hope that was helpful! I spent a while trawling through [old forum answers](https://community.cloudflare.com/t/redirect-the-www-to-non-www/558655) and setting up a similar rule using the [now deprecated Page Rules](https://community.cloudflare.com/t/page-rules-are-deprecated/664235) — I threw together this short guide so you don't have to do the same!

I haven't noticed any SEO / Google Search Console downsides to using this. In fact, there's far fewer duplicate-URLs in my Google Search Console, which I can only assume is somewhat positive. YMMV but so far, so good.
