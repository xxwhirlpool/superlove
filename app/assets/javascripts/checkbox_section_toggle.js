window.addEventListener('load', (_e) => {
  document.querySelectorAll('.checkbox-section').forEach((cs) => {
    const checkboxesId = cs.id;
    const cssClass = cs.getAttribute('data-css-class');
    cs.querySelector('.actions').style.display = "none";
    cs.querySelector('show').addEventListener('click', (e) => {
      e.preventDefault();
      cs.querySelector('.index').classList.add('options');
      cs.querySelector('.hide').style.display = "block"
      cs.querySelector('.show').style.display = "none";
    });
    cs.querySelector(`.hide`).addEventListener('click', (e) => {
      e.preventDefault();
      cs.querySelector('.index').classList.add(cssClass);
      cs.querySelector('.hide').style.display = "none";
      cs.querySelector('.show').style.display = "block";
    });
  });
});