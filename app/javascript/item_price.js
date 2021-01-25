function amountOutput() {
  const priceInput =  document.getElementById("item-price")
  const addTaxDom = document.getElementById("add-tax-price")
  const profitDom = document.getElementById("profit")
  priceInput.addEventListener("input", () => {
    let inputValue = priceInput.value;
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    profitDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
  })
  priceInput.addEventListener("change", () =>{
    inputValue = priceInput.value;
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    profitDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
  })
}
window.addEventListener('load',  amountOutput)