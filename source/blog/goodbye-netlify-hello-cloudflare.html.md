---
title: Goodbye Netlify, Hello Cloudflare.
description:
date: June 6 2024
---

> I've used Netlify for a long time, and they've always been solid. Then, [one of my blog posts](https://dumbph.com/turn-iphone-into-dumb-phone) hit the [frontpage of Hacker News](/blog/hacker-news-traffic-spike-anatomy), Netlify recorded 233Gb of bandwidth usage and sent me a bill for $110, and I started to question things...

<!-- table of contents (html disclosure + kramdown {:toc}) -->
<details class='italic bg-stone-100 py-1 px-3 rounded-sm border border-stone-200' open><summary>Table of Contents</summary><aside markdown="1">
* seed list
{:toc}
</aside></details>

## Introduction

It's March 2020, the world was shutting down, and I'd just `git push-ed` this site's first commit (auto-deployed with Netlify):

![hacker news story in 1st place](images/blog/goodbye-netlify-hello-cloudflare/commit.png)

Now, 4 years later, **I've completely migrated off Netlify**. I don't have a single site left with them.

**Why?** One simple reason — bandwidth overage.

## Bandwidth overage

Netlify bills for bandwidth [over a certain limit](https://www.netlify.com/pricing/#pricing-table:~:text=100GB%20/month%0Athen%20%2455%20per%20100GB), and there's been some recent [horror stories](https://news.ycombinator.com/item?id=39520776) about runaway bandwidth charges. The horror HN thread describes how Netlify issued a bill for **$104k to a site owner who was DDoS-ed (causing a massive bandwidth spike).**

Netlify's CEO replied in the HN thread with:

> "It's currently our policy to not shut down free sites during traffic spikes that doesn't match attack patterns, but instead forgiving any bills from legitimate mistakes after the fact."
>
> [- bobfunk (Netlify CEO) on Hacker News](https://news.ycombinator.com/item?id=39520776#:~:text=charged%20for%20this.-,It%27s%20currently%20our%20policy%20to%20not%20shut%20down%20free%20sites%20during%20traffic%20spikes%20that%20doesn%27t%20match%20attack%20patterns%2C%20but%20instead%20forgiving%20any%20bills%20from%20legitimate%20mistakes%20after%20the%20fact.,-Apologies%20that%20this)

I _knew_ this about this. I'd _seen_ the Hacker News thread. Unfortunately, that didn't do anything to lessen my shock when, during a [Hacker News traffic spike](/blog/hacker-news-traffic-spike-anatomy), I logged into my Netlify dashboard and saw my ballooning bandwidth usage:

![hacker news story in 1st place](images/blog/goodbye-netlify-hello-cloudflare/233gb.png)_My bandwidth ballooning to 233 GB/100 GB during a HN traffic spike._

I didn't miss the accompanying invoice (now overdue) on my Netlify account:

![hacker news story in 1st place](images/blog/goodbye-netlify-hello-cloudflare/bill.png)_Netlify issuing an invoice of $110 USD for the bandwidth usage._

Runaway cloud charges aren't a new thing. There's a similar story regarding a [$3k bill from Vercel](https://www.reddit.com/r/nextjs/comments/12dngvg/small_mistake_leads_to_3000_bill_from_vercel_and/?rdt=49055), and although unrelated to bandwidth, was still at the forefront of my mind as I considered whether I wanted even a _small possibility_ of being on the hook for similar runaway charges.

The answer was, of course, **"no"**.

It took about 2 hours to migrate two sites from Netlify to Cloudflare Pages, and now I sleep slightly better at night.

## Static host bandwidth overage charges (breakdown)

Here's a short breakdown of the current (June 2024) state of various static hosts around the web.

**The TLDR; is that for _static sites & pages_, Cloudflare and Render both have unlimited offerings and are the two I'd recommend** (note that I'm only recommending Render based on their features. I've used their compute platform, but not their static hosting).

I think it's difficult to justify the other hosts on this list. With borderline-identical offerings, why would you choose a provider with bandwidth limits over one without?

| Host                 | Limit       | Charge    | Source                                                                                                                                                                                                                                                                                                  |
| -------------------- | ----------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Cloudflare Pages** | ∞           | N/A       | [Unlimited bandwidth](https://pages.cloudflare.com/#:~:text=Unlimited%20static%20requests-,Unlimited%20bandwidth,Sign%20Up,-Pro)                                                                                                                                                                        |
| **Render**           | ∞ (inbound) | N/A       | [inbound bandwidth is free](https://render.com/pricing#:~:text=Custom-,Free%20Bandwidth,-100%20GB)                                                                                                                                                                                                      |
| GitHub Pages         | 100 GB      | N/A       | [soft bandwidth limit of 100 GB/month](https://docs.github.com/en/pages/getting-started-with-github-pages/about-github-pages#:~:text=GitHub%20Pages%20sites%20have%20a,a%20custom%20GitHub%20Actions%20workflow.)                                                                                       |
| Vercel (Hobby)       | 100 GB      | N/A       | [100 GB limit ](https://vercel.com/docs/accounts/plans/hobby#:~:text=Fast%20Data%20Transfer-,First%20100%20GB,-First%201%20TB), [no billing for Hobby plan](https://vercel.com/docs/accounts/plans/hobby#:~:text=As%20the%20Hobby%20plan%20is%20a%20free%20tier%20there%20are%20no%20billing%20cycles.) |
| Netlify              | 100 GB      | $55/100GB | [100 GB limit, then $55 per 100GB](https://www.netlify.com/pricing/#pricing-table:~:text=100GB%20/month%0Athen%20%2455%20per%20100GB)                                                                                                                                                                   |
| DigitalOcean         | 1 GB        | $0.02/GB  | [1GB transfer allowance with static sites](https://www.digitalocean.com/pricing/app-platform#:~:text=1GiB%20data%20transfer%20allowance%20per%20app%20with%20static%20sites)                                                                                                                            |

{:class .text-left}

Of course, maybe there are other factors locking you into a cloud host and preventing you from migrating, or perhaps one has a specific feature you need. That's fine!

If, however, you're sticking with your current provider due to simple inertia, it might be time for a re-assessment.

## Conclusion

This isn't a hit-piece on Netlify. I actually really liked them! I wish I could have justified sticking with them, but the horror stories and looming bandwidth charges pushed me away.

**If anything, I want this article to be a simple PSA to other developers** — it might be time to review your hosting arrangements and see if there are better alternatives available.
