package main

import (
	"casbindemo/config"
	"casbindemo/logger"
	"casbindemo/model"
	"casbindemo/route"
	"flag"
	"fmt"
	"github.com/sirupsen/logrus"
)

func main() {
	logrus.SetLevel(logrus.DebugLevel)
	logrus.SetFormatter(&logrus.JSONFormatter{})

	flag.Parse()

	config.Setup()
	logger.Setup()
	model.Setup()
	r := route.Setup()

	panic(r.Run(fmt.Sprintf("%s:%d", config.ApplicationConfig.Host, config.ApplicationConfig.Port)))
}
