package main

import (
	"fmt"
	"os"
)

func main()  {
	fmt.Println("hello", os.Getenv("nama"))
}