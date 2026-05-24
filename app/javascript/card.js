const pay = () => {
  const publickey = gon.public_key
  const payjp = Payjp(publickey)
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault(); // デフォルトのフォーム送信を最初に防ぐ

    const submitButton = document.getElementById("button");
    submitButton.setAttribute("disabled", "true");

    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        // エラーが発生した場合は、送信ボタンの無効化を解除して処理を中断する
        submitButton.removeAttribute("disabled");
        alert(response.error.message || "カード情報の入力に誤りがあります。"); // ユーザーにエラーメッセージを表示
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        numberElement.clear();
        expiryElement.clear();
        cvcElement.clear();
        document.getElementById("charge-form").submit();
      }
    }).catch(function (error) { // Payjp APIとの通信エラーなど、予期せぬエラーを捕捉
      console.error("Payjpトークン生成中にエラーが発生しました:", error);
      submitButton.removeAttribute("disabled"); // ボタンを再度有効化
      alert("決済処理中に予期せぬエラーが発生しました。もう一度お試しください。");
    });
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);
