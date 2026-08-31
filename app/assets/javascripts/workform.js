document.querySelectorAll("[data-toggle]").forEach((elt) => {
  elt.addEventListener('change', (_e) => {
    const toggleTargetId = elt.getAttribute('data-toggle');
    const toggleTarget = document.getElementById(toggleTargetId);
    if (elt.checked) {
      toggleTarget.classList.remove('hidden');
    } else {
      toggleTarget.classList.add('hidden');
    }
  });
});

document.querySelectorAll("[data-dirty]").forEach((elt) => {
  const toggleTargetId = elt.getAttribute('data-dirty');
  const toggleTarget = document.getElementById(toggleTargetId);
  elt.addEventListener('change', (_e) => {
    if (elt.value !== "") {
      toggleTarget.classList.remove('hidden');
    } else {
      toggleTarget.classList.add('hidden');
    }
  });
});