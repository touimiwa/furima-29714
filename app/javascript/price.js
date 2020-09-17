window.addEventListener('load', function(){

  const inputPrice = document.getElementById("item-price");
  const addTax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  inputPrice.addEventListener('input', function(){
    const price = document.getElementById("item-price").value;
    addTax.innerHTML = Math.floor(price * 0.1);
    profit.innerHTML = Math.floor(price  * 0.9);
  })
});
 

//  値を入力した時にイベントが発火する
// →item-priceの値を取得する
// 変数＝ document.getElementById("item-price").value;
// 計算式を記述する
// →計算結果を表示する







// "add-tax-price" = 販売手数料
// "profit" = 販売利益
