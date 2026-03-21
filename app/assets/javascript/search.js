import autocomplete from "autocompleter";

document.querySelectorAll('[data-autocomplete-method]').forEach((elt) => {
  const autocompleteType = elt.getAttribute('data-autocomplete-type');
  const autocompleteTagset = elt.getAttribute('data-autocomplete-tagset');
  const autocompleteHint = elt.getAttribute('data-autocomplete-hint-text');
  const autocompleteNoResults = elt.getAttribute('data-autocomplete-no-results-text');
  const autocompleteSearching = elt.getAttribute('data-autocomplete-searching-text');
  const autocompleteMinChars = elt.getAttribute('data-autocomplete-min-chars');
  const hintElt = document.createElement('div');
  hintElt.classList.add('hidden');
  hintElt.classList.add('hint');
  hintElt.innerHTML = autocompleteHint;
  elt.parentElement.append(hintElt);
  autocomplete({
    input: elt,
    fetch: function (text, update) {
      const textFinal = text.toLowerCase();
      const endpoint = '/autocomplete/'+autocompleteType+'?term='+textFinal+(autocompleteTagset !== "" ? '&type='+autocompleteTagset : '');
      fetch(endpoint).then((resp) => {
        resp.json().then((data) => {
          update(data);
          if (data.length === 0) {
            hintElt.innerHTML = autocompleteNoResults;
          }
        });
      });
    },
    onSelect: function (item) {
      input.value = item.label;
    },
  });
  
  elt.addEventListener('focus', (_e) => {
    elt.nextElementSibling.classList.remove('hidden');
  });
  
  elt.addEventListener('blur', (_e) => {
    elt.nextElementSibling.classList.add('hidden');
  });
});
