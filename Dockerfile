FROM mcr.microsoft.com/dotnet/sdk:6.0

RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_16.x |  bash - && \
    apt-get install -y nodejs && \
    npm install -g @angular/cli && \
    npm install -g yarn

RUN apt-get install ssh -y && \
    apt-get install nuget -y && \
    apt-get install lftp -y && \
    apt-get install curl -y && \
    apt-get install git -y 

# Kubernetes and helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh && \
    helm plugin install https://github.com/chartmuseum/helm-push.git && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/    
