package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

var reader = bufio.NewReader(os.Stdin)

func getUserInput() float64 {
	fmt.Print("Enter value: ")
	input, _ := reader.ReadString('\n')
	value, err := strconv.ParseFloat(strings.TrimSpace(input), 64)
	if err != nil {
		message := fmt.Sprintf("%v must be a number", input)
		panic(message)
	}
	return value
}

func getMathOperation() string {
	fmt.Print("Select an operation [+, -, *, /] ")
	input, _ := reader.ReadString('\n')
	operation := strings.TrimSpace(input)

	return operation
}

func addition(val1, val2 float64) float64 {
	return val1 + val2
}
func subtraction(val1, val2 float64) float64 {
	return val1 - val2
}
func multiplication(val1, val2 float64) float64 {
	return val1 * val2
}
func division(val1, val2 float64) float64 {
	return val1 / val2
}

func calculateOperation(val1 float64, val2 float64, operand string) float64 {
	var res float64
	switch operand {
	case "+":
		res = addition(val1, val2)
	case "-":
		res = subtraction(val1, val2)
	case "*":
		res = multiplication(val1, val2)
	case "/":
		res = division(val1, val2)
	default:
		message := fmt.Sprintf("%v is not a valid operation", operand)
		panic(message)
	}

	return res
}

func main() {
	fmt.Println("Calculator app in GO!")

	var val1 float64
	var val2 float64
	var operand string

	val1 = getUserInput()
	val2 = getUserInput()
	operand = getMathOperation()
	result := calculateOperation(val1, val2, operand)

	fmt.Printf("\n%v %v %v = %.2f\n", val1, operand, val2, result)
}
