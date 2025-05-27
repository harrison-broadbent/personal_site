---
title: Custom fonts in Tailwind CSS v4 (and v3)
description: I got sick of digging around Google Fonts, so I compiled this list of my favorite SaaS fonts. It includes 7 all-time classics, plus two bonus fonts. There's a font for every SaaS in this article.
date: May 27th, 2025
---

<details open>
<summary>In this article:</summary>
<aside markdown="1">
1. seed list
{:toc}
</aside>
</details>
<hr />

Here's a quick explanation of how to add custom fonts in Tailwind CSS [v4](#custom-fonts-in-tailwind-css-v4), and also [v3](#custom-fonts-in-tailwind-css-v3).

It's pretty straightforward once you know what to do, but hopefully it will save you some headaches (and hunting around various [GitHub issues](https://github.com/tailwindlabs/tailwindcss/discussions/13890)).

(If you happen to be _browsing_ for fonts, I've collected some [great SaaS fonts](/blog/saas-fonts) too)

## Custom fonts in Tailwind CSS v4

Adding custom fonts in Tailwind CSS v4 is more complex than v3.

Since Tailwind CSS v4 leans into the [css-only approach to configuration](https://tailwindcss.com/blog/tailwindcss-v4#css-first-configuration), you configure your fonts directly within your main CSS file (the one where you import Tailwind).

Here's an example:

```css
/* tailwind/application.css */

@import url("https://fonts.googleapis.com/css2?family=JetBrains+Mono:ital,wght@0,100..800;1,100..800&display=swap");
@import "tailwindcss";
@theme {
  --font-mono: "Jetbrains Mono", monospace;
}
```

Here, we import [JetBrains Mono](https://fonts.google.com/specimen/JetBrains+Mono) from Google Fonts, then we import `tailwindcss`, _then_ we activate the font within a `@theme` block.

You _must_ import `tailwindcss` before setting up the fonts, otherwise it won't work.

The name you give your font is how you'll access it in your views. In this case, you'd use `font-mono`.

To change the default Tailwind CSS font directly, and keep the current fallbacks, you can do this ([via GitHub](https://github.com/tailwindlabs/tailwindcss/discussions/13890#discussioncomment-13162213)):

```css
/* tailwind/application.css */

@theme {
  --default-font-family: "Archivo", var(--font-sans);
}
```

## Custom fonts in Tailwind CSS v3

Configuring fonts in Tailwind CSS v3 was quite straightforward. Because it used a [javascript config file](https://v3.tailwindcss.com/docs/theme), things make a bit more sense (imo!).

First you import your font in your CSS file:

```css
/* tailwind/application.css */
@import url("https://fonts.googleapis.com/css2?family=JetBrains+Mono:ital,wght@0,100..800;1,100..800&display=swap");
```

And then you load it into your `tailwind.config.js` file:

```js
// tailwind.config.js

module.exports = {
  content: [...],
  theme: {
    extend: {
      fontFamily: {
        mono: ["JetBrains Mono", "mono"],
      },
    },
  },
};
```

You font gets a class name prefixed with `font-`, so in this case, we'd have `font-mono`.
