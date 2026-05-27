

// User Input Variables:
const prompt = require("prompt-sync")();

const numa = Number(prompt("First Number: "));

const numb = Number(prompt("Second Number: "));

const choice = prompt("Choose Action: ");


// Calculator Operation Functions:
const add = (a,b) => {
    return a + b;
};

const subtract = (a,b) => {
    return a - b;
};

const divide = (a,b) => {
    return a / b;
};

const multiply = (a,b) => {
    return a * b;
};

const exponent = (a,b) =>{
    return a ** b;
};

// Express Function:
switch(choice) {
   case "add":
        console.log(add(numa,numb));
        break;

    case "subtract":
        console.log(subtract(numa,numb));

   case "divide":
        console.log(divide(numa,numb));
        break;

    case "multiply":
        console.log(multiply(numa,numb));
        break;

    case "exponent":
        console.log(exponent(numa,numb));
        break;

    default:
        console.log("Invalid Operation");

}