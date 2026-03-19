import resolve from "@rollup/plugin-node-resolve"

export default {
  input: [
    "app/assets/javascript/application.js",
    "app/assets/javascript/skineditor.js"
  ],
  output: [
    {
      dir: "app/assets/builds",
      format: "esm",
      inlineDynamicImports: false,
      sourcemap: true
    },
    {
      dir: "app/assets/builds",
      format: "esm",
      inlineDynamicImports: false,
      sourcemap: true
    }
  ],
  plugins: [
    resolve()
  ]
}
