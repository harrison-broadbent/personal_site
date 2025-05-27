---
title: A tooltip with plain HTML & Tailwind CSS
description:
date: May 25th, 2025
---

<details open>
<summary>In this article:</summary>
<aside markdown="1">
1. seed list
{:toc}
</aside>
</details>
<hr />

It's possible (easy, even) to **build tooltips using nothing but HTML and Tailwind CSS.** No Javascript required.

Here's an example tooltip:

![hacker news story in 1st place](images/blog/native-tailwind-tooltip/tooltip.gif) _The tooltip in action. It's built with vanilla HTML & Tailwind CSS (no Javascript)._

In classic fashion, the tooltip is a little piece of text that appears when you hover over another element. Specifically, in this case, when you hover over a prior sibling element (note the `peer` class).

Here's a live example you can try (explanation below). Hover over the text to reveal the tooltip:

<div class="relative my-8 w-fit not-prose mx-auto">
  <p class="peer decoration-dotted underline underline-offset-2 cursor-help font-medium">>>> Hover over me <<<</p>
  <span class="bottom-full left-1/2 absolute bg-stone-800 opacity-0 peer-hover:opacity-100 px-2 py-1 rounded-md w-max text-stone-50 text-xs transition-all -translate-x-1/2 -translate-y-0.5 peer-hover:-translate-y-1">
    I'm a tooltip, built with plain HTML & Tailwind CSS
  </span>
</div>

On mobile, tapping the text will show the tooltip. Tapping away will dismiss it.

## Tooltip code

Here's the code. It's just vanilla HTML & Tailwind CSS:

```html
<div class="relative w-fit">
  <p class="peer ...">target element</p>

  <span
    class="bottom-full left-1/2 -translate-x-1/2 absolute
    text-stone-50 text-xs bg-stone-800 opacity-0 px-2 py-1 rounded-md w-max
    -translate-y-0.5 peer-hover:-translate-y-1 peer-hover:opacity-100 transition-all"
  >
    tooltip content
  </span>
</div>
```

There are three key things happening here: the `relative` class on the wrapping div, the `peer` class on the target element, and the `absolute` positioning of the tooltip.

- **`relative` on the wrapping div:**
  - Positions the tooltip _in relation_ to the target element. The tooltip is positioned `absolute`-ly _within the scope of the `relative` wrapper_.
  - The [new anchor positioning API](#tooltips-using-chromes-anchor-positioning-api) will — eventually — let us skip this and directly associate the target & tooltip elements. Unfortunately, it's not widely-available yet.
- **`peer` on the target element:**
  - `peer` on the target lets us trigger the `peer-hover` classes on the tooltip. It handles showing/hiding of the tooltip, plus the little pop-in animation.
- **`absolute` positioning of the tooltip:**
  - Combined with the `relative` class on the wrapping div, it makes these classes place the tooltip top-middle of the target: `bottom-full left-1/2 -translate-x-1/2`

## Positioning the tooltip

Adjust the position of the tooltip with the [Tailwind CSS layout properties](https://tailwindcss.com/docs/top-right-bottom-left).

The classes below will position the tooltip top-middle of an element (like above), or bottom-middle.

```js
top: "bottom-full -translate-y-0.5 peer-hover:-translate-y-1.5";
bottom: "top-full -translate-y-1.5 peer-hover:-translate-y-0.5";
```

## Refactoring into a component

It would be wise to turn this tooltip into a component.

Mainly to hide away all the weird absolute positioning styles. Plus, it gives you an easy way to specify the position of the tooltip.

Here's an example, using [ViewComponents](https://viewcomponent.org/) in Ruby on Rails:

```ruby
# ui/tooltip.rb

# Need to nest within a 'relative' div and make the target element a prior 'peer'
class UI::Tooltip < ViewComponent::Base
  def initialize(text:, position: :top)
    @text = text
    @position = position
  end

  def call
    tag.span(**merged_options) do
      @text
    end
  end

  private

  def merged_options
    default_classes = "pointer-events-none absolute left-1/2 mt-2 w-max -translate-x-1/2 rounded-md bg-stone-800 px-2 py-1 text-xs text-stone-50 opacity-0 transition-all peer-hover:opacity-100"
    position_classes = { top: "bottom-full -translate-y-0.5 peer-hover:-translate-y-1.5",
                        bottom: "top-full -translate-y-1.5 peer-hover:-translate-y-0.5" }}

    { class: [default_classes, position_classes[@position]] }.merge(@options)
  end
end
```

## Tooltips using Chrome's anchor positioning API

> Chrome Developers Reference: [The CSS anchor positioning API](https://developer.chrome.com/docs/css-ui/anchor-positioning-api#implicit_anchors)
>
> MDN Reference: [anchor()](https://developer.mozilla.org/en-US/docs/Web/CSS/anchor)

The [CSS anchor positioning API](https://developer.chrome.com/docs/css-ui/anchor-positioning-api#implicit_anchors) is a fresh browser API that makes it easier to position our tooltips.

Specifically, we can directly anchor our target & tooltip elements together with an `anchor`, and position them relatively with `position-area`. This means that soon, you won't need to wrap your elements with `div class='relative'>`.

Here's an example:

<div class="my-8 flex justify-center not-prose">
  <p style="anchor-name: --anc;" class="peer w-fit cursor-help font-medium underline decoration-dotted underline-offset-2">>>> Hover over me (Chrome / Edge) <<<</p>
  <span style="position-anchor: --anc; position-area: top;" class="fixed rounded-md bg-stone-800 px-2 py-1 text-xs text-stone-50 opacity-0 transition-all peer-hover:-translate-y-1 peer-hover:opacity-100"> I'm a tooltip (anchor: '--anc')</span>
</div>

> Currently, only Chrome & Edge support anchor positioning. If you're on Safari, Firefox etc. this won't work. I've tested on Safari and it seems like you just won't see... anything.

## Anchor-positioned tooltip code

Here's the code to link your target & tooltip elements via `anchors`:

```html
<p
  style="anchor-name: --anc;"
  class="peer w-fit cursor-help font-medium underline decoration-dotted underline-offset-2"
>
  target element (anchor: '--anc')
</p>

<span
  style="position-anchor: --anc; position-area: top;"
  class="fixed rounded-md bg-stone-800 px-2 py-1 text-xs text-stone-50 opacity-0 transition-all peer-hover:-translate-y-1 peer-hover:opacity-100"
>
  tooltip content (anchored to '--anc')
</span>
```

Notice how we set `anchor-name` on the target element, then link our tooltip to it with `anchor-position`.

Use this handy [position area anchor tool](https://chrome.dev/anchor-tool/) to find the correct value for position-area, depending on where you want to place your tooltip.

Some common values:

```js
top: "position-area: top";
bottom: "position-area: bottom";
left: "position-area: left";
right: "position-area: right";
```

## Conclusion

Tooltips without Javascript have been a holy grail for me for a while, so I'm glad I've finally cracked them.

I've been sprinkling them through the [AttendList](https://attendlist.com) UI and I think they work nicely.

These tooltips are a powerful example of what you can accomplish with [native HTML elements](blog/cool-native-html-elements), and the new [CSS anchor positioning API](https://developer.chrome.com/docs/css-ui/anchor-positioning-api#implicit_anchors) will — eventually — make them even more versatile.
