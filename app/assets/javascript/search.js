import autocomplete from "autocompleter";

document.querySelectorAll('[data-autocomplete-type]').forEach((elt) => {
  const autocompleteType = elt.getAttribute('data-autocomplete-type');
  const autocompleteTagset = elt.getAttribute('data-autocomplete-tagset');
  autocomplete({
    input: elt,
    fetch: function (text, update) {
      const textFinal = text.toLowerCase();
      const endpoint = '/autocomplete/'+autocompleteType+'?term='+textFinal+(autocompleteTagset !== "" ? '&type='+autocompleteTagset : '');
      fetch(endpoint).then((resp) => {
        resp.json().then((data) => {
          update(data);
        });
      });
    },
    onSelect: function (item) {
      input.value = item.label;
    },
  });
});
