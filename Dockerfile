# Instalar dependências
RUN apt-get update && apt-get install -y python3 make g++

# Instalar n8n
RUN npm install -g n8n

# Habilitar instalação de pacotes customizados
ENV N8N_DISABLE_PRODUCTION_MAIN_PACKAGE_JSON=false

# Variáveis de ambiente
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV N8N_HOST=0.0.0.0

EXPOSE 5678
CMD ["n8n"]
