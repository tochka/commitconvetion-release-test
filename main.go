package main

import "fmt"

var (
	Version string
	Build   string
)

func main() {
	fmt.Println("Version: ", Version, " Build: ", Build)
	fmt.Println("Hello!")
}
