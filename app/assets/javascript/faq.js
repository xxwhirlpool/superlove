const add_section = (elt, model, content) => {
  const group = document.getElementById(model);
  group.innerHTML += content;
}