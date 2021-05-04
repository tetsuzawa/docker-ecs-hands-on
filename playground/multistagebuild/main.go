package main

import (
	"fmt"

	"github.com/google/uuid"
	// 依存ライブラリがたくさんある想定
)

func main() {
	uid, _ := uuid.NewRandom()
	fmt.Println(uid.String())
}
