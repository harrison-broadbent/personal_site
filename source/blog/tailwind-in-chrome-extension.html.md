---
title: Using Tailwind CSS in a Chrome Extension (the easy way)
description: In this article, I show you how to use Tailwind CSS in your Chrome Extension for easy styling. It takes less than 5 minutes to install Tailwind in your Chrome Extension by following these steps.
date: February 10 2025
---

<details class='italic bg-stone-100 py-1 px-3 rounded-sm border border-stone-200' open><summary>Table of Contents</summary><aside markdown="1">
* seed list
{:toc}
</aside></details>

Did you know **there's an easy way to use Tailwind in your Chrome Extension?** I love Tailwind CSS, but figuring out how to use it in a Chrome Extension can be tricky. **The trick is to use the TailwindCSS CDN package.**

Unless you use a framework like [WXT](https://wxt.dev/) or introduce a build step, getting Tailwind to play nicely with your Chrome extension and correctly parsing your styles can be difficult. So how _do_ you use Tailwind in your Chrome extension? The answer is simple — **rather than building Tailwind locally, _import the CDN version as a local script!_**

Using a local script is crucial since the `v3` extension manifest forbids loading external `<script>` resources. Additionally, the nature of Chrome extensions sidesteps the typical CDN script troubles too — since Chrome extensions are pre-packaged, your users don't have to download additional resources.

Let's explore using Tailwind CSS in your Chrome extension via the CDN script.

## Using Tailwind in your Chrome extension

Using the Tailwind CSS CDN script in your Chrome Extension is pretty simple. You need to:

1. **Download the Tailwind CDN package.** Visit the [official website](https://tailwindcss.com/docs/installation/play-cdn#:~:text=Add%20the%20Play%20CDN%20script%20to%20your%20HTML) to find the download URL (look for the URL in the `src=` attribute of the `<script>` tag).
   - **Currently, that URL is [https://unpkg.com/@tailwindcss/browser@4](https://unpkg.com/@tailwindcss/browser@4)**
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

## Things to be aware of when running Tailwind via a CDN in your extension

- Tailwind will raise a `console.warn` about running via the CDN package. This is safe to ignore, but it will always appear under `Errors` when you visit `chrome://extensions`.
- To update Tailwind, you must download a new CDN package and replace the current one.

  - For example, to upgrade from `v4.0.1` to `v4.0.5`, you'd need to visit the [unpkg url](https://unpkg.com/@tailwindcss/browser@4) and save the new code. I prefer to save it to a new file to track which version I'm running (which means I also update the `<script>` tag in `popup.html`).

## Conclusion

I hope you found this article useful!

I love Tailwind, so being able to also use it to style Chrome Extensions is awesome, and this method makes it trivial to get up & running.
