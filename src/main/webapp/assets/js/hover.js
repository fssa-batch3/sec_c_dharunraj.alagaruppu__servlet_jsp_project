const home = document.getElementById("home_nav");
const transfer = document.getElementById("transfer_nav");
const balance = document.getElementById("balance_nav");
const history = document.getElementById("history_nav");
const chart = document.getElementById("chart_nav");

// Get the current URL
let currentURL = window.location.href;

// Use the URL API to extract the pathname (which includes the page name)
let pathname = new URL(currentURL).pathname;

// Extract the page name from the pathname
let parts = pathname.split('/');
let pageName = parts[parts.length - 1];

if(pageName == "home.jsp"){
	
	home.style.borderBottom="2px solid #2a48ee";
}

if(pageName == "transfer.jsp"){
	
	transfer.style.borderBottom="2px solid #2a48ee";
}

if(pageName == "balance.jsp"){
	
	balance.style.borderBottom="2px solid #2a48ee";
}

if(pageName == "history.jsp"){
	
	history.style.borderBottom="2px solid #2a48ee";
}

if(pageName == "chart.jsp"){
	
	chart.style.borderBottom="2px solid #2a48ee";
}

