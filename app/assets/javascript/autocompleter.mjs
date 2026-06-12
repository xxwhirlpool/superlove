const autocomplete = ({ input, fetch, onSelect }) => {
  const value = input.value;
  input.addEventListener('focus', (e) => {
    e.target.nextElementSibling.classList.remove('hidden');
  });
  input.addEventListener('blur', (e) => {
    e.target.nextElementSibling.classList.add('hidden');
  });
  input.addEventListener('keyup', (e) => {
    const text = e.target.value;
  });
  fetch(value, (data, resultsList, tagList, tagElement) => {
    if (data) {
      data.forEach((t) => {
        const li = document.createElement('li');
        const a = document.createElement('a');
        a.href = "#";
        a.setAttribute('data-tag', t.id);
        a.textContent = t.name;
        a.addEventListener('click', (e) => {
          e.preventDefault();
          const tagElt = document.createElement(tagElement);
          const tag = e.target.getAttribute('data-tag');
          const removeBtn = document.createElement('a');
          removeBtn.textContent = "×";
          removeBtn.classList.add('delete');
          removeBtn.addEventListener('click', ())
          tagElement.textContent = tag;
          
        })
      })
    }
  });
};

export default autocomplete;