window.addEventListener('turbo:load', () => {
  // 入力された金額を取得し、profitに代入
  const profitInput = document.getElementById('item-price');
  
  // 入力のたびに処理がされるようにする
  if (profitInput) {
  profitInput.addEventListener("input", () => {
    const inputValue = profitInput.value;
    const taxPrice = document.getElementById('add-tax-price');
    const taxPriceValue = Math.floor(parseFloat(inputValue) * 0.1) || 0;
    const profitDom = document.getElementById('profit');
    profitDom.innerHTML = inputValue - taxPriceValue || 0;
    });
  }
});