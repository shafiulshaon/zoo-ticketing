# Zoo Ticketing (Ticket Sales Calculator)

## Description

The Ticket Sales Calculator is a Command-Line Interface (CLI) program designed to calculate ticket prices for a zoo, considering various types of discounts and surcharges. It's built in Ruby and follows the MVC design pattern.

## Features

- Calculate ticket prices based on ticket type (Normal or Special), category (Adult, Child, Senior), and quantity.
- Apply discounts and surcharges including group discounts, evening discounts, holiday surcharges, and weekday discounts.
- Determine if the current day is a holiday in Japan (will implement the Google Calendar API later on).
- Output detailed calculation results, including total sales amount, amount before price changes, and breakdown of price changes.

## Installation

Clone the repository to your local machine:

```bash
git clone https://github.com/your-username/ticket_sales_calculator.git
cd ticket_sales_calculator
```
Ensure you have Ruby installed on your system. You can check your Ruby version using:
```bash
ruby -v
````

## Usage

Navigate to the project directory and run:
```bash
ruby main.rb
```

## Structure

The application is organized as follows:

- `models/`: Contains the business logic of the application (Ticket, Discount and Calculator classes).
- `views/`: Manages the presentation of data to the user (Output class).
- `controllers`/: Handles user input and application flow (Input and MainController classes).
- `helpers`/: Utility functions and validations.
- `test/`: Unit tests for the application components.
- `main.rb`: The entry point of the application.

## Testing
To run the unit tests, navigate to the `test/` directory and execute the test files:

```bash
ruby test/test_ticket.rb
ruby test/test_discount.rb
ruby test/test_calculator.rb
```

## Contact Information

- Name: [Shafiul Alam](shafiulshaon@gmail.com)
- Project Link: [GitHub Repository](https://github.com/shafiulshaon/zoo-ticketing)
