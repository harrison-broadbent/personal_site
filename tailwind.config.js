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
        display: ["DM Sans", "sans-serif"],
        mono: ["JetBrains Mono", "mono"],
      },
    },
  },
  plugins: [require("@tailwindcss/typography")],
};
