#!/bin/bash

rm -rf /app/onlyoffice/data/certs
mkdir -p /app/onlyoffice/data/certs
cp testcerts/* /app/onlyoffice/data/certs/
