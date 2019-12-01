#!/bin/sh
echo "Build image"
docker build --rm -f "Dockerfile" -t cobaltica/dotnet-sdk-angular:3.0 .
echo "Tag image"
docker tag cobaltica/dotnet-sdk-angular:3.0 cobaltica/dotnet-sdk-angular:latest
echo "Publish"
docker push cobaltica/dotnet-sdk-angular:3.0
docker push cobaltica/dotnet-sdk-angular:latest