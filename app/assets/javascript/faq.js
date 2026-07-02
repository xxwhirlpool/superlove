const add_section = (elt, model, content) => {
  const group = document.getElementById(model);
  const index = parseInt(group.querySelector('.faq-item:last-of-type').getAttribute('data-index'));
  group.innerHTML += content;
}

document.addEventListener('click', (e) => {
  if (e.target.closest('.remove-section')) {
    e.preventDefault();
    const container = e.target.closest('.faq-item');
    // TODO: add this to translations somehow
    const confirmation = confirm("Are you sure you'd like to delete this FAQ item?");
    if (confirmation) container.remove();
  }
})