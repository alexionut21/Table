
function calcalcIt(){

var weight = document.calc.weight.value
var height = document.calc.cm.value
var inches = document.calc.inches.value
var feet = document.calc.feet.value
if(weight > 0 && height > 0){	
var finalBmi = weight/(height/100*height/100)
document.getElementById("answer").innerHTML = Math.round(finalBmi);
if(finalBmi < 18.5){
document.getElementById("lose").innerHTML = "That you are too thin."
}
if(finalBmi > 18.5 && finalBmi < 25){
document.getElementById("lose").innerHTML = "That you are healthy."
}
if(finalBmi > 25){
document.getElementById("lose").innerHTML = "That you have overweight."
}
document.getElementById("printArea").style.display="block";
}
else if(weight > 0 && (feet > 0 || inches > 0)){	
var d=parseInt(feet*12)+parseInt(inches);
var finalBmi = (weight/(d*d))*703
document.getElementById("answer").innerHTML = Math.round(finalBmi);
if(finalBmi < 18.5){
document.getElementById("lose").innerHTML = "That you are too thin."
}
if(finalBmi > 18.5 && finalBmi < 25){
document.getElementById("lose").innerHTML = "That you are healthy."
}
if(finalBmi > 25){
document.getElementById("lose").innerHTML = "That you have overweight."
}
document.getElementById("printArea").style.display="block";
}
else{
alert("Please Fill in everything correctly")
}
	
}
