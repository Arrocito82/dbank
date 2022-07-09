import { dbank } from "../../declarations/dbank";

document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();
  const sendButton = e.target.querySelector("#submit-btn");
  const outputAmount=document.getElementById("withdrawal-amount");
  const inputAmount=document.getElementById("input-amount");

  sendButton.setAttribute("disabled",true);

  //operations, these are separated if statements,
  // so that the're independent from each other
  if(inputAmount.value.length>0){
    const selectedAmount=parseFloat(inputAmount.value);
    await dbank.topUp(selectedAmount);
  } 
  if(outputAmount.value.length>0){
    const selectedAmount=parseFloat(outputAmount.value);
    await dbank.withdraw(selectedAmount);
  }
  
  //resetting values
  checkBalance();
  inputAmount.value="";
  outputAmount.value="";
  sendButton.removeAttribute("disabled");
});

window.addEventListener("load", function () {
  checkBalance();
});

async function checkBalance() {
  const currentAmount=await dbank.checkBalance();
  // document.getElementById("value").innerText=currentAmount.toFixed(2);
  document.getElementById("value").innerText=Math.round(currentAmount*100)/100;
}