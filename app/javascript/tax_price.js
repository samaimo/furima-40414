window.addEventListener('turbo:load', () => {
  const taxInput = document.getElementById('item-price');
  const addTaxDom = document.getElementById("add-tax-price");
  
  if (taxInput && addTaxDom) {
  taxInput.addEventListener("input", () => {
    const inputValue = taxInput.value;
    addTaxDom.innerHTML =  Math.floor(parseFloat(inputValue) * 0.1) || 0;    });
  }
});