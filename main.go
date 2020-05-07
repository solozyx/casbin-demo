package main

import (
	"flag"
	"fmt"

	"casbindemo/config"
	"casbindemo/logger"
	"casbindemo/model"
	"casbindemo/route"
)

func main() {
	flag.Parse()

	config.Setup()
	logger.Setup()
	model.Setup()
	r := route.Setup()

	panic(r.Run(fmt.Sprintf("%s:%d", config.ApplicationConfig.Host, config.ApplicationConfig.Port)))
}
