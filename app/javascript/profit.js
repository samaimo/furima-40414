window.addEventListener('turbo:load', () => {
  // 入力された金額を取得し、profitに代入
  const profitInput = document.getElementById('item-price');
  
  // 入力のたびに処理がされるようにする
  profitInput.addEventListener("input", () => {
    const inputValue = profitInput.value;
    const taxPrice = document.getElementById('add-tax-price');
    const taxPriceValue = parseFloat(taxPrice.innerHTML);
    const profitDom = document.getElementById('profit');
    profitDom.innerHTML = Math.floor( inputValue - taxPriceValue);
  })
});