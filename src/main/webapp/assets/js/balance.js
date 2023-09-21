

const user_acc = document.querySelectorAll(".bank_no"); // no of div
const account_num = document.querySelectorAll(".account_num");

let ref_num;

for (let p = 0; p < user_acc.length; p++) {
  user_acc[p].addEventListener("click", () => {
    document.querySelector(".container1").style.display = "block";

    document.querySelector("footer").style.display = "block";

    document.querySelector("#balance_name").style.display = "none";

    document.querySelector(".bank_list").style.display = "none";

    ref_num = account_num[p].innerHTML;

    check_balance();
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

      localStorage.setItem("bal_enquire", JSON.stringify(balance_enquire));
    }
  }
}

function bar_chart() {
  const xValues = [];
  const yValues = [];
  const barColors = [];

  for (let t = 0; t < balance_enquire.length; t++) {
    if (
      String(balance_enquire[t].email_compare) === String(email) &&
      String(ref_num) === String(balance_enquire[t].ac_no)
    ) {
      const compare_min = Number(balance_enquire[t].minium);

      const arr_obj = balance_enquire[t].monthly_balance;

      for (let i = 0; i < arr_obj.length; i++) {
        const today = Number(arr_obj[i].day_balance);

        if (today >= compare_min) {
          barColors.push(String("#1F8343"));
        } else {
          barColors.push(String("#C43D5A"));
        }

        xValues.push(`Day${i + 1}`);
        yValues.push(today);
      }
    }
  }
  const yvalue_max = Math.max(...yValues);

  // let new_chart = 
  new Chart("myChart", {
    type: "bar",
    data: {
      labels: xValues,
      datasets: [
        {
          backgroundColor: barColors,
          data: yValues,
        },
      ],
    },
    options: {
      scales: {
        yAxes: [
          {
            ticks: {
              beginAtZero: true,
              min: 0,
              max: yvalue_max,
              stepSize: 500,
            },
          },
        ],
      },
      legend: { display: false },
      title: {
        display: true,
        text: "Daily mininum balance tracker",
      },
    },
  });
}