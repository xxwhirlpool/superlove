const initFocusTips = () => {
  document.querySelectorAll('input + .tip').forEach((elt) => {
    const input = elt.previousElementSibling;
    const tip = elt;
    input.addEventListener('focus', (e) => {
      tip.classList.remove('hidden');
    }).addEventListener('blur', (e) => {
      tip.classList.add('hidden');
    });
  });
}

export default initFocusTips;