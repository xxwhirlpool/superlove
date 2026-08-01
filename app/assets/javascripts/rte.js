import {EditorState} from "prosemirror-state"
import {EditorView} from "prosemirror-view"
import {Schema, DOMParser} from "prosemirror-model"
import {schema} from "prosemirror-schema-basic"
import {addListNodes} from "prosemirror-schema-list"
import {exampleSetup} from "prosemirror-example-setup"

// Mix the nodes from prosemirror-schema-list into the basic schema to
// create a schema with list support.
const mySchema = new Schema({
  nodes: addListNodes(schema.spec.nodes, "paragraph block*", "block"),
  marks: schema.spec.marks
});

const rte = document.getElementById('rteditor');

window.view = new EditorView(rte, {
  state: EditorState.create({
    doc: DOMParser.fromSchema(mySchema).parse(rte.nextElementSibling),
    plugins: exampleSetup({schema: mySchema})
  })
});
rte.addEventListener('input', (e) => {
  const doc = e.target.innerHTML;
  const pt = document.getElementById("plaintext");
  pt.value = doc;
  const curLength = pt.value.length;
  const maxLength = parseInt(pt.getAttribute('maxlength'));
  const plural = pt.getAttribute('data-plural');
  const singular = pt.getAttribute('data-singular');
  const str = `${maxLength - curLength}${maxLength - curLength !== 1 ? plural : singular}`;
  document.getElementById('plaintext_counter').innerHTML = str;
});
setTimeout(() => {
  rte.querySelector('.ProseMirror').style.minHeight = `${window.innerHeight - 40}px`;
  document.getElementById('plaintext').style.minHeight = `${window.innerHeight - 40}px`;
}, 1000);
const rteToggles = document.querySelectorAll('.rtf-html-switch');
if (rteToggles) {
  window.addEventListener('load', (_e) => {
    rteToggles.forEach((t) => {
      t.classList.remove('hidden');
      t.querySelector('.rtf-link').addEventListener('click', (rtf) => {
        rtf.preventDefault();
        const rtid = rtf.target.getAttribute('data-rteditor');
        const ptid = rtf.target.getAttribute('data-pteditor');
        document.getElementById(rtid).classList.remove('hidden');
        document.getElementById(ptid).classList.add('hidden');
      });
      t.querySelector('.html-link').addEventListener('click', (pt) => {
        pt.preventDefault();
        const rtid = pt.target.getAttribute('data-rteditor');
        const ptid = pt.target.getAttribute('data-pteditor');
        document.getElementById(rtid).classList.add('hidden');
        document.getElementById(ptid).classList.remove('hidden');
      });
    });
    document.getElementById('plaintext').classList.add('hidden');
  });
}