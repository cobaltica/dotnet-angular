FROM mcr.microsoft.com/dotnet/core/sdk:3.0.101

# Update repository
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    touch /etc/apt/sources.list.d/kubernetes.list && \
    echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt update

# Angular cli
RUN apt install nodejs -y && \
    curl -L https://npmjs.org/install.sh | sh && \
    echo n | npm install -g @angular/cli

# Kubernetes and helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh && \
    apt install -y kubectl
