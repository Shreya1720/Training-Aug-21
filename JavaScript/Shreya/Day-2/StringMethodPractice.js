var name1="Shreya";
 console.log(name1)
//add double quatoes in string 
 var text="\"Shreya\""
 console.log(text)
 var text1 = "It\'s alright"
 console.log(text1)
 console.log(text1.length)

 //extracting part of string by using slice , substring , substr method 

 //slice extracts a part of string and return a value as a new string (count position from zero )

 var str="Shreya thakkar"
 console.log(str.slice(7,14))

//slice operation using negative value (it will start from end of the string )
console.log(str.slice(-6,-2))

//if we dont give second parameter then method will slice out the rest of the thing 
console.log(str.slice(4))

//substring cannot accept negative position 

var str1="java learning from javatpoint"
console.log(str1.substring(5,13))

//substr is same as slice but second parameter is length of that string 
console.log(str1.substr(0,13))

console.log(str1.substr(-12))

//replace is use to replace the value with another string 
//it returns the new string 
console.log(str1.replace("java","javascript"))

//uppercase
console.log(str.toUpperCase())

console.log(str.toLowerCase())

console.log(str.concat(str1))

var trim = "   shreya   "
console.log(trim.trim())


