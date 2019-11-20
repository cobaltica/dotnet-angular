FROM mcr.microsoft.com/dotnet/core/sdk:3.0

RUN apt-get update && \
    apt-get install npm -y && \
    npm install -g npm && \
    npm install -g @angular/cli