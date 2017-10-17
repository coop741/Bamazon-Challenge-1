const mysql = require('mysql');
const inquirer = require('inquirer');

// Specify the port.
var port = process.env.PORT || 3000;

var connection = mysql.createConnection({
	host: "localhost",
	user: "root",
	password: "",
	database: "bamazon"
});

// Initiate MySQL Connection.
connection.connect(function(err) {
	if (err) {
		console.error("error connecting: " + err.stack);
		return;
	}
	console.log("connected as id " + connection.threadId);
});

showInventory();
setTimeout(function(){run()}, 1000);

// Start Program
function run(){
	inquirer.prompt([
	{
		name: "itemSelection",
		message: "Please Select An Item to Purchase",
		type: "list",
		choices: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
	},
	{
		name: "quantity",
		message: "How many would you like? [Enter a number]",
		type: "input"
	}
	]).then(function(choice){
		if (typeof(parseInt(choice.quantity)) === 'number' && parseInt(choice.quantity) > 0){
			let custChoice = parseInt(choice.itemSelection);
			let custQty = parseInt(choice.quantity);
			inventoryCheck(custChoice, custQty);
		}
		else {
			console.log('You have not entered a quantifiable value for how many items you want. Please begin again. Thank you!');
			run();
		};
	});
}

// Display inventory to user
function showInventory() {
	var query = connection.query("SELECT * FROM products", function(err, res) {
		for (var i = 0; i < res.length; i++) {
			console.log('- + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + -');
			console.log(res[i].item_id + " | " + res[i].product_name + " | " + res[i].department_name + " | $" + res[i].price+ " each | " + res[i].stock_quantity +' units in stock');
			console.log('+ - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - +');
		};
	});
}

// Check if there is enough stock to fulfill user oder
function inventoryCheck(customerChoice, customerQuantity){
	var query = connection.query("SELECT stock_quantity, price, product_name FROM products WHERE item_id=?",[customerChoice], function(err, res) {
		if(err) throw err;
		let presentStock = res[0].stock_quantity;
		let price = res[0].price;
		let name = res[0].product_name;
		if(presentStock >= customerQuantity){
			presentStock -= customerQuantity;
			updateQuantity(customerChoice, customerQuantity, presentStock, price, name);
		}
		else{
			console.log('Insufficient quantity! There is not enough inventory to perform your purchase!')
			connection.end();
		}
	});	
}

// Update MySQL database to reflect valid purchase
function updateQuantity(choice, customerQuantity, stock, price, name) {
	console.log("Calculating Purchase...\n");
	var query = connection.query(
		"UPDATE products SET ? WHERE ?",
		[{
			stock_quantity: stock
		},
		{
			item_id: choice
		}],
		function(err, res) {
			if(err) throw (err);
			let total = customerQuantity * price;
			console.log("You bought: " + name);
			console.log('Your total purchase cost: $' + total + ' Dollars');
			console.log('Thank you for your patronage!!');
			console.log('We look forward to your next visit!');
			connection.end();
		}
	);
}