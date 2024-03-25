function calculateTax() {
  const taxInput = document.getElementById('item-price');
  const addTaxDom = document.getElementById("add-tax-price");

  if (taxInput && addTaxDom) {
    taxInput.addEventListener("input", () => {
      const inputValue = parseFloat(taxInput.value);
      addTaxDom.innerHTML = Math.floor(inputValue * 0.1) || 0;
    });
  }
}

window.addEventListener('turbo:load', calculateTax);
window.addEventListener('turbo:render', calculateTax);