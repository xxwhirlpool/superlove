const makePlaceholder = (draggedItem) => {
  const placeholder = document.createElement('li');
  placeholder.classList.add('placeholder');
  placeholder.style.height = `${draggedItem.offsetHeight}px`;
  return placeholder;
};

const movePlaceholder = (e) => {
  const dragGroup = e.currentTarget.getAttribute("data-group");
  const dragGroupName = `${dragGroup ? `${dragGroup}-` : ''}listitem`;
  console.log(dragGroupName);
  if (!e.dataTransfer.types.includes(dragGroupName)) {
    return;
  }
  e.preventDefault();
  const draggedItem = document.querySelector('[dragging]');
  const list = e.currentTarget;
  const items = list.children;
  const existingPlaceholder = list.querySelector('.placeholder');
  if (existingPlaceholder) {
    const placeholderRect = existingPlaceholder.getBoundingClientRect();
    if (placeholderRect.top <= e.clientY && placeholderRect.bottom >= e.clientY) {
      return;
    }
  }
  for (const item of items) {
    const rect = item.getBoundingClientRect();
    if (rect.bottom >= e.clientY) {
      console.log(item);
      if (item === existingPlaceholder) return;
      if (existingPlaceholder) existingPlaceholder.remove();
      if (item === draggedItem) return;
      console.log(!item.nextElementSibling ? 'last item' : 'not last item');
      if (!item.nextElementSibling) {
        console.log('its the last item');
        item.after(existingPlaceholder ?? makePlaceholder(draggedItem));
      } else {
        list.insertBefore(existingPlaceholder ?? makePlaceholder(draggedItem), item);
      }
      return;
    }
  }
}

document.addEventListener('dragstart', (e) => {
  if (e.target.closest('.sortable-list li') && !e.target.closest('.position')) {
    const target = e.target.closest('.sortable-list li');
    const dragGroup = target.closest('.sortable-list').getAttribute("data-group");
    const dragGroupName = `${dragGroup ? `${dragGroup}-` : ''}listitem`;
    target.setAttribute('dragging', true);
    e.dataTransfer.setData("text/plain", e.target.innerText);
    e.dataTransfer.setData("text/html", e.target.outerHTML);
    e.dataTransfer.effectAllowed = "move";
    e.dataTransfer.setData(dragGroupName, "");
  }
});
  
document.addEventListener('dragend', (e) => {
  if (e.target.closest('.sortable-list li')) {
    const target = e.target.closest('.sortable-list li');
    target.removeAttribute('dragging');
  }
});

document.querySelectorAll('.sortable-list').forEach((elt) => {
  elt.addEventListener('dragover', movePlaceholder);
  elt.addEventListener('dragleave', (e) => {
    if (elt.contains(e.relatedTarget)) return;
    const placeholder = elt.querySelector('.placeholder');
    if (placeholder) placeholder.remove();
  });
  
  elt.addEventListener('drop', (e) => {
    e.preventDefault();
    const draggedItem = document.querySelector('[dragging]');
    const placeholder = elt.querySelector('.placeholder');
    if (!placeholder) return;
    draggedItem.remove();
    elt.insertBefore(draggedItem, placeholder);
    placeholder.remove();
    elt.querySelectorAll('li').forEach((li, i) => {
      const orderField = li.querySelector('input[type="number"]');
      orderField.value = i + 1;
    });
  });
});

document.addEventListener('change', (e) => {
  if (!e.target.closest('.position input[type="number"]')) return;
  const list = e.target.closest('.sortable-list');
  const items = Array.from(list.children).sort((a, b) => {
    const posA = parseInt(a.querySelector('.position input[type="number"]').value);
    const posB = parseInt(b.querySelector('.position input[type="number"]').value);
    if (posA > posB) return -1;
    return 1;
  });
  items.forEach(i => i.remove());
  items.forEach((i, n) => {
    list.append(i);
    i.querySelector('.position input[type="number"]').value = n + 1;
  });
});