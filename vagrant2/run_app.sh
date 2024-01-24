#!/bin/bash

cd /opt/app/plan_generator/PlanGeneratorBackend/PlanGenerator
dotnet run "/MySetting:file=/etc/config.yaml"