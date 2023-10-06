const url = "http://localhost:8080/netbliz-web/History";
axios.get(url)
    .then(function (response) {
        // handle success
        view_history(response.data);
        let temp
    })
    .catch(function (error) {
        // handle error
        console.log(error);
    });

let sender_account_number;
let receiver_account_number;

let sender_name;
let receiver_name;

let function_image;
let type;
let function_amount;
let icon;
let id;
let function_date;
let function_current_balance;
let account_number;
let remark;


function view_history(ele) {

    ele.forEach((e) => {

        if (e.transStatus === "debited") {

            function_image = "https://iili.io/JHYPQRt.png"; // bank image
            type = "Sent to";
            receiver_name = e.remittanceName;

            function_date = e.debitedDateTime;
            const [datePart, timePart] = function_date.split('T');
            function_date = `${datePart} ${timePart}`;

            icon = "https://iili.io/JHBLQm7.png";
            id = "minus";
            function_amount = e.transferAmount;

            function_current_balance = e.avlAmount;

            remark = e.remark;

            sender_account_number = e.accountHolderAccNo;
            receiver_account_number = e.remittanceAccNo;

            create_div();
        }

        else if (e.transStatus === "credited") {

            function_image = "https://iili.io/JHYPQRt.png";
            type = "Received from";
            receiver_name = e.remittanceName;

            function_date = e.paidDateTime;
            const [datePart, timePart] = function_date.split('T');
            function_date = `${datePart} ${timePart}`;

            icon = "https://iili.io/JHmWeDb.png";
            id = "plus";
            function_amount = e.transferAmount;

            function_current_balance = e.avlAmount;

            remark = e.remark;

            sender_account_number = e.accountHolderAccNo;
            receiver_account_number = e.remittanceAccNo;

            create_div();
        }

    })
}

function create_div() {
    const main_div = document.querySelector("main");

    const new_container = document.createElement("div");
    new_container.setAttribute("class", "history");
    main_div.append(new_container);

    const send = document.createElement("div");
    send.setAttribute("class", "send_data");
    new_container.append(send);

    const type_fund = document.createElement("div");
    type_fund.setAttribute("class", "type_fund");
    send.append(type_fund);

    const image = document.createElement("img");
    image.setAttribute("id", "bank_icon");
    image.setAttribute("src", function_image);
    image.setAttribute("alt", "bank_icon");
    type_fund.append(image);

    const transfer_type = document.createElement("div");
    transfer_type.setAttribute("class", "transfer_type");
    type_fund.append(transfer_type);

    const increase = document.createElement("h2");
    increase.setAttribute("class", "increase");
    increase.setAttribute("id", "increase");
    increase.innerText = type;
    transfer_type.append(increase);

    const sender_name_value = document.createElement("h3");
    sender_name_value.setAttribute("class", "reciver_name");
    sender_name_value.innerText = `${receiver_name}`;
    transfer_type.append(sender_name_value);

    const sender_num = document.createElement("h5");
    sender_num.setAttribute("class", "reciver_num");
    sender_num.innerHTML = receiver_account_number;
    transfer_type.append(sender_num);

    const reciver_num = document.createElement("span");
    reciver_num.setAttribute("class", "send_account");
    reciver_num.innerHTML = sender_account_number;
    transfer_type.append(reciver_num);

    const amount = document.createElement("div");
    amount.setAttribute("class", "amount");
    send.append(amount);

    const minus = document.createElement("h4");
    minus.setAttribute("class", "minus");
    minus.setAttribute("id", id);
    minus.innerHTML = `&#8377;${function_amount}`;
    amount.append(minus);

    const type_model = document.createElement("img");
    type_model.setAttribute("src", icon);
    type_model.setAttribute("alt", "bank_icon");
    amount.append(type_model);

    const balance_data = document.createElement("div");
    balance_data.setAttribute("class", "balance_data");
    new_container.append(balance_data);

    const date = document.createElement("h3");
    date.setAttribute("class", "date");
    date.setAttribute("id", "date");
    date.innerHTML = function_date;
    balance_data.append(date);

    const balance_span = document.createElement("span");
    balance_span.setAttribute("class", "balance_span");
    balance_span.innerText = "Balance :";
    balance_data.append(balance_span);

    const balance = document.createElement("h3");
    balance.setAttribute("class", "balance_span");
    balance.innerHTML = `&#8377;${function_current_balance}`;
    balance_span.append(balance);
    if (remark.length > 0) {
        const remark_sms = document.createElement("h3");
        remark_sms.setAttribute("class", "remark");
        remark_sms.innerText = `Remarks : ${remark}`;
        new_container.append(remark_sms);
    }

}

document.addEventListener("DOMContentLoaded", function() {
  const search = document.querySelector("#search");
  const history_search = document.querySelectorAll(".history");

  search.addEventListener("keyup", function(event) {
    const value = event.target.value.toLowerCase();
console.log("enter1")
    history_search.forEach(function(historyItem) {
		
		
      const fund_type = historyItem.querySelector(".increase").textContent.toLowerCase();
      const date = historyItem.querySelector(".date").textContent.toLowerCase();
      const receiver_name = historyItem.querySelector(".receiver_name").textContent.toLowerCase();
      const balance = historyItem.querySelector(".balance_span").textContent.toLowerCase();
      const send_money = historyItem.querySelector(".minus").textContent.toLowerCase();
      const send_account = historyItem.querySelector(".send_account").textContent.toLowerCase();
      const account_number = historyItem.querySelector(".receiver_num").textContent.toLowerCase();
      const remarks = historyItem.querySelector(".remark").textContent.toLowerCase();
console.log("enter2")
      const shouldShow = (
        fund_type.includes(value) ||
        date.includes(value) ||
        receiver_name.includes(value) ||
        balance.includes(value) ||
        send_money.includes(value) ||
        account_number.includes(value) ||
        remarks.includes(value) ||
        send_account.includes(value)
      );

      if (shouldShow) {
		  console.log("enter3")
        historyItem.style.display = "block";
      } else {
		  console.log("enter4")
        historyItem.style.display = "none";
      }
    });
  });
});


const filter_div = document.querySelector(".filter");

filter_div.addEventListener("click", () => {
    const filter = document.querySelector(".filter");

    filter.style.display = "none";

    document.querySelector(".select_div").style.display = "block";

});

let select_account;

const result_button = document.querySelector("#result_button");

result_button.addEventListener("click", () => {
    select_account = document.getElementById("from").value.trim();

    if (select_account !== "") {
        search_account();
    } else {
        alert("click dropdown account number");
    }
});

function search_account() {
	
	const selectedAccount = document.querySelector('#selectedAccount').style.display = "block";

    const receiverNum = document.querySelectorAll('.history .send_data .type_fund .transfer_type .reciver_num');

    receiverNum.forEach((e) => {
        if (select_account == e.innerHTML) {

            e.closest('.history').style.display = "block"


        }
        else {
            e.closest('.history').style.display = "none"

        }
    })

    const senderNum = document.querySelectorAll('.history .send_data .type_fund .transfer_type .send_account');

    senderNum.forEach((e) => {
        if (select_account == e.innerHTML) {

            e.closest('.history').style.display = "block"
        }
        else {

            e.closest('.history').style.display = "none"
        }
    })
}

function restart_tab() {
    
            location.reload();
       
}
