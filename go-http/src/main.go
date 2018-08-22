package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"stringservice"
)

func getPort() string {
	envPort := os.Getenv("PORT")
	if len(envPort) > 0 {
		return fmt.Sprintf(":%s", envPort)
	}

	return ":8080"
}

func main() {
	svc := stringservice.CreateService()

	http.Handle("/count", stringservice.GetCountHandler(svc))
	http.Handle("/uppercase", stringservice.GetUppercaseHandler(svc))

	port := getPort()

	fmt.Printf("Listening on port %s\n", port)
	log.Fatal(http.ListenAndServe(port, nil))
}
