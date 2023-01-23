FROM alpine:latest AS builder
ARG VERSION=master

RUN apk --no-cache add \
    autoconf \
    automake \
    build-base \
    cmake \
    ninja \
    coreutils \
    curl \
    gettext-tiny-dev \
    git \
    libtool \
    pkgconf \
    unzip && \
    git clone https://github.com/neovim/neovim.git

RUN cd neovim && git checkout ${VERSION} && \
    make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/nvim-build install

FROM alpine:latest AS base

RUN apk --no-cache add fzf \
    libgcc \
    git \
    build-base \
    nodejs \
    npm \
    ripgrep \
    tree-sitter \
    tree-sitter-cli \
    wget \
    make \
    cmake \
    fd \
    && mkdir -p /root/.config/nvim

COPY --from=builder /nvim-build /usr/local
COPY init.lua /root/.config/nvim/
COPY lua /root/.config/nvim/lua

WORKDIR /root/
