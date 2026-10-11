FROM ghcr.io/hostinger/hvps-hermes-agent:latest
LABEL org.opencontainers.image.source="https://github.com/mik3lov3st3ch/hermes-agent-ask"

USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-venv python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/hermes-python \
    && /opt/hermes-python/bin/pip install --no-cache-dir \
       reportlab matplotlib pymupdf

ENV PATH="/opt/hermes-python/bin:${PATH}"
ENV MPLCONFIGDIR=/tmp/matplotlib