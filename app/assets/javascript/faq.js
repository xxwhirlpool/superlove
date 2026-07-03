document.getElementById('add-question').addEventListener('click', (e) => {
  e.preventDefault();
  const addQBtn = document.getElementById('add-question');
  const group = document.getElementById('questions');
  const index = parseInt(group.querySelector('.faq-item:last-of-type').getAttribute('data-index'));
  const template = document.getElementById(`faq-item-${index}`).cloneNode();
  template.setAttribute('data-index', index+1);
  template.id = `faq-item-${index+1}`;
  template.querySelector('h4 span').textContent = index;
  group.append(template);
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