---
title: Handy localStorage helpers for Chrome extensions
description: Learn how to add custom fonts to Tailwind CSS v4 (and v3). In Tailwind 4, you use the @theme directive and "--font" variables to load custom fonts after initializing Tailwind.
date: Feb 23rd, 2026
---

When you're building a Chrome extension, **it's common to want to store state in your user's browser**. For example, you might store settings for your extension.

This is natively supported via [the `chrome.storage` API](https://developer.chrome.com/docs/extensions/reference/api/storage#example-local), a first-party extension API to store and retrieve data. You just request the `storage` permission, and then you can use commands like `chrome.storage.local.get/.set` to manipulate data.

**Sounds simple, right?**

It _mostly_ is, but after building a handful of Chrome extensions myself ([Tailcolors](https://chromewebstore.google.com/detail/tailcolors-tailwind-css-c/agjdmlmepbilagimjkmffoinkoackego), [AttendList](https://chromewebstore.google.com/detail/attendlist-google-meet-at/nbkmccfekgmjnpjghcopcfhpmlincbgb)), I've **found a few pitfalls** with the default approach.

The main pitfall stems from **littering** your code with calls to `chrome.storage.local.get("key")` and `.set({"key": "value"})`:

- Writing code like this leads to various `"key"` strings scattered throughout your codebase.
- In my opinion, the code also **reads less clearly** than I'd like (although, maybe I'm just too used to writing Ruby).

**Can we do better?**

The answer, obviously, is **yes!**

## Custom localStorage helpers for Chrome extensions

One day, I decided to try and solve this, and ended up with my `useLocalStorage` helper script (below), **which I now use in all my Chrome extensions.**

This helper is modelled after the [React useState Hook](https://react.dev/reference/react/useState#usestate), and lets you write code like this:

```js
// popup.js, background.js etc.

const [getKey, setKey] = useLocalStorage("key");

let value = await getKey();
await setKey("value");
```

Compare the code above to the standard way of interacting with `localStorage`:

```js
let value = await chrome.storage.local.get("key");
await chrome.storage.local.set({ key: "value" });
```

I find my helpers **much neater!**

This `localStorage` helper script has a few handy benefits which I love:

1. You define your getter & setter functions once, and then you can re-use them. Hence, each `"key"` string only appears once. For instance, I commonly define most of my `useLocalStorage` helpers in a common file (ie: `utils/storage_helpers.js`) and then import them throughout my extension code. This makes it easy to rename `"key"`, avoid bugs from typos, and more.
2. Getters and setters become named functions, rather than just repeated calls to `chrome.storage.local.get/.set` with different storage keys. Your code naturally becomes clearer and more descriptive.
3. Because these getter/setter methods are real JS functions, they can be imported and auto-completed by your code editor, which is handy.

If you write your Chrome Extensions with vanilla Javascript like I do, the `localstorage.js` helper below is plug-and-play. Just drop it into your project, import it, and start using it.

Note that If you're using these helpers in your `popup.js` script, you'll need to import `popup.js` as a module like so:

```html
<!-- popup.html -->
<body>
  ...
  <script type="module" src="./popup.js"></script>
</body>
```

With `popup.js` configured as a `module`, you can import the helper script like so:

```js
// popup.js
import { useLocalStorage } from "./utils/localstorage.js";

const [getVar, setVar] = useLocalStorage("var");
...
```

> If instead you're using a framework like [WXT](https://wxt.dev) with it's own [localStorage API](https://wxt.dev/storage), you can still use my helper script. You'll just need to adapt the specific calls to match the WXT API.
>
> For example, `chrome.storage.local.get([key]) -> storage.getItem('local:key')`

## localstorage.js

```js
// localstorage.js

// Usage:
// const [getVar, setVar] = useLocalStorage("var");
//
export function useLocalStorage(key) {
  const getValue = async () => {
    return new Promise((resolve) => {
      chrome.storage.local.get([key], (result) => {
        resolve(result[key]);
      });
    });
  };

  const setValue = async (value) => {
    return new Promise((resolve, reject) => {
      chrome.storage.local.set({ [key]: value }, () => {
        if (chrome.runtime.lastError) {
          console.log("failed to save to local storage", value);
          reject(chrome.runtime.lastError);
        } else {
          resolve();
        }
      });
    });
  };

  return [getValue, setValue];
}
```
