/**
 * 
 */

 const user_acc = document.querySelectorAll(".bank_no"); // no of div
const account_num = document.querySelectorAll(".account_num");

let ref_num;
// account_num
for (let p = 0; p < user_acc.length; p++) {
  user_acc[p].addEventListener("click", () => {
    document.querySelector(".container1").style.display = "block";

    document.querySelector("footer").style.display = "block";

    document.querySelector("#balance_name").style.display = "none";

    document.querySelector(".bank_list").style.display = "none";

    ref_num = account_num[p].innerHTML;

    check_balance();

    bar_chart();
  });
}

let customer_balance;
let customer_number;
let customer_type;

function check_balance() {
  for (let t = 0; t < balance_enquire.length; t++) {
    if (
      String(balance_enquire[t].email_compare) === String(email) &&
      String(ref_num) === String(balance_enquire[t].ac_no)
    ) {
      customer_balance = balance_enquire[t].ac_balance;

      customer_number = balance_enquire[t].ac_no;

      customer_type = balance_enquire[t].ac_type;

      document.getElementById("balance").innerText = ` ${customer_balance}`;
      document.getElementById("customer_ac").innerHTML = customer_number;
      document.getElementById("ac_type").innerText = customer_type;

    }
  }
}