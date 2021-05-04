package main

import (
	"log"
	"net/http"
	"os"

	"github.com/google/uuid"
)

func main() {
	uid, _ := uuid.NewRandom()
	log.Println("uuid:", uid)

	mux := http.NewServeMux()
	mux.HandleFunc("/data", func(w http.ResponseWriter, r *http.Request) {
		log.Printf("service1: endpoint=/data, request=%+v\n", r)
		w.Header().Set("Content-Type", "application/json")
		w.Write([]byte("{\"data1\": \"hey hey hey\"}"))
	})

	port := os.Getenv("PORT")
	if port == "" {
		log.Fatalln("failed to get env: PORT")
	}

	log.Printf("service1 listening on port %s\n", port)
	if err := http.ListenAndServe(":"+port, mux); err != nil {
		log.Fatal(err)
	}
}
