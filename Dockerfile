# Instala dependências essenciais
RUN apt-get update && apt-get install -y python3 make g++

# Instala o n8n
RUN npm install -g n8n

# Instala o Evolution direto do GitHub
RUN npm install https://github.com/GabrielGil44/n8n-nodes-evolution

# Define variáveis de ambiente
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV N8N_HOST=0.0.0.0

EXPOSE 5678
CMD ["n8n"]
