FROM alpine:latest
WORKDIR /
ARG YA_PAYMENT_NETWORK=mainnet
ARG NODE_SUBNET=public-beta

# node settings
ARG NODE_NAME=optiplexican_alpine-0x
ARG YA_ACCOUNT=0x61fef7c3aac235b029cec0accde2a3848b7b904c
ARG NODE_CPU_THREADS=4
ARG NODE_MEM_GIB=6
ARG NODE_STORAGE_GIB=64
ARG NODE_COSTS_START=0.0
ARG NODE_COSTS_HOUR=0.02
ARG NODE_COSTS_CPU_HOUR=0.1

# run settings
ARG NICENESS=15

# Installing curl and fetching current release of golem
RUN apk update \
 && apk add curl \
 && curl -sSf https://join.golem.network/as-provider | ash -
ENV PATH="$HOME/.local/bin:$PATH"


