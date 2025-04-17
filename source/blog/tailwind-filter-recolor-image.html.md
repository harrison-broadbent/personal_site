---
title: Recolor images with TailwindCSS filters
description: Lear how to use Tailwind's mix-blend-mode filters to re-color an image dynamically. By combining mix-blend-hard-light with grayscale, we can accomplish some pretty cool effects.
date: February 3 2025
---

Recently I found myself trying to use TailwindCSS to recolor an image. Specifically, I wanted to re-color the [ProductHunt](https://producthunt.com) logo, like below:

| ![toast notifications with native js and css](images/blog/tailwind-filter-recolor-image/ph.png) | ![toast notifications with native js and css](images/blog/tailwind-filter-recolor-image/ph-cyan.png) |
| ![toast notifications with native js and css](images/blog/tailwind-filter-recolor-image/ph-lime.png) | ![toast notifications with native js and css](images/blog/tailwind-filter-recolor-image/ph-stone.png) |

_^^^ All re-colored directly with TailwindCSS._

Not only is this possible, but it's actually quite straightforward thanks to Tailwind's [mix-blend-mode](https://tailwindcss.com/docs/mix-blend-mode) effect combined with the [grayscale filter](https://tailwindcss.com/docs/filter-grayscale). Combining these two makes it possible to re-color logos like this on the fly.

I think `mix-blend-mode` is a pretty underrated TailwindCSS class — it's the perfect tool for this dynamic re-coloring, plus it's handy for overlaying gradients, crafting logo clouds and more.

Unfortunately, `mix-blend-mode` does suffer from being tricky to comprehend — the [official mix-blend-mode docs](https://tailwindcss.com/docs/mix-blend-mode) are limited and don't show off any creative uses. There are few enough online resources available that your best bet to figure out this class is probably to head over to [Tailwind Play](https://play.tailwindcss.com/LRObXjD9JI) and fiddle around for a bit.

Onto the actual code though for this recoloring. Here are the TailwindCSS classes I used, with an explanation below:

```html
<div class="w-fit bg-lime-500 rounded-xl border-[0.5px] border-lime-500">
  <a class="grayscale mix-blend-hard-light" href="...">
    <img src="..." />
  </a>
</div>
```

Quick explanation:

- The crux of the re-coloring is applying `bg-lime-500` to the parent `<div>`, and then combining `mix-blend-hard-light` with `grayscale` on the `a` tag wrapping the image.
  - The `mix-blend-hard-light` class caused the colored areas of the image to let the background color through, and `grayscale` stops any of the original image color from passing through (without it, the resulting image color is a blend of the background color and the orange from the logo)
- I also added a border and rounding to the parent `div`, since the image within has rounded corners.

This re-coloring was straightforward since the PH logo is a single color + white, which is easy to work with. For more complex images you'll probably need to layer a couple of mix-blends on top of each other... and at that point, you're probably better off busting open Photoshop or [Photopea](https://photopea.com).

Thanks for reading!
