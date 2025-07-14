#!/bin/bash
docker build -t devsecops-app ./app
./trivy image devsecops-app
