import os
import logging

# Set up logging
log_file_path = "/app/logs/calculator.log"
os.makedirs(
    os.path.dirname(log_file_path), exist_ok=True
)  # Create logs directory if it doesn't exist
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
    handlers=[
        logging.FileHandler(log_file_path),
        logging.StreamHandler(),  # This will output to the console as well
    ],
)


def add(x, y):
    return x + y


def subtract(x, y):
    return x - y


def multiply(x, y):
    return x * y


def divide(x, y):
    if y == 0:
        logging.error("Error! Division by zero.")
        return "Error! Division by zero."
    return x / y


def simple_calculator():
    logging.info("Welcome to the Simple Calculator!")
    logging.info("Select operation:")
    logging.info("1. Add")
    logging.info("2. Subtract")
    logging.info("3. Multiply")
    logging.info("4. Divide")

    while True:
        choice = input("Enter choice (1/2/3/4): ")

        if choice in ["1", "2", "3", "4"]:
            num1 = float(input("Enter first number: "))
            num2 = float(input("Enter second number: "))

            if choice == "1":
                result = add(num1, num2)
                logging.info(f"{num1} + {num2} = {result}")
            elif choice == "2":
                result = subtract(num1, num2)
                logging.info(f"{num1} - {num2} = {result}")
            elif choice == "3":
                result = multiply(num1, num2)
                logging.info(f"{num1} * {num2} = {result}")
            elif choice == "4":
                result = divide(num1, num2)
                logging.info(f"{num1} / {num2} = {result}")

            next_calculation = input(
                "Do you want to perform another calculation? (yes/no): "
            )
            if next_calculation.lower() != "yes":
                break
        else:
            logging.warning("Invalid Input")

    logging.info("Thank you for using the Simple Calculator!")


def advanced_calculator():
    logging.info("Advanced calculator is not implemented yet.")


if __name__ == "__main__":
    calc_mode = os.getenv("CALC_MODE", "simple")
    if calc_mode == "simple":
        simple_calculator()
    else:
        advanced_calculator()
