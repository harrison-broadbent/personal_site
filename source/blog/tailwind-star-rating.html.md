---
title: An interactive Tailwind CSS star rating component
description: Learn how to create a star rating input using plain HTML and Tailwind CSS. This Tailwind star rating input is flexible and very portable.
date: April 17th, 2025
---

<details open>
<summary>In this article:</summary>
<aside markdown="1">
1. seed list
{:toc}
</aside>
</details>
<hr />

One of my greatest joys is hacking around with Tailwind CSS, and using it to build things that feel like they _should_ need Javascript, with just plain HTML and CSS.

This Tailwind star rating input is a perfect example. With just plain HTML and Tailwind classes, you can build an animated star rating component just like below.

## Interactive Tailwind star rating component

Here's the star rating input:

<div class="mt-8 text-5xl flex flex-row-reverse justify-center gap-1 text-amber-950 [&>*]:after:content-[''] [&>*]:no-underline">
  <a id="rate-5" href="#5" class="transition-all peer hover:text-yellow-500 peer-hover:text-yellow-500 cursor-pointer">★</a>
  <a id="rate-4" href="#4" class="transition-all peer hover:text-yellow-500 peer-hover:text-yellow-500 cursor-pointer">★</a>
  <a id="rate-3" href="#3" class="transition-all peer hover:text-yellow-500 peer-hover:text-yellow-500 cursor-pointer">★</a>
  <a id="rate-2" href="#2" class="transition-all peer hover:text-yellow-500 peer-hover:text-yellow-500 cursor-pointer">★</a>
  <a id="rate-1" href="#1" class="transition-all peer hover:text-yellow-500 peer-hover:text-yellow-500 cursor-pointer">★</a>
</div>

And here's the code:

```erb
<div class="text-5xl flex flex-row-reverse justify-center gap-1 text-amber-950">
 <a id="rate-5" href="#5" class="transition-all peer hover:text-yellow-500 peer-hover:text-yellow-500 cursor-pointer">★</a>
 <a id="rate-4" href="#4" class="transition-all peer hover:text-yellow-500 peer-hover:text-yellow-500 cursor-pointer">★</a>
 <a id="rate-3" href="#3" class="transition-all peer hover:text-yellow-500 peer-hover:text-yellow-500 cursor-pointer">★</a>
 <a id="rate-2" href="#2" class="transition-all peer hover:text-yellow-500 peer-hover:text-yellow-500 cursor-pointer">★</a>
 <a id="rate-1" href="#1" class="transition-all peer hover:text-yellow-500 peer-hover:text-yellow-500 cursor-pointer">★</a>
</div>
```

## Explanation

For a quick breakdown of the component:

- This star rating input is designed to redirect someone after they click a star, hence the `href` attribute on each `a` tag. For instance, if someone clicks stars 4 or 5, you could redirect them to a public review website to leave a nice review, but if they click stars 1, 2 or 3, you could redirect them to a feedback form.
- You might notice that the star order is descending (5 → 4 →3 etc.) but we then invert it with `flex-flow-reverse`. This accounts for how `peer-hover` interacts with its siblings. Without inverting, the stars fade in from the right, which is odd. We invert everything so that hovering over a star colors all the stars to its left instead.
- This star rating input is relatively extensible. Of course, you could use Javascript to add event listeners to each star and react on click, instead of opening a link. You can also drop in a different star icon. I grabbed an [ASCII star icon](https://www.alt-codes.net/star_alt_code.php), ★, but you could drop in an icon, say from [Heroicons](https://heroicons.com).

## Conclusion

Thanks for reading!

I hope you found this Tailwind star rating input handy. I've written previously about [building with native HTML and Tailwind](/blog/cool-native-html-elements), you might find it interesting.
