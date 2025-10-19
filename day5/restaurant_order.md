# Restaurant Billing Script

This Bash script simulates a simple restaurant billing system. It reads a menu from a file, allows a customer to place an order, validates the input, and calculates the total cost.

## Features
- Displays a menu from `menu.txt` with item names and prices.
- Accepts the customer's name and order interactively.
- Validates item numbers and quantities.
- Calculates the total price of the order.
- Displays a personalized thank-you message with the total amount.

## Usage
1. Create a `menu.txt` file in the same directory as the script.  
   Each line should contain an item and its price, separated by a comma, for example:
   ```text
   Burger,10
   Fries,5
   Soda,3
   ```

2. Run the script:
   ```bash
   ./restaurant_order.sh
   ```

3. Example interaction:
   ```bash
   ----- Menu -----
   1. Burger - $10
   2. Fries - $5
   3. Soda - $3
   Please enter your name: Denis
   Please enter the item number and quantity (e.g., 1 2 for two Burgers): 1 2 3 1
   Thank you, Denis! Your total bill is $23.
   ```

## Notes
- The script uses `sed` and `cut` to extract prices from the menu file.
- Input validation ensures both item number and quantity are numeric.

