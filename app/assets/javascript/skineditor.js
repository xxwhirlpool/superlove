import { basicSetup } from "codemirror";
import { EditorView } from "@codemirror/view";
import { css } from "@codemirror/lang-css";

const view = new EditorView({
  doc: "",
  parent: document.body,
  extensions: [
    basicSetup,
    css()
  ]
});