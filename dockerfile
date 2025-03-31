FROM golang:latest

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    tree \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \
    grep -Po '"tag_name": *"v\K[^"]*') && \
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
    tar xf lazygit.tar.gz lazygit && \
    install lazygit -D -t /usr/local/bin/ && \
    rm lazygit.tar.gz

RUN bash -c "$(curl -sLo- https://superfile.netlify.app/install.sh)"

RUN git clone /* git url */

RUN cd ./[RepositoryName] && go mod tidy

CMD ["bash"]
