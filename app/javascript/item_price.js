


const price = () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    const profitValue = document.getElementById("profit");
    const taxValue = inputValue * 0.1
    profitValue.innerHTML = (Math.floor(inputValue - taxValue));
  })
};


window.addEventListener('turbo:load', price);
window.addEventListener('turbo:render', price);

