import { defineConfig } from 'vite';
import rails from 'rails-vite-plugin';

export default defineConfig({
  plugins: [
    rails({
      input: [
        "javascripts/application.js",
        "javascripts/faq.js",
        "javascripts/rte.js",
        "javascripts/search.js",
        "javascripts/skineditor.js",
        "javascripts/workeditor.js",
        "javascripts/tip.mjs",
        "javascripts/autocompleter.mjs",
        "javascripts/highlightjs/css.min.js",
        "javascripts/highlightjs/highlight.min.js",
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
