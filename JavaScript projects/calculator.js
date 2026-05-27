const prompt = require("prompt-sync")();

const numa = Number(prompt("First Number: "));

const numb = Number(prompt("Second Number: "));

const choice = prompt("Choose Action: ");

const add = (a,b) => {
    return a + b;
};

const minus = (a,b) => {
    return a - b;
};

const divide = (a,b) => {
    return a / b;
};

const multiply = (a,b) => {
    return a * b;
};

switch(choice) {
   case "add":
        console.log(add(numa,numb));
        break;

    case "subtract":
        console.log(minus(numa,numb));

   case "divide":
        console.log(divide(numa,numb));
        break;

    case "multiply":
        console.log(multiply(numa,numb));

    default:
        console.log("Invalid Operation");

}