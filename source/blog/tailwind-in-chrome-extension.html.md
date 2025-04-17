---
title: Using Tailwind CSS in a Chrome Extension (the easy way)
description: Learn how to use Tailwind CSS in your Chrome Extension for easy styling. It takes less than 5 minutes to install Tailwind in your Chrome Extension by following these steps.
date: February 10 2025
---

<details class='italic bg-stone-100 py-1 px-3 rounded-sm border border-stone-200' open><summary>Table of Contents</summary><aside markdown="1">
* seed list
{:toc}
</aside></details>

Did you know, **there _is_ an easy way to use Tailwind CSS in your Chrome Extension.**

I use [Tailwind CSS](https://tailwindcss.com/) extensively, and it's a great choice for styling a Chrome Extension. I've used it to build plenty of extensions, like [Tailcolors](https://chromewebstore.google.com/detail/tailcolors-tailwind-css-c/agjdmlmepbilagimjkmffoinkoackego), but adding it to a Chrome Extension can seem impossible.

There's a trick though — **just use the TailwindCSS CDN package.**

Getting Tailwind CSS to play nicely with a Chrome Extension is tricky since, unless you use a framework like like [WXT](https://wxt.dev/) with a build step, your extension is typically just static assets. There's no underlying system or server for Tailwind to plug into. Using the CDN script locally sidesteps these issues!

By using the Tailwind CDN package, you avoid any build-related hassle (the package handles it all). Additionally, importing it as a _local_ script is crucial since the `v3` extension manifest forbids loading external `<script>` resources.

Let's dive into using Tailwind CSS in your Chrome extension via the CDN script.

## Using Tailwind in your Chrome extension

Using the Tailwind CSS CDN script in your Chrome Extension is pretty simple. You need to:

1. **Download the Tailwind CDN package.** Visit the [official website](https://tailwindcss.com/docs/installation/play-cdn#:~:text=Add%20the%20Play%20CDN%20script%20to%20your%20HTML) to find the download URL (look for the URL in the `src=` attribute of the `<script>` tag).
   - **Current URL: [https://unpkg.com/@tailwindcss/browser@4](https://unpkg.com/@tailwindcss/browser@4)**
   - Open that URL and copy the entire page to a local javascript file within your extension. I normally save this as `my-extension/tailwind_v405.js` (replacing `405` with the current version, which is visible in the `unpkg.com` URL).
2. **Include the `tailwind.js` script into the `popup.html` file of your extension.**
   - Simply add `<script src="./tailwindcss_cdn_405.js"></script>` within the `<head>` section of your `popup.html` file.
   - The full `<head>` of your extension might look something like:

```html
<!-- my-extension/popup.html -->
<html>
  <head>
    <title>Tailwind in a Chrome Extension!</title>
    <script src="./tailwindcss_cdn_405.js"></script>
  </head>
  ...
</html>
```

That's it! Tailwind CSS will run from the included CDN script, letting you easily use Tailwind in your Chrome Extension without having to mess around with a build step or running Tailwind locally.

As I mentioned before, running Tailwind from the CDN package doesn't include the drawbacks it usually does for a typical website. Since Chrome Extensions are pre-packaged and downloaded when a user installs them, there's no performance downside to using the CDN package.

## Things to know when running Tailwind via a CDN in your extension

- Tailwind will raise a `console.warn` about running via the CDN package. This is safe to ignore, but it will always appear under `Errors` when you visit `chrome://extensions`.
- To update Tailwind to a new version, you must download a new CDN package and replace the current one.
  - For example, to upgrade from `v4.0.1` to `v4.0.5`, you'd need to visit the [tailwindcss unpkg url](https://unpkg.com/@tailwindcss/browser@4) and save the new code. I prefer to save it to a new file to track which version I'm running (which means I also update the `<script>` tag in `popup.html`).

## Conclusion

I hope you found this article useful!

I love Tailwind CSS, so being able to style Chrome Extensions with it is awesome, and this method makes it trivial to get up & running.
