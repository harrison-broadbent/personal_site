/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./source/**/*.{html,erb,md}",
    "./source/*.{html,erb,md}",
    "./source/layouts/*.{html,erb.md}",
  ],
  theme: {
    extend: {
      fontFamily: {
        // serif: ["Georgia", "serif"],
        // serif: ["Playfair Display", "serif"],
        serif: ["'Source Serif 4'", "serif"],
        display: ["DM Sans", "sans-serif"],
        mono: ["JetBrains Mono", "mono"],
      },
    },
  },
  plugins: [require("@tailwindcss/typography")],
};
