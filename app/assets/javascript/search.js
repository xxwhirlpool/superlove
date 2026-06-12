document.querySelectorAll('[data-autocomplete-method]').forEach((elt) => {
  // set variables
  elt.type = "hidden";
  const wrapper = document.createElement('div');
  wrapper.classList.add('autocomplete-container');
  elt.after(wrapper);
  wrapper.append(elt);
  const autocompleteType = elt.getAttribute('data-autocomplete-type');
  const autocompleteTagset = elt.getAttribute('data-autocomplete-tagset');
  const autocompleteHint = elt.getAttribute('data-autocomplete-hint-text');
  const autocompleteNoResults = elt.getAttribute('data-autocomplete-no-results-text');
  const autocompleteSearching = elt.getAttribute('data-autocomplete-searching-text');
  const autocompleteMinChars = elt.getAttribute('data-autocomplete-min-chars');
  const tagElement = 'li';
  
  // create UI elements
  const visibleInput = document.createElement('input');
  visibleInput.type = "text";
  visibleInput.id = elt.id+"-visible";
  const searchHint = `<li class="hint">${autocompleteHint}</li>`;
  const searchProgress = `<li class="progress">${autocompleteSearching}</li>`;
  const searchNoResults = `<li class="noresults">${autocompleteNoResults}</li>`;
  const resultsElt = document.createElement('ul');
  resultsElt.classList.add('results', 'hidden');
  resultsElt.innerHTML = searchHint;
  const results = elt.closest('.autocomplete-wrapper')
  const tagsElt = document.createElement('ul');
  tagsElt.classList.add('tags', 'hidden');
  elt.before(tagsElt);
  tagsElt.after(visibleInput);
  visibleInput.after(resultsElt);
  
  const getAllTags = () => {
    if (tagsElt) {
      return Array.from(tagsElt.querySelectorAll('li')).forEach((t) => {
        return t.getValue('data-tag');
      }).join(",");
    }
    return "";
  }
  
  // add event listeners
  visibleInput.addEventListener('focus', (e) => {
    console.log('trigger focus');
    console.log(`e.target.value = ${e.target.value}`);
    console.log(resultsElt);
    if (e.target.value === "") {
      resultsElt.innerHTML = searchHint;
    } else {
      resultsElt.innerHTML = searchProgress;
    }
    resultsElt.classList.remove('hidden');
    console.log(resultsElt.innerHTML);
    console.log(resultsElt.classList);
  });
  visibleInput.addEventListener('blur', (e) => {
    console.log('trigger blur');
    resultsElt.classList.add('hidden');
    console.log(resultsElt.classList);
  });
  visibleInput.addEventListener('keyup', (e) => {
    console.log('trigger keyup');
    const text = e.target.value;
    const endpoint = `/autocomplete/${autocompleteType}?term=${text}${(autocompleteTagset ? '&type='+autocompleteTagset : '')}`;
    resultsElt.classList.remove('hidden');
    resultsElt.innerHTML = searchProgress;
    fetch(endpoint).then((resp) => {
      resp.json().then((data) => {
        if (data.length === 0) {
          resultsElt.innerHTML = searchNoResults;
          return;
        }
        resultsElt.innerHTML = "";
        data.forEach((t) => {
          const li = document.createElement('li');
          const a = document.createElement('a');
          a.href = "#";
          a.setAttribute('data-tag', t.id);
          a.textContent = t.name;
          a.addEventListener('click', (ev) => {
            ev.preventDefault();
            const tag = document.createElement('li');
            const remove = document.createElement('a');
            tag.textContent = t.name;
            tag.setAttribute('data-tag', t.id);
            remove.href = "#";
            remove.addEventListener('click', (eve) => {
              eve.preventDefault();
              eve.target.parentElement.remove();
              elt.value = getAllTags();
            });
            elt.value = getAllTags();
            visibleInput.value = "";
            resultsElt.classList.add('hidden');
            resultsElt.innerHTML = "";
          });
          li.append(a);
          resultsElt.append(li);
        })
      });
    });
  });
});
