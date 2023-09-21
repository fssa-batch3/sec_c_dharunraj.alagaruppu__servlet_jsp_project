const url = "http://localhost:8080/netbliz-web/History";
	   axios.get(url)
	   .then(function (response) {
	// handle success
	    console.log(response.data);
	   view_history(response.data);
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

	  
	  function view_history(ele){
		  
		  ele.forEach((e)=>{
		  
		  if(e.transStatus==="debited"){
			  
			   function_image = "https://iili.io/JHYPQRt.png"; // bank image
               type = "Sent to";
               receiver_name =e.remittanceName;
               
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
		  
		  else if(e.transStatus==="credited"){
			  
			   function_image = "https://iili.io/JHYPQRt.png";
			   type = "Received from";
               receiver_name =e.remittanceName;
               
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
  minus.innerHTML =`&#8377;${function_amount}`;
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
if(remark.length > 0){
	const remark_sms = document.createElement("h3");
  remark_sms.setAttribute("class", "remark");
  remark_sms.innerText = `Remarks : ${remark}`;
  new_container.append(remark_sms);
}
  
}

const search = document.querySelector("#search");

const history_search = document.getElementsByClassName("history");
console.log(history_search);
search.addEventListener("input", (key) => {
  const values = key.target.value.toLowerCase();

  for (let i = 0; i < history_search.length; i++) {
	  console.log(2);
    const fund_type = history_search[i]
      .querySelector(".increase")
      .innerHTML.toLowerCase();

    const date = history_search[i]
      .querySelector(".date")
      .innerHTML.toLowerCase();

    const reciver_name_search = history_search[i]
      .querySelector(".reciver_name")
      .innerHTML.toLowerCase();

    const balance = history_search[i]
      .querySelector(".balance_span")
      .innerHTML.toLowerCase();

    const send_money = history_search[i]
      .querySelector(".minus")
      .innerHTML.toLowerCase();

    const send_account = history_search[i]
      .querySelector(".send_account")
      .innerHTML.toLowerCase();

    const account_number_search = history_search[i]
      .querySelector(".reciver_num")
      .innerHTML.toLowerCase();
console.log(history_search[i]
      .querySelector(".remark")
      .innerText.toLowerCase());
    const remarks = history_search[i]
      .querySelector(".remark")
      .innerText.toLowerCase();

    if (
      fund_type.includes(values) ||
      date.includes(values) ||
      reciver_name_search.includes(values) ||
      balance.includes(values) ||
      send_money.includes(values) ||
      account_number_search.includes(values) ||
      remarks.includes(values) ||
      account_number.includes(values) ||
      send_account.includes(values)
    ) {
      history_search[i].style.display = "block";
    } else {
      history_search[i].style.display = "none";
    }
  }
});

let select_account;

const filter_div = document.querySelector(".filter");

filter_div.addEventListener("click", () => {
  const filter = document.querySelector(".filter");

  filter.style.display = "none";

  document.querySelector(".select_div").style.display = "block";
});

const result_button = document.querySelector("button");

result_button.addEventListener("click", () => {
  select_account = document.getElementById("from").value.trim();

  if (select_account !== "") {
    search_account();
  } else {
    alert("click dropdown account number");
  }
});

function search_account(){
	 alert("Under progress");
}