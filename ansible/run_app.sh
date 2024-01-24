#!/bin/bash

cd /opt/app/PlanGeneratorBackend/PlanGenerator
dotnet run "/MySetting:file=/etc/config.yaml"