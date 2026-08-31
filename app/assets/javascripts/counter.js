const count = (e) => {
  console.log(e.target.tagName);
  console.log(e.target.innerHTML);
  const curLength = e.target.tagName === 'TEXTAREA' ? e.target.value.length : e.target.innerHTML.length;
  const str = `${maxLength - curLength}${maxLength - curLength !== 1 ? plural : singular}`;
  counter.innerHTML = str;
}

document.querySelectorAll('.observe_textlength').forEach((elt) => {
  const counterId = `${elt.id}_counter`;
  const counter = document.getElementById(counterId);
  const maxLength = parseInt(counter.getAttribute('data-maxlength'));
  const singular = counter.getAttribute('data-singular');
  const plural = counter.getAttribute('data-plural');
  elt.addEventListener("keypress", count);
  elt.addEventListener("change", count);
});