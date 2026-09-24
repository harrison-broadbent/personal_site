---
title: A/B Testing calculator
description: Calculate sample sizes, expected samples and non-inferior thresholds for A/B tests. Also supports 1-sided and 2-sided sample estimates.
---

<main class="mx-auto max-w-5xl px-6 py-10">
  <header class="pb-8">
    <h1 class="text-3xl font-semibold  text-stone-950">A/B testing sample calculator</h1>
    <p class="mt-3 max-w-3xl text-base  text-stone-500">
      A handy little calculator I threw together to — given your current experiment data — calculate your conversion rate, a Bayesian decision view and an estimate of how much more traffic you need to reach a confident decision.
    </p>
    <div class="mt-8 border-t border-stone-200"></div>
  </header>

  <section>
    <h2 class="text-xl font-semibold  text-stone-950">Experiment data</h2>
    <p class="mt-1.5 text-base  text-stone-500">Adjust your experiment counts and settings.</p>

    <div class="mt-8 grid gap-8 lg:grid-cols-[minmax(0,1fr)_minmax(0,1fr)]">
      <div class="min-w-0 pr-0 lg:border-r lg:border-stone-200 lg:pr-8">
        <div class="mt-12 grid min-w-0 grid-cols-[92px_minmax(0,1fr)_minmax(0,1fr)] items-center gap-x-3 gap-y-6 ">
          <div></div>
          <div class="text-center text-base text-stone-500">Visitors</div>
          <div class="text-center text-base text-stone-500">Conversions</div>

          <label for="controlN" class="text-lg font-medium text-stone-950">Control</label>
          <input id="controlN" type="number" min="1" step="1" value="131" class="min-w-0 h-12 border border-stone-300 bg-white px-3 text-center text-lg font-medium text-stone-950 outline-none focus:border-stone-500 focus:ring-2 focus:ring-stone-500/10" />
          <input id="controlX" type="number" min="0" step="1" value="52" class="min-w-0 h-12 border border-stone-300 bg-white px-3 text-center text-lg font-medium text-stone-950 outline-none focus:border-stone-500 focus:ring-2 focus:ring-stone-500/10" />

          <label for="variantN" class="text-lg font-medium text-stone-950">Variant</label>
          <input id="variantN" type="number" min="1" step="1" value="129" class="min-w-0 h-12 border border-stone-300 bg-white px-3 text-center text-lg font-medium text-stone-950 outline-none focus:border-stone-500 focus:ring-2 focus:ring-stone-500/10" />
          <input id="variantX" type="number" min="0" step="1" value="58" class="min-w-0 h-12 border border-stone-300 bg-white px-3 text-center text-lg font-medium text-stone-950 outline-none focus:border-stone-500 focus:ring-2 focus:ring-stone-500/10" />
        </div>
      </div>

      <div class="min-w-0 space-y-8">
        <div>
          <div class="flex items-center justify-between gap-4">
            <label for="marginRange" class="text-sm font-medium  text-stone-700">Non-inferiority margin (abs %)</label>
            <input id="marginInput" type="text" value="1" readonly class="h-10 w-24 border border-stone-300 bg-white px-2 text-center text-lg font-medium text-stone-950 outline-none" />
          </div>
          <div class="mt-2">
            <input id="marginRange" type="range" min="0" max="3" step="1" value="2" list="marginTicks" class="h-5 w-full appearance-none bg-transparent [&::-webkit-slider-runnable-track]:h-1 [&::-webkit-slider-runnable-track]:rounded-none [&::-webkit-slider-runnable-track]:bg-stone-200 [&::-webkit-slider-thumb]:-mt-1.5 [&::-webkit-slider-thumb]:size-4 [&::-webkit-slider-thumb]:appearance-none [&::-webkit-slider-thumb]:rounded-full [&::-webkit-slider-thumb]:border-0 [&::-webkit-slider-thumb]:bg-stone-600 [&::-webkit-slider-thumb]:shadow-none [&::-webkit-slider-thumb]:cursor-pointer [&::-moz-range-track]:h-1 [&::-moz-range-track]:rounded-none [&::-moz-range-track]:bg-stone-200 [&::-moz-range-thumb]:size-4 [&::-moz-range-thumb]:rounded-full [&::-moz-range-thumb]:border-0 [&::-moz-range-thumb]:bg-stone-600 [&::-moz-range-thumb]:shadow-none [&::-moz-range-thumb]:cursor-pointer" />
            <datalist id="marginTicks">
              <option value="0" label="0%"></option>
              <option value="1" label="0.5%"></option>
              <option value="2" label="1%"></option>
              <option value="3" label="2%"></option>
            </datalist>
            <div class="pointer-events-none relative -mt-2 mx-2 h-2" aria-hidden="true">
              <span class="absolute top-0 h-1.5 w-px -translate-x-1/2 bg-stone-300 left-0"></span>
              <span class="absolute top-0 h-1.5 w-px -translate-x-1/2 bg-stone-300 left-[33.333333%]"></span>
              <span class="absolute top-0 h-1.5 w-px -translate-x-1/2 bg-stone-300 left-[66.666667%]"></span>
              <span class="absolute top-0 h-1.5 w-px -translate-x-1/2 bg-stone-300 left-full"></span>
            </div>
            <div class="relative mx-2 h-7 text-xs text-stone-500" aria-hidden="true">
              <span class="absolute top-2 whitespace-nowrap  left-0">0%</span>
              <span class="absolute top-2 whitespace-nowrap -translate-x-1/2 left-[33.333333%]">0.5%</span>
              <span class="absolute top-2 whitespace-nowrap -translate-x-1/2 left-[66.666667%]">1%</span>
              <span class="absolute top-2 whitespace-nowrap -translate-x-full left-full">2%</span>
            </div>
          </div>
          <p class="mt-2 text-sm  text-stone-500">Maximum acceptable drop in conversion rate.</p>
        </div>

        <div>
          <div class="flex items-center justify-between gap-4">
            <label for="thresholdRange" class="text-sm font-medium  text-stone-700">Decision threshold</label>
            <input id="thresholdInput" type="text" value="95" readonly class="h-10 w-24 border border-stone-300 bg-white px-2 text-center text-lg font-medium text-stone-950 outline-none" />
          </div>
          <div class="mt-2">
            <input id="thresholdRange" type="range" min="0" max="3" step="1" value="2" list="thresholdTicks" class="h-5 w-full appearance-none bg-transparent [&::-webkit-slider-runnable-track]:h-1 [&::-webkit-slider-runnable-track]:rounded-none [&::-webkit-slider-runnable-track]:bg-stone-200 [&::-webkit-slider-thumb]:-mt-1.5 [&::-webkit-slider-thumb]:size-4 [&::-webkit-slider-thumb]:appearance-none [&::-webkit-slider-thumb]:rounded-full [&::-webkit-slider-thumb]:border-0 [&::-webkit-slider-thumb]:bg-stone-600 [&::-webkit-slider-thumb]:shadow-none [&::-webkit-slider-thumb]:cursor-pointer [&::-moz-range-track]:h-1 [&::-moz-range-track]:rounded-none [&::-moz-range-track]:bg-stone-200 [&::-moz-range-thumb]:size-4 [&::-moz-range-thumb]:rounded-full [&::-moz-range-thumb]:border-0 [&::-moz-range-thumb]:bg-stone-600 [&::-moz-range-thumb]:shadow-none [&::-moz-range-thumb]:cursor-pointer" />
            <datalist id="thresholdTicks">
              <option value="0" label="80%"></option>
              <option value="1" label="90%"></option>
              <option value="2" label="95%"></option>
              <option value="3" label="99%"></option>
            </datalist>
            <div class="pointer-events-none relative -mt-2 mx-2 h-2" aria-hidden="true">
              <span class="absolute top-0 h-1.5 w-px -translate-x-1/2 bg-stone-300 left-0"></span>
              <span class="absolute top-0 h-1.5 w-px -translate-x-1/2 bg-stone-300 left-[33.333333%]"></span>
              <span class="absolute top-0 h-1.5 w-px -translate-x-1/2 bg-stone-300 left-[66.666667%]"></span>
              <span class="absolute top-0 h-1.5 w-px -translate-x-1/2 bg-stone-300 left-full"></span>
            </div>
            <div class="relative mx-2 h-7 text-xs text-stone-500" aria-hidden="true">
              <span class="absolute top-2 whitespace-nowrap  left-0">80%</span>
              <span class="absolute top-2 whitespace-nowrap -translate-x-1/2 left-[33.333333%]">90%</span>
              <span class="absolute top-2 whitespace-nowrap -translate-x-1/2 left-[66.666667%]">95%</span>
              <span class="absolute top-2 whitespace-nowrap -translate-x-full left-full">99%</span>
            </div>
          </div>
          <p class="mt-2 text-sm  text-stone-500">Confidence required before calling the result.</p>
        </div>
      </div>
    </div>

  </section>

  <section class="mt-12">
    <h2 class="text-xl font-semibold  text-stone-950">Current results</h2>

    <div
      id="decisionBanner"
      data-state="neutral"
      class="group mt-6 border px-6 py-5
        data-[state=neutral]:border-stone-200 data-[state=neutral]:bg-stone-100/70 data-[state=neutral]:text-stone-900
        data-[state=warning]:border-amber-200 data-[state=warning]:bg-amber-50 data-[state=warning]:text-amber-900
        data-[state=success]:border-emerald-200 data-[state=success]:bg-emerald-50 data-[state=success]:text-emerald-900"
    >
      <div class="flex items-start gap-4">
        <div class="size-5 mt-1.5 rounded-full shrink-0
          group-data-[state=neutral]:bg-stone-500
          group-data-[state=warning]:bg-amber-500
          group-data-[state=success]:bg-emerald-500"></div>
        <div>
          <div id="decisionTitle" class="text-xl font-semibold">Keep collecting data</div>
          <p id="decisionText" class="mt-1.5 text-base">
            Neither rule has crossed your threshold yet.
          </p>
        </div>
      </div>
    </div>

    <div class="mt-8 grid gap-6 md:grid-cols-3">
      <div class="border-r border-stone-200 pr-6">
        <div class="text-sm text-stone-500">Control</div>
        <div id="controlRate" class="mt-1.5 text-4xl font-semibold  tabular-nums text-stone-950">—</div>
        <div id="controlCount" class="mt-1.5 text-sm text-stone-500">(— / —)</div>
      </div>
      <div class="border-r border-stone-200 pr-6">
        <div class="text-sm text-stone-500">Variant</div>
        <div id="variantRate" class="mt-1.5 text-4xl font-semibold  tabular-nums text-stone-950">—</div>
        <div id="variantCount" class="mt-1.5 text-sm  text-stone-500">(— / —)</div>
      </div>
      <div>
        <div class="text-sm text-stone-500">Difference</div>
        <div id="absLift" class="mt-1.5 text-4xl font-semibold  tabular-nums text-stone-950">—</div>
        <div class="mt-1.5 text-sm  text-stone-500">(<span id="relLift">—</span> relative)</div>
      </div>
    </div>

    <div class="mt-8 grid gap-6 md:grid-cols-2">
      <div class="pr-0 md:border-r md:border-stone-200 md:pr-6">
        <div class="text-sm  text-stone-500">Probability variant is better</div>
        <div id="probBetter" class="mt-1.5 text-4xl font-semibold  tabular-nums text-stone-950">—</div>
        <div class="mt-3"><progress id="probBetterBar" max="1" value="0" data-state="neutral" class="block h-4 w-full appearance-none border-0 bg-stone-200 [&::-webkit-progress-bar]:bg-stone-200 [&::-webkit-progress-value]:transition-colors [&::-webkit-progress-value]:duration-200 [&::-moz-progress-bar]:transition-colors [&::-moz-progress-bar]:duration-200 data-[state=neutral]:[&::-webkit-progress-value]:bg-stone-700 data-[state=warning]:[&::-webkit-progress-value]:bg-amber-500 data-[state=success]:[&::-webkit-progress-value]:bg-emerald-600 data-[state=neutral]:[&::-moz-progress-bar]:bg-stone-700 data-[state=warning]:[&::-moz-progress-bar]:bg-amber-500 data-[state=success]:[&::-moz-progress-bar]:bg-emerald-600"></progress></div>
        <div class="mt-2 text-sm  text-stone-500">P(variant &gt; control)</div>
      </div>
      <div>
        <div class="text-sm  text-stone-500">Probability variant is non-inferior</div>
        <div id="probNI" class="mt-1.5 text-4xl font-semibold  tabular-nums text-stone-950">—</div>
        <div class="mt-3"><progress id="probNIBar" max="1" value="0" data-state="neutral" class="block h-4 w-full appearance-none border-0 bg-stone-200 [&::-webkit-progress-bar]:bg-stone-200 [&::-webkit-progress-value]:transition-colors [&::-webkit-progress-value]:duration-200 [&::-moz-progress-bar]:transition-colors [&::-moz-progress-bar]:duration-200 data-[state=neutral]:[&::-webkit-progress-value]:bg-stone-700 data-[state=warning]:[&::-webkit-progress-value]:bg-amber-500 data-[state=success]:[&::-webkit-progress-value]:bg-emerald-600 data-[state=neutral]:[&::-moz-progress-bar]:bg-stone-700 data-[state=warning]:[&::-moz-progress-bar]:bg-amber-500 data-[state=success]:[&::-moz-progress-bar]:bg-emerald-600"></progress></div>
        <div id="niCaption" class="mt-2 text-sm  text-stone-500">—</div>
      </div>
    </div>

    <div class="mt-8 border-t border-stone-200 pt-8">
      <h3 class="text-lg font-semibold  text-stone-950">If today’s rates hold, how much more traffic do you need?</h3>
      <p class="mt-3 max-w-3xl text-sm  text-stone-500">
        Estimate the experiment size at which each probability threshold will be crossed,
        assuming the conversion rate stays the same.
      </p>

      <div class="mt-6 overflow-x-auto">
        <table class="w-full border-collapse">
          <thead>
            <tr class="border-b border-stone-200 text-left text-sm text-stone-500">
              <th class="px-0 py-2 font-medium">Probability threshold</th>
              <th class="px-4 py-2 font-medium">Variant is better</th>
              <th class="px-4 py-2 font-medium">Variant is non-inferior</th>
            </tr>
          </thead>
          <tbody class="text-sm text-stone-700">
            <tr data-selected="false" class="border-b border-stone-200 data-[selected=true]:bg-stone-100/70">
              <td class="px-0 py-2">90%</td>
              <td id="projectionBetter90" class="px-4 py-2">—</td>
              <td id="projectionNI90" class="px-4 py-2">—</td>
            </tr>
            <tr data-selected="true" class="border-b border-stone-200 data-[selected=true]:bg-stone-100/70">
              <td class="px-0 py-2 font-medium">95% (selected)</td>
              <td id="projectionBetter95" class="px-4 py-2">—</td>
              <td id="projectionNI95" class="px-4 py-2">—</td>
            </tr>
            <tr data-selected="false" class="border-b border-stone-200 data-[selected=true]:bg-stone-100/70">
              <td class="px-0 py-2">99%</td>
              <td id="projectionBetter99" class="px-4 py-2">—</td>
              <td id="projectionNI99" class="px-4 py-2">—</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

  </section>

  <section class="mt-8 space-y-2 not-prose">
    <details class="group border border-stone-200 bg-white">
      <summary class="!list-item cursor-pointer items-center justify-between text-sm font-medium text-stone-950 !mb-0 p-4">
        Plan a new fixed-sample experiment
      </summary>
      <div class="border-t border-stone-200 px-5 py-5">
        <p class="text-sm  text-stone-500">
          Traditional frequentist sample-size planning using the Evan Miller method.
          This is separate from the Bayesian decision probabilities above.
        </p>

        <div class="mt-6 grid gap-4 md:grid-cols-3">
          <div>
            <label for="baseline" class="block text-xs font-medium text-stone-500">Baseline conversion rate (%)</label>
            <input id="baseline" type="number" step="0.1" min="0.1" max="99.9" value="40" class="mt-1.5 h-10 w-full border border-stone-300 bg-white px-3 text-base font-medium text-stone-950 outline-none focus:border-stone-500 focus:ring-2 focus:ring-stone-500/10" />
          </div>
          <div>
            <label for="mde" class="block text-xs font-medium text-stone-500">Minimum detectable effect</label>
            <input id="mde" type="number" step="0.1" min="0.1" value="3" class="mt-1.5 h-10 w-full border border-stone-300 bg-white px-3 text-base font-medium text-stone-950 outline-none focus:border-stone-500 focus:ring-2 focus:ring-stone-500/10" />
          </div>
          <div>
            <label for="mdeType" class="block text-xs font-medium text-stone-500">Effect type</label>
            <select id="mdeType" class="mt-1.5 h-10 w-full border border-stone-300 bg-white px-3 text-base font-medium text-stone-950 outline-none focus:border-stone-500 focus:ring-2 focus:ring-stone-500/10">
              <option value="absolute" selected>Absolute %</option>
              <option value="relative">Relative %</option>
            </select>
          </div>
          <div>
            <label for="power" class="block text-xs font-medium text-stone-500">Statistical power</label>
            <select id="power" class="mt-1.5 h-10 w-full border border-stone-300 bg-white px-3 text-base font-medium text-stone-950 outline-none focus:border-stone-500 focus:ring-2 focus:ring-stone-500/10">
              <option value="0.80">80%</option>
              <option value="0.85">85%</option>
              <option value="0.90">90%</option>
              <option value="0.95" selected>95%</option>
            </select>
          </div>
          <div>
            <label for="alpha" class="block text-xs font-medium text-stone-500">Significance level</label>
            <select id="alpha" class="mt-1.5 h-10 w-full border border-stone-300 bg-white px-3 text-base font-medium text-stone-950 outline-none focus:border-stone-500 focus:ring-2 focus:ring-stone-500/10">
              <option value="0.10">10%</option>
              <option value="0.05">5%</option>
              <option value="0.025">2.5%</option>
              <option value="0.01" selected>1%</option>
            </select>
          </div>
          <div>
            <label for="sided" class="block text-xs font-medium text-stone-500">Test</label>
            <select id="sided" class="mt-1.5 h-10 w-full border border-stone-300 bg-white px-3 text-base font-medium text-stone-950 outline-none focus:border-stone-500 focus:ring-2 focus:ring-stone-500/10">
              <option value="2" selected>Two-sided</option>
              <option value="1">One-sided</option>
            </select>
          </div>
        </div>

        <div class="mt-12 text-center">
          <div id="sampleN" class="text-5xl font-semibold  tabular-nums text-stone-950">—</div>
          <div class="mt-2 text-sm  text-stone-500">subjects per variation</div>
          <div id="sampleNote" class="mt-4 text-xs  text-stone-500">—</div>
        </div>
      </div>
    </details>

    <details class="group border border-stone-200 bg-white">
      <summary class="!list-item cursor-pointer items-center justify-between text-sm font-medium text-stone-950 !mb-0 p-4">
        What do these numbers mean?
      </summary>
      <div class="border-t border-stone-200 px-5 py-5 space-y-4 text-sm  text-stone-600">
        <p><span class="font-medium text-stone-900">Probability variant is better</span> is the Bayesian posterior probability that the variant’s true conversion rate is higher than the control’s.</p>
        <p><span class="font-medium text-stone-900">Probability variant is non-inferior</span> asks how likely is it that the variant is not worse than control by more than your chosen absolute margin?</p>
        <p><span class="font-medium text-stone-900">Decision threshold</span> is the posterior probability you require before calling the result.</p>
        <p><span class="font-medium text-stone-900">Projection</span> is an expected-path forecast, not a guarantee. It assumes future traffic converts at the currently observed rates and continues to split evenly between control and variant.</p>
        <p><span class="font-medium text-stone-900">Fixed-sample planning</span> uses the <a class='text-stone-900' href="https://www.evanmiller.org/ab-testing/sample-size.html" target="_blank">Evan Miller method</a> to estimate the number of subjects required per variation for a pre-planned frequentist test.</p>
      </div>
    </details>

  </section>

</main>

<script type="module">
  import betaCDF from "https://cdn.jsdelivr.net/npm/@stdlib/stats-base-dists-beta-cdf@0.2.3/+esm";
  import betaQuantile from "https://cdn.jsdelivr.net/npm/@stdlib/stats-base-dists-beta-quantile@0.2.3/+esm";
  import normalQuantile from "https://cdn.jsdelivr.net/npm/@stdlib/stats-base-dists-normal-quantile@0.3.1/+esm";

  (() => {
    const $ = id => document.getElementById(id);
    const PRIOR_ALPHA = 1;
    const PRIOR_BETA = 1;
    const INTEGRATION_TOLERANCE = 1e-8;
    const MAX_INTEGRATION_DEPTH = 20;
    const MARGIN_VALUES = [0, 0.5, 1, 2];
    const THRESHOLD_VALUES = [80, 90, 95, 99];

    const percent = (x, digits = 1) => `${(100 * x).toFixed(digits)}%`;
    const signedPercent = (x, digits = 1) => {
      const value = 100 * x;
      return `${value >= 0 ? "+" : ""}${value.toFixed(digits)}%`;
    };
    const clampProbability = x => Math.min(1, Math.max(0, x));

    function updateProbabilityBar(elementId, probability, threshold) {
      const element = $(elementId);

      element.value = probability;
      element.dataset.state =
        probability >= threshold
          ? "success"
          : probability >= Math.max(0, threshold - 0.05)
            ? "warning"
            : "neutral";
    }

    function getMappedValue(rangeElement, values) {
      const index = Number(rangeElement.value);
      return values[Math.max(0, Math.min(values.length - 1, index))];
    }

    function formatFixedValue(value) {
      return Number.isInteger(value) ? String(value) : String(value).replace(/\.0$/, "");
    }

    function syncMappedRange(rangeElement, displayElement, values, suffix = "") {
      const render = () => {
        displayElement.value =
          `${formatFixedValue(getMappedValue(rangeElement, values))}${suffix}`;
      };

      rangeElement.addEventListener("input", render);
      rangeElement.addEventListener("change", render);
      render();
    }

    function posterior({ conversions, visitors }) {
      return { alpha: PRIOR_ALPHA + conversions, beta: PRIOR_BETA + visitors - conversions };
    }

    function simpsonEstimate(a, b, fa, fm, fb) { return ((b - a) / 6) * (fa + 4 * fm + fb); }

    function integrateAdaptive(fn, lower = 0, upper = 1, tolerance = INTEGRATION_TOLERANCE, maxDepth = MAX_INTEGRATION_DEPTH) {
      const midpoint = (lower + upper) / 2;
      const fLower = fn(lower), fMidpoint = fn(midpoint), fUpper = fn(upper);
      const whole = simpsonEstimate(lower, upper, fLower, fMidpoint, fUpper);

      function recurse(a, b, fa, fm, fb, previous, epsilon, depth) {
        const m = (a + b) / 2, leftMidpoint = (a + m) / 2, rightMidpoint = (m + b) / 2;
        const fLeftMidpoint = fn(leftMidpoint), fRightMidpoint = fn(rightMidpoint);
        const left = simpsonEstimate(a, m, fa, fLeftMidpoint, fm);
        const right = simpsonEstimate(m, b, fm, fRightMidpoint, fb);
        const refined = left + right, delta = refined - previous;
        if (depth <= 0 || Math.abs(delta) <= 15 * epsilon) return refined + delta / 15;
        return recurse(a, m, fa, fLeftMidpoint, fm, left, epsilon / 2, depth - 1) +
                recurse(m, b, fm, fRightMidpoint, fb, right, epsilon / 2, depth - 1);
      }

      return recurse(lower, upper, fLower, fMidpoint, fUpper, whole, tolerance, maxDepth);
    }

    function posteriorExpectation(distribution, fn) {
      return integrateAdaptive(u => {
        const rate = betaQuantile(u, distribution.alpha, distribution.beta);
        return fn(rate);
      });
    }

    function posteriorProbabilityAboveMargin(controlPosterior, variantPosterior, margin = 0) {
      const result = posteriorExpectation(controlPosterior, controlRate => {
        const threshold = Math.min(1, Math.max(0, controlRate - margin));
        return 1 - betaCDF(threshold, variantPosterior.alpha, variantPosterior.beta);
      });
      return clampProbability(result);
    }

    function projectedPosterior({ visitors, conversions, additionalVisitors, observedRate }) {
      return posterior({ visitors: visitors + additionalVisitors, conversions: conversions + additionalVisitors * observedRate });
    }

    function projectedProbability({ n0, x0, n1, x1, additionalPerArm, margin, mode }) {
      const controlRate = x0 / n0, variantRate = x1 / n1;
      const controlPosterior = projectedPosterior({ visitors: n0, conversions: x0, additionalVisitors: additionalPerArm, observedRate: controlRate });
      const variantPosterior = projectedPosterior({ visitors: n1, conversions: x1, additionalVisitors: additionalPerArm, observedRate: variantRate });
      return posteriorProbabilityAboveMargin(controlPosterior, variantPosterior, mode === "better" ? 0 : margin);
    }

    function projectedAdditionalPerArm({ n0, x0, n1, x1, margin, target, mode }) {
      const controlRate = x0 / n0, variantRate = x1 / n1;
      if (mode === "better" && variantRate <= controlRate) return null;
      if (mode === "nonInferior" && variantRate <= controlRate - margin) return null;

      const probabilityAfter = additionalPerArm => projectedProbability({ n0, x0, n1, x1, additionalPerArm, margin, mode });
      if (probabilityAfter(0) >= target) return 0;

      const maxAdditionalPerArm = 5_000_000;
      let low = 0, high = 64;
      while (high < maxAdditionalPerArm && probabilityAfter(high) < target) { low = high; high *= 2; }
      if (probabilityAfter(high) < target) return null;

      while (high - low > 1) {
        const mid = Math.floor((low + high) / 2);
        if (probabilityAfter(mid) >= target) high = mid;
        else low = mid;
      }
      return high;
    }

    function formatProjection(additionalPerArm, currentTotal) {
      if (additionalPerArm === null) return '<span class="text-stone-400">Not projected</span>';
      if (additionalPerArm === 0) return `<span class="font-semibold text-stone-950">${currentTotal.toLocaleString()}</span> total <span class="text-stone-500">(reached now)</span>`;
      const additionalTotal = additionalPerArm * 2, total = currentTotal + additionalTotal;
      return `<span class="font-semibold text-stone-950">${total.toLocaleString()}</span> total <span class="text-stone-500">(+${additionalTotal.toLocaleString()})</span>`;
    }

    function updateProjectionHighlight(thresholdPercent) {
      const rows = [
        { value: 90, row: $("projectionBetter90").closest("tr") },
        { value: 95, row: $("projectionBetter95").closest("tr") },
        { value: 99, row: $("projectionBetter99").closest("tr") }
      ];

      const closest = rows.reduce(
        (best, current) =>
          Math.abs(current.value - thresholdPercent) <
          Math.abs(best.value - thresholdPercent)
            ? current
            : best,
        rows[1]
      );

      for (const { value, row } of rows) {
        const selected = row === closest.row;
        row.dataset.selected = String(selected);
        row.children[0].textContent =
          `${value}%${selected ? (value === thresholdPercent ? " (selected)" : " (closest)") : ""}`;
      }
    }

    function updateSampleProjections({ n0, x0, n1, x1, margin, threshold }) {
      const currentTotal = n0 + n1;
      const thresholds = [
        { probability: 0.90, suffix: "90" },
        { probability: 0.95, suffix: "95" },
        { probability: 0.99, suffix: "99" }
      ];
      for (const entry of thresholds) {
        const better = projectedAdditionalPerArm({ n0, x0, n1, x1, margin, target: entry.probability, mode: "better" });
        const nonInferior = projectedAdditionalPerArm({ n0, x0, n1, x1, margin, target: entry.probability, mode: "nonInferior" });
        $(`projectionBetter${entry.suffix}`).innerHTML = formatProjection(better, currentTotal);
        $(`projectionNI${entry.suffix}`).innerHTML = formatProjection(nonInferior, currentTotal);
      }
      updateProjectionHighlight(Math.round(threshold * 100));
    }

    function updateDecisionBanner(state, title, text) {
      $("decisionBanner").dataset.state = state;
      $("decisionTitle").textContent = title;
      $("decisionText").textContent = text;
    }

    function updateObservedExperiment() {
      const n0 = Number($("controlN").value), x0 = Number($("controlX").value),
            n1 = Number($("variantN").value), x1 = Number($("variantX").value),
            margin = getMappedValue($("marginRange"), MARGIN_VALUES) / 100,
            decisionThreshold = getMappedValue($("thresholdRange"), THRESHOLD_VALUES) / 100;

      if (!(Number.isInteger(n0) && Number.isInteger(n1) && Number.isInteger(x0) && Number.isInteger(x1) &&
            Number.isFinite(margin) && Number.isFinite(decisionThreshold) &&
            n0 > 0 && n1 > 0 && x0 >= 0 && x1 >= 0 && x0 <= n0 && x1 <= n1 &&
            margin >= 0 && margin <= 1 && decisionThreshold > 0 && decisionThreshold < 1)) return;

      const controlRate = x0 / n0, variantRate = x1 / n1, difference = variantRate - controlRate;
      const relativeLift = controlRate > 0 ? difference / controlRate : NaN;

      const controlPosterior = posterior({ visitors: n0, conversions: x0 });
      const variantPosterior = posterior({ visitors: n1, conversions: x1 });
      const pBetter = posteriorProbabilityAboveMargin(controlPosterior, variantPosterior, 0);
      const pNonInferior = posteriorProbabilityAboveMargin(controlPosterior, variantPosterior, margin);

      $("controlRate").textContent = percent(controlRate, 2);
      $("variantRate").textContent = percent(variantRate, 2);
      $("controlCount").textContent = `(${x0}/${n0})`;
      $("variantCount").textContent = `(${x1}/${n1})`;
      $("absLift").textContent = signedPercent(difference, 2);
      $("relLift").textContent = Number.isFinite(relativeLift) ? signedPercent(relativeLift, 1) : "—";

      $("probBetter").textContent = percent(pBetter, 1);
      $("probNI").textContent = percent(pNonInferior, 1);
      updateProbabilityBar("probBetterBar", pBetter, decisionThreshold);
      updateProbabilityBar("probNIBar", pNonInferior, decisionThreshold);
      $("niCaption").textContent = `P(variant > control − ${(100 * margin).toFixed(1)}% absolute)`;

      updateSampleProjections({ n0, x0, n1, x1, margin, threshold: decisionThreshold });

      if (pBetter >= decisionThreshold) {
        updateDecisionBanner("success", "Variant is better", `The superiority rule has crossed your ${(100 * decisionThreshold).toFixed(0)}% threshold.`);
      } else if (pNonInferior >= decisionThreshold) {
        updateDecisionBanner("success", "Variant is non-inferior", `The variant appears no more than ${(100 * margin).toFixed(1)}% absolute below control at your selected threshold.`);
      } else if (pBetter >= Math.max(0, decisionThreshold - 0.05) || pNonInferior >= Math.max(0, decisionThreshold - 0.05)) {
        updateDecisionBanner("warning", "Close, but not there yet", `You are within 5% of your ${(100 * decisionThreshold).toFixed(0)}% threshold, but neither rule has crossed it yet.`);
      } else {
        updateDecisionBanner("neutral", "Keep collecting data", `Neither rule has crossed your ${(100 * decisionThreshold).toFixed(0)}% threshold yet.`);
      }
    }

    function evanMillerSampleSize({ baseline, mde, power, alpha, sided }) {
      const p = baseline > 0.5 ? 1 - baseline : baseline;
      if (!(p > 0 && p < 1 && mde > 0 && p + mde > 0 && p + mde < 1 && power > 0 && power < 1 && alpha > 0 && alpha < 1)) return null;
      const alphaDivisor = sided === 2 ? 2 : 1;
      const zAlpha = normalQuantile(1 - alpha / alphaDivisor, 0, 1);
      const zPower = normalQuantile(power, 0, 1);
      const nullSD = Math.sqrt(2 * p * (1 - p));
      const alternativeSD = Math.sqrt(p * (1 - p) + (p + mde) * (1 - p - mde));
      const raw = Math.pow(zAlpha * nullSD + zPower * alternativeSD, 2) / Math.pow(mde, 2);
      return { displayed: Math.round(raw), raw };
    }

    function updateSampleSize() {
      const baseline = Number($("baseline").value) / 100;
      const rawMDE = Number($("mde").value) / 100;
      const mde = $("mdeType").value === "relative" ? baseline * rawMDE : rawMDE;
      const power = Number($("power").value), alpha = Number($("alpha").value), sided = Number($("sided").value);
      const result = evanMillerSampleSize({ baseline, mde, power, alpha, sided });

      if (!result) {
        $("sampleN").textContent = "—";
        $("sampleNote").textContent = "Check the baseline and effect values.";
        return;
      }

      const mdeDescription = $("mdeType").value === "relative"
        ? `${(100 * rawMDE).toFixed(1)}% relative (${(100 * mde).toFixed(2)}% absolute)`
        : `${(100 * mde).toFixed(1)}% absolute`;

      $("sampleN").textContent = result.displayed.toLocaleString();
      $("sampleNote").textContent = `${percent(baseline, 1)} baseline · ${mdeDescription} MDE · ${(100 * power).toFixed(0)}% power · ${(100 * alpha).toFixed(1)}% significance · ${sided === 1 ? "one-sided" : "two-sided"} test.`;
    }

    function updateAll() { updateObservedExperiment(); updateSampleSize(); }

    let updateTimer;
    function scheduleUpdate() {
      window.clearTimeout(updateTimer);
      updateTimer = window.setTimeout(updateAll, 80);
    }

    syncMappedRange($("marginRange"), $("marginInput"), MARGIN_VALUES, "");
    syncMappedRange($("thresholdRange"), $("thresholdInput"), THRESHOLD_VALUES, "%");

    document.querySelectorAll("input, select").forEach(element => {
      element.addEventListener("input", scheduleUpdate);
      element.addEventListener("change", scheduleUpdate);
    });

    updateAll();
  })();
</script>
