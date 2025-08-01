package main

import (
	"fmt"
	"log"
	"github.com/Vladislav-090/tendermint-validator-monitor/internal/db"
)

func main() {
	if err := db.InitPostgress(); err !=nil {
		log.Fatalf("Failed to connect to DV: %v", err)
	}
	fmt.Println("Connected to PostgreSQL succsessfuly!")
}