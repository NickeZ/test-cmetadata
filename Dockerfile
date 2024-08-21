FROM ubuntu:22.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
    curl \
    build-essential \
    && rm -r /var/lib/apt/lists/*

ENV RUSTUP_HOME=/opt/rustup
ENV PATH=/opt/cargo/bin:$PATH
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | CARGO_HOME=/opt/cargo sh -s -- --default-toolchain=beta -y
RUN rustup target add thumbv7em-none-eabi

COPY . .
