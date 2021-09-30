//tostring its return string value 
var x=100;
console.log(x.toString())
console.log('type is '+typeof(x.toString()))

//Exponential returns string with rounded value 

var y=122.342323;
console.log('Result is '+ y.toExponential(2))

//tofixed method is return string with sepcified number of decimals 
//its maily use with money 

console.log('Tofixed example Result is '+ y.toFixed(2))

//toprecision returns string with specified length
var num=1.567;
console.log( 'To precision example Result is '+ num.toPrecision(1))

//valueof method return number as a number
var num1=6755;
console.log(num1.valueOf());
console.log(typeof(num1.valueOf()));