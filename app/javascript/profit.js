window.addEventListener('keyup', function(){

  // 価格
const autoCalculation = document.getElementById("item-price")

const listPrice = document.getElementById("item-price").value;

  // 販売手数料
const salesCommission = document.getElementById("add-tax-price")

const salesFee = listPrice * 0.1;

salesCommission.innerHTML = salesFee

  // 販売利益
const salesProfit = document.getElementById("profit")

const profit = listPrice * 0.9;

salesProfit.innerHTML = profit

})