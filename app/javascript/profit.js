function calculateProfit() {
  // 入力された金額を取得し、profitに代入
  const profitInput = document.getElementById('item-price');
  
  // 入力のたびに処理がされるようにする
  if (profitInput) {
  profitInput.addEventListener("input", () => {
    const inputValue = parseFloat(profitInput.value);
    const taxPriceValue = Math.floor(inputValue * 0.1) || 0;
    const profitDom = document.getElementById('profit');
    profitDom.innerHTML = inputValue - taxPriceValue || 0;
    });
  }
}
window.addEventListener('turbo:load', calculateProfit);
window.addEventListener('turbo:render', calculateProfit);