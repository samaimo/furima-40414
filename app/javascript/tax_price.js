window.addEventListener('turbo:load', () => {
  const taxInput = document.getElementById('item-price');
  taxInput.addEventListener("input", () => {
    const inputValue = taxInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(parseFloat(inputValue) * 0.1);
  });
});