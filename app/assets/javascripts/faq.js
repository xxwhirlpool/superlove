document.getElementById('add-question').addEventListener('click', (e) => {
  e.preventDefault();
  const addQBtn = document.getElementById('add-question');
  const group = document.getElementById('questions');
  const index = parseInt(group.querySelector('.faq-item:last-of-type').getAttribute('data-index'));
  const template = document.getElementById(`faq-item-${index}`).cloneNode(true);
  template.setAttribute('data-index', index+1);
  template.id = `faq-item-${index+1}`;
  console.log(template.querySelector('h4 span'));
  template.querySelector('h4 span').textContent = index.toString();
  template.querySelectorAll('input[type="text"], textarea').forEach((elt) => {
    elt.value = "";
  });
  group.append(template);
  const indexField = document.createElement('input');
  indexField.type = "hidden";
  indexField.value = index + 1;
  indexField.name = `archive_faq[questions_attributes][${index}][id]`;
  indexField.id = `archive_faq_questions_attributes_${index}_id`;
  indexField.setAttribute('autocomplete', 'off');
  template.after(indexField);
});

document.addEventListener('click', (e) => {
  if (e.target.closest('.remove-section')) {
    e.preventDefault();
    const container = e.target.closest('.faq-item');
    const index = parseInt(container.getAttribute('data-index'));
    const idField = document.getElementById(`archive_faq_questions_attributes_${index - 1}_id`);
    idField.remove();
    // TODO: add this to translations somehow
    const confirmation = confirm("Are you sure you'd like to delete this FAQ item?");
    if (confirmation) container.remove();
  }
});