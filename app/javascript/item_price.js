 function item_price(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(inputValue - Math.floor(inputValue * 0.1))
  });
}


window.addEventListener('load', item_price)
window.addEventListener("turbo:render", item_price);