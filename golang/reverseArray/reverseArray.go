package main

import "fmt"

func reverseArray(a []int32) []int32 {
	tmp := make([]int32, len(a))
	size := len(a) - 1
	counter := 0
	for i := size; i >= 0; i-- {
		tmp[i] = a[counter]
		counter++
	}
	return tmp
}

func main() {
	arr1 := []int32{1, 2, 3}

	fmt.Println(reverseArray(arr1))
}
