package main

import (
	"os"

	"github.com/kubeshop/testkube-executor-example/pkg/runner"
	"github.com/kubeshop/testkube/pkg/executor/agent"
)

func main() {
	agent.Run(runner.NewRunner(), os.Args)
}
