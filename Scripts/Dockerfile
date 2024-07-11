FROM ubuntu:latest

# Instalar utilitários necessários
RUN apt-get update && apt-get install -y \
    bsdmainutils \
    util-linux \
    && rm -rf /var/lib/apt/lists/*

# Definir o diretório de trabalho
WORKDIR /workspace

# Iniciar com bash
CMD ["bash"]
