package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	mux := http.NewServeMux()
	mux.HandleFunc("/data", func(w http.ResponseWriter, r *http.Request) {
		log.Printf("service1: endpoint=/data, request=%+v\n", r)
		w.Header().Set("Content-Type", "application/json")
		w.Write([]byte("{\"data1\": \"hey hey hey\"}"))
	})

	port := 9001
	addr := fmt.Sprintf(":%d", port)
	log.Println("service1 listening on port %d", port)
	if err := http.ListenAndServe(addr, mux); err != nil {
		log.Fatal(err)
	}
}
