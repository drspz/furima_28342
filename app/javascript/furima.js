window.addEventListener("load", function(){
  const aaa = document.getElementById("item-price")
  aaa.addEventListener("change", function(){
  //  金額を取得
  let price = aaa.value;
  // 販売手数料と販売利益を計算
  let fee = price / 10
  let profit = price - fee
  // 計算結果を表示させる
  const bbb = document.getElementById("add-tax-price")
  const ccc = document.getElementById("profit")
  bbb.textContent = fee
  ccc.textContent = profit
  });

});