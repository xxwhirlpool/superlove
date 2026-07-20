import { defineConfig } from 'vite';
import rails from 'rails-vite-plugin';

export default defineConfig({
  plugins: [
    rails({
      input: [
        "javascripts/application.js",
        "javascripts/checkbox_section_toggle.js",
        "javascripts/faqadd.js",
        "javascripts/faqdrag.js",
        "javascripts/rte.js",
        "javascripts/search.js",
        "javascripts/skineditor.js",
        "javascripts/tip.mjs",
        "javascripts/autocompleter.mjs",
        "javascripts/oneko.js",
        "stylesheets/application.css",
        "stylesheets/nekobutton.css",
        "stylesheets/highlightjs/atelier-cave-light.min.css"
      ],
      sourceDir: 'app/assets',
    }),
  ],
  css: {
    transformer: 'lightningcss'
  },
  build: {
    cssMinify: 'lightningcss'
  }
});
