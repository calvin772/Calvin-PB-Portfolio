
// Variables: 
const username = "Calvin"; //pernament variable
let age = 23; //can change later

console.log(age)
console.log(username);

// Asynchronous Behavior & Timing Responses:
console.log("start");

setTimeout(() =>{
    console.log("waiting 2 seconds");
}, 2000); //1 second = 1000(ie: 2000 for 2 seconds)

console.log("end");

// Arrow Functions:
const add = (a,b) => {
    return a + b;
};

console.log(add(5,22))