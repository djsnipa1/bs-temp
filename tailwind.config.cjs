const daisyui = require('daisyui');
const typography = require('@tailwindcss/typography');

/** @type {import('tailwindcss').Config}*/
const config = {
  content: ['./src/**/*.{html,js,svelte,ts}'],

  theme: {
    extend: {
      fontFamily: {
        sofiasans: ['"Sofia Sans Variable"', 'sans-serif']
      }
    }
  },

  plugins: [typography, daisyui]
};

module.exports = config;
