---
title: Cool native HTML elements you should already be using
description: In this article, I show you how to use native HTML to implement features like modals & accordions, image captions, grouped lists and more.
date: March 6th, 2025
---

<details class='italic bg-stone-100 py-1 px-3 rounded-sm border border-stone-200'><summary>Table of Contents</summary><aside markdown="1">
* seed list
{:toc}
</aside></details>

**I'm constantly surprised by the native HTML spec.** New features are regularly added, and I often stumble on existing, handy elements. While often not as versatile as their JS counterparts, using them avoids bloating your app with extra Javascript libraries or CSS hacks.

If this article helps just a _single developer_ avoid an unnecessary Javascript dependency, I'll be happy. Native HTML can handle plenty of features that people typically jump straight to JS for (or otherwise over-complicate).

I cover some great HTML elements in this article — modals, accordions, live range previews, progress bars and more. You might already know some of these, but I bet there's something new here for you too.

> Note: A handful of examples use a teeny-tiny sprinkle of Javascript within `oninput` properties. Please forgive me for this 😅. The elements are self-contained enough that I consider them ~HTML.

## Native HTML Modals (`dialog`)

I've led with native HTML modals since I think they're a pattern commonly used in most apps. People tend to reach directly to Javascript for modals, unaware of the powerful native option. Represented by `<dialog>`, they have extensive support for styling, controls etc, and in my opinion, are one of the most slept-on native HTML elements.

Native HTML modals are opened by calling `.showModal()` on the `<dialog>` element and closed by calling `.closeModal()`, by clicking an embedded `<form>` with a `dialog` method, or pressing the <kbd>esc</kbd> key.

Click the button below for an example:

<hr />
<button class="border border-stone-700 rounded-sm px-1.5 hover:bg-stone-100" onclick="document.getElementById('modal').showModal()">Open Modal</button>

<dialog id="modal" class="max-w-2xl rounded-sm border border-stone-900 bg-stone-50 backdrop:bg-stone-950/10 backdrop:backdrop-blur-sm">
  <div class="p-4 flex justify-between bg-stone-100">
    <div class="flex flex-col pr-4 not-prose">
      <p>I'm a native HTML modal, built using the <code>dialog</code> element. </p>
      <p>Click the "X" to close me.</p>
    </div>
    <div class="flex h-fit">
      <form class="text-right mr-1 bg-stone-800 text-stone-50 w-fit" method="dialog">
        <button class="focus:outline-none size-6">x</button>
      </form>
    </div>
  </div>
</dialog>

```html
<button onclick="document.getElementById('modal').showModal()">
  Open Modal
</button>

<dialog id="modal" class="max-w-2xl backdrop:backdrop-blur-sm">
  <p>Click the "X" to close me.</p>
  <form method="dialog">
    <button>x</button>
  </form>
</dialog>
```

<hr />

The entire modal is native HTML, except for a tiny bit of inline JS on the button which calls `.showModal()` on click. Pressing the `[x]` to close the modal uses a native HTML form (or you can use the <kbd>esc</kbd> key). Below is the code:

A few things to note:

- The button has an inline `onclick` function which calls `.showModal()`, opening the `<dialog>`.
- We style the modal's background with the `backdrop:` Tailwind CSS selector. For regular CSS, you can use the `.modal::backdrop` pseudoclass.
- The embedded `<form method='dialog'>` closes the dialog with pure HTML.

[MDN Docs (dialog)](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dialog) &nbsp; // &nbsp; [Caniuse (96%)](https://caniuse.com/?search=dialog)

## Native HTML Accordions / Disclosures (`details` and `summary`)

Accordions are another classic component that you can easily build with plain HTML. By combining the `<details>` and `<summary>` tags you can do some pretty cool things.

Here's a basic example:

<hr />
<details>
  <summary class="font-bold">Native HTML Accordion (click to expand)</summary>
 You can build accordions/disclosures with plain HTML, just like this one!
</details>

```html
<details>
  <summary>Native HTML Accordion (click to expand)</summary>
  You can build accordions/disclosures with plain HTML, just like this one!
</details>
```

<hr />

You can also supply the `open` property to default the `<details>` element open (it can still be collapsed):

<hr />
<details open>
  <summary class="font-bold">Native HTML Accordion (default open)</summary>
 You can make a <code>details</code> accordion open by default with the <code>open</code> property.
</details>

```html
<details open>...</details>
```

<hr />

You can also create _exclusive accordions_ by supplying a matching `name` parameter to multiple `<details>` elements. This means only one group from the accordion can be open at a time:

<hr />
<details name="group">
  <summary>Frogs</summary>
 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
</details>

<details name="group">
  <summary>Dogs</summary>
 🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶
</details>

<details name="group">
  <summary>Cogs</summary>
 ⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️⚙️
</details>

```html
<details name="group">
  <summary>Frogs</summary>
  🐸
</details>

<details name="group">
  <summary>Dogs</summary>
  🐶
</details>

<details name="group">
  <summary>Cogs</summary>
  ⚙️
</details>
```

<hr />

[MDN Docs (details)](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details) &nbsp; // &nbsp; [Caniuse (97%)](https://caniuse.com/?search=details)

## Native HTML Range Inputs

HTML range inputs are nothing new. By default they look like this, <input type="range" />, and allow users to input a value on a sliding scale.

You can extend the functionality of the basic range input by adding tickmarks and a live value output.

### Range inputs with ticks (`datalist`)

By supplying a `<datalist>` to a range input, you can render tickmarks at each value step and clamp the input value to one of the datalist options.

<hr />
<div class="flex gap-x-2 not-prose">
<input type="range" min="1" max="3" list="steplist" oninput="this.nextElementSibling.value = this.value">
<output>2</output>
</div>

<datalist id="steplist">
    <option>1</option>
    <option>2</option>
    <option>3</option>
</datalist>

```html
<input type="range" min="1" max="5" list="steps" />

<datalist id="steps">
  <option>1</option>
  <option>2</option>
  <option>3</option>
</datalist>
```

<hr />

## Range inputs with live value display

By adding a tiny bit of Javascript to the range input, you can easily add a live display of the input value. Credit goes to [this excellent StackOverflow answer](https://stackoverflow.com/a/18936328/7761325) for figuring this out!

<hr />

<div class="flex gap-x-2 not-prose">
<input type="range" value="50" min="1" max="100" oninput="this.nextElementSibling.value = this.value">
<output>50</output>
</div>

```html
<input
  type="range"
  value="50"
  min="1"
  max="100"
  oninput="this.nextElementSibling.value = this.value"
/>
<output>50</output>
```

<hr />

[MDN Docs (range)](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/range) &nbsp; // &nbsp; [Caniuse (98%)](https://caniuse.com/?search=range)

## Native HTML Progress Bars (`progress`)

These days, browsers support a basic, fully native HTML progress bar:

<hr />
<progress value=6 max=10></progress>

```html
<progress value="6" max="10"></progress>
```

<hr />

With some styling, you can make a progress bar look like the one below. I've used TailwindCSS for the styling, but you can apply them directly with CSS for the same result:

<hr />
<progress class='[&::-webkit-progress-bar]:rounded-lg [&::-webkit-progress-value]:rounded-lg [&::-webkit-progress-bar]:bg-stone-300 [&::-webkit-progress-value]:bg-stone-700 [&::-moz-progress-bar]:bg-stone-700' value=6 max=10></progress>

```html
<progress
  class="[&::-webkit-progress-bar]:rounded-lg [&::-webkit-progress-value]:rounded-lg   [&::-webkit-progress-bar]:bg-stone-300 [&::-webkit-progress-value]:bg-stone-400 [&::-moz-progress-bar]:bg-stone-400"
  value="6"
  max="10"
></progress>
```

<hr />

You can learn more about styling the `<progress>` element with Tailwind CSS from [this GitHub thread](https://github.com/tailwindlabs/tailwindcss/discussions/3921).

[MDN Docs (progress)](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/progress) &nbsp; // &nbsp; [Caniuse (97%)](https://caniuse.com/?search=progress)

<!-- ## Native HTML tooltips (`title`)

Here's an example — <span class="font-medium text-stone-950 underline decoration-dotted cursor-help" title="A native tooltip!">[ hover over me ]</span>

Like so:

```html
<span title="A native tooltip!">[ hover over me ]</span>
```

There are some major downsides to using these native HTML tooltips though:

- No styling control:
- No control over hover delay:
- No control over tooltip position:
- Poor mobile support:

The `title` property certainly suffers from a lack of customization options. Even just having a shorter delay before the message appears would be a huge boost to the usefulness of this parameter, but unfortunately, most browsers have a long default delay before the message displays. -->

## Searchable dropdowns and grouped lists (`datalist` and `optgroup`)

You can enhance the basic HTML list input to make it searchable or grouped with the `<datalist>` and `<optgroup>` elements.

### Searchable dropdowns with `datalist`

<hr />
<div class="not-prose">
<label for="browser">Type something to search the list:</label>
<input list="browser-names" name="browser" id="browser" class="border">
<datalist id="browser-names">
  <option value="Edge"/>
  <option value="Firefox"/>
  <option value="Chrome"/>
  <option value="Opera"/>
  <option value="Safari"/>
</datalist>
</div>

```html
<label for="browser">Type something to search the list:</label>

<input list="browser-names" name="browser" id="browser" />
<datalist id="browser-names">
  <option value="Edge" />
  <option value="Firefox" />
  <option value="Chrome" />
  <option value="Opera" />
  <option value="Safari" />
</datalist>
```

<hr />

[MDN Docs (datalist)](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/datalist) &nbsp; // &nbsp; [Caniuse (97%)](https://caniuse.com/?search=datalist)

### Grouped lists with `optgroup`

<hr />
<div class="not-prose">
<label for="food">Choose a food:</label>
<select class="border rounded-md"  name="food" id="food">
  <optgroup label="Fruits">
    <option value="apple">🍏 Apple</option>
  </optgroup>
  <optgroup label="Vegetables">
    <option value="eggplant">🍆 Eggplant</option>
  </optgroup>
  <optgroup label="Desserts">
    <option value="doughnut">🍩 Doughnut</option>
  </optgroup>
</select>
</div>

```html
<label for="food">Choose a food:</label>

<select class="border rounded-md" name="food" id="food">
  <optgroup label="Fruits">
    <option value="apple">🍏 Apple</option>
  </optgroup>
  <optgroup label="Vegetables">
    <option value="eggplant">🍆 Eggplant</option>
  </optgroup>
  <optgroup label="Desserts">
    <option value="doughnut">🍩 Doughnut</option>
  </optgroup>
</select>
```

<hr />

[MDN Docs (optgroup)](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/optgroup) &nbsp; // &nbsp; [Caniuse (96%)](https://caniuse.com/?search=optgroup)

## Key combinations (`kbd`)

The `<kbd>` element is an HTML-native representation of keycombos. It typically appears similar to a `<code>` element, but it's more semantic and, being a distinct element, you can style it globally.

<hr />
<kbd class="not-prose">⌘ + P</kbd>

```html
<kbd>⌘ + P</kbd>
```

<hr />

Globally targeting the `<kbd>` tag can simplify your styling — you don't have to add an extra class or component. Just style `<kbd>` directly. It's also more semantically correct to use `<kbd>` for keyboard combinations, versus littering your pages with `<span>` elements.

I've styled the `<kbd>` tag to look like this: <kbd>⌘ + P</kbd>

[MDN Docs (kbd)](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/kbd) &nbsp; // &nbsp; [Caniuse (96%)](https://caniuse.com/?search=kbd)

## Images with captions (`figcaption`)

Browsers natively support captioned images with `<figure>` and `<figcaption>`. You might find it easier to use these elements instead of implementing the same thing yourself.

Here's an example:

<hr />

<figure>
  <img src="/images/electronics/freeform-2sat/2sat-white.jpg" alt="2Sat Electronics Sculpture" class="not-prose max-h-48">
  <figcaption>Fig.1 - Electronics Sculpture</figcaption>
</figure>

```html
<figure>
  <img src="image.jpg" alt="..." />
  <figcaption>My picture</figcaption>
</figure>
```

<hr />

[MDN Docs (figcaption)](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/figcaption) &nbsp; // &nbsp; [Caniuse (96%)](https://caniuse.com/?search=figcaption)

## Conclusion

I hope you found this article useful!

I'm constantly surprised by what I can build with plain, native HTML, and it's always satisfying ripping out a JS package I've replaced with a simple HTML tag.
