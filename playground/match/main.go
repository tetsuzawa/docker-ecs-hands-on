package main

import (
	"fmt"
	"path/filepath"
)

func main() {
	var matched bool
	matched, _ = filepath.Match("*", "a.txt")
	fmt.Println("filepath.Match(\"*\", \"a.txt\")", matched)

	matched, _ = filepath.Match("*", "sub/a.txt")
	fmt.Println("filepath.Match(\"*\", \"sub/a.txt\")", matched)

	matched, _ = filepath.Match("*", "sub/b.txt")
	fmt.Println("filepath.Match(\"*\", \"sub/b.txt\")", matched)

	matched, _ = filepath.Match("*", "a-lock.txt")
	fmt.Println("filepath.Match(\"*\", \"a-lock.txt\")", matched)

	matched, _ = filepath.Match("a-lock*.txt", "a-lock.txt")
	fmt.Println("filepath.Match(\"a-lock*.txt\", \"a-lock.txt\")", matched)

	matched, _ = filepath.Match("a-lock.txt*", "a-lock.txt")
	fmt.Println("filepath.Match(\"a-lock.txt*\", \"a-lock.txt\")", matched)
}
