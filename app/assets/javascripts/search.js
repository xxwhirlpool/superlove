document.querySelectorAll('[data-autocomplete-method]').forEach((elt) => {
  // set variables
  elt.type = "hidden";
  const id = elt.id;
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
  visibleInput.id = id+"-visible";
  const searchHint = `<li class="hint">${autocompleteHint}</li>`;
  const searchProgress = `<li class="progress">${autocompleteSearching}</li>`;
  const searchNoResults = `<li class="noresults">${autocompleteNoResults}</li>`;
  const resultsElt = document.createElement('ul');
  resultsElt.id = id+"_results";
  resultsElt.classList.add('results', 'hidden');
  resultsElt.innerHTML = searchHint;
  const results = elt.closest('.autocomplete-wrapper')
  const tagsElt = document.createElement('ul');
  tagsElt.id = id+"_tags";
  tagsElt.classList.add('tags', 'hidden');
  elt.before(tagsElt);
  tagsElt.after(visibleInput);
  visibleInput.after(resultsElt);
  
  const getAllTags = (id) => {
    if (document.getElementById(`${id}_tags`)) {
      const tags = Array.from(document.getElementById(`${id}_tags`).querySelectorAll('li')).map((t) => {
        return t.textContent;
      });
      return tags.join(",");
    }
    return "";
  }
  
  // add event listeners
  visibleInput.addEventListener('focus', (e) => {
    if (e.target.value === "") {
      resultsElt.innerHTML = searchHint;
    } else {
      resultsElt.innerHTML = searchProgress;
    }
    resultsElt.classList.remove('hidden');
  });
  visibleInput.addEventListener('blur', (e) => {
    if (resultsElt.classList.contains('hasresults')) return;
    resultsElt.classList.add('hidden');
  });
  visibleInput.addEventListener('keydown', (e) => {
    if (e.key === ',') {
      e.preventDefault();
      const token = visibleInput.value;
      const newLi = document.createElement('li');
      const deleteTag = document.createElement('a');
      deleteTag.classList.add('delete-tag');
      deleteTag.addEventListener('click', (ev) => {
        ev.preventDefault();
        ev.parentElement.remove();
        elt.value = getAllTags(id);
      });
      deleteTag.textContent = '╳';
      newLi.textContent = token;
      newLi.append(deleteTag);
      tagsElt.append(newLi);
      if (tagsElt.classList.contains('hidden')) tagsElt.classList.remove('hidden');
      visibleInput.value = "";
      elt.value = getAllTags(id);
    }
  });
  visibleInput.addEventListener('keyup', (e) => {
    const text = e.target.value;
    document.getElementById(`${id}_results`).classList.remove('hasresults');
    if (text === "") {
      document.getElementById(`${id}_results`).innerHTML = searchHint;
      return;
    }
    const endpoint = `/autocomplete/${autocompleteType}?term=${text}${(autocompleteTagset ? '&type='+autocompleteTagset : '')}`;
    document.getElementById(`${id}_results`).classList.remove('hidden');
    document.getElementById(`${id}_results`).innerHTML = searchProgress;
    fetch(endpoint).then((resp) => {
      resp.json().then((data) => {
        if (data.length === 0) {
          document.getElementById(`${id}_results`).innerHTML = searchNoResults;
          return;
        }
        document.getElementById(`${id}_results`).innerHTML = "";
        if (data.length > 0) {
          document.getElementById(`${id}_results`).classList.add('hasresults');
        }
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
            remove.textContent = "×";
            tag.append(remove);
            document.getElementById(`${id}_tags`).append(tag);
            elt.value = getAllTags();
            document.getElementById(`${id}_visible`).value = "";
            document.getElementById(`${id}_results`).innerHTML = "";
            document.getElementById(`${id}_results`).classList.add('hidden');
            console.log(document.getElementById(`${id}_results`));
            document.getElementById(`${id}_tags`).classList.remove('hidden');
            console.log(document.getElementById(`${id}_tags`));
          });
          li.append(a);
          document.getElementById(`${id}_results`).append(li);
        })
      });
    });
  });
});
