const initFocusTips = () => {
  document.querySelectorAll('input + .tip').forEach((elt) => {
    const input = elt.previousElementSibling;
    console.log(input);
    const tip = elt;
    if (input) {
      input.addEventListener('focus', (_e) => {
        tip.classList.remove('hidden');
      })
      input.addEventListener('blur', (_e) => {
        tip.classList.add('hidden');
      });
    }
  });
}

export default initFocusTips;