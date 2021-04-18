FROM alpine:latest

# globals settings
ARG NODE_NAME=optiplexican_alpine-0x
ARG NODE_SUBNET=public-beta
ARG YA_ACCOUNT=0x61fef7c3aac235b029cec0accde2a3848b7b904c

# hardware settings
ARG NODE_CPU_THREADS=4
ARG NODE_MEM_GIB=4
ARG NODE_STORAGE_GIB=24

# presets settings
ARG NODE_COSTS_START=0.0
ARG NODE_COSTS_HOUR=0.2
ARG NODE_COSTS_CPU_HOUR=0.1


# Prepping the environment
COPY ya-provider/ $HOME/ya-provider/


# Installing curl and fetching current release of golem
RUN apk update \
 && apk add curl \
 && curl -sSf https://join.golem.network/as-provider
ENV PATH=".local/bin:$PATH"

COPY $HOME/ya-provider/ .local/share/ya-provider/

CMD ["golemsp", "run"]
