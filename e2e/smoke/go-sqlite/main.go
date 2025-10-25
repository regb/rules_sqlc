package main

import (
	"fmt"
    "github.com/regb/rules_sqlc/e2e/smoke/go-sqlite/db"
)

func main() {
	author := db.Author{Name: "regb"}

	fmt.Printf("Hello %v", author)
}
