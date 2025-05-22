FROM node:18

# Instala dependências essenciais
RUN apt-get update && apt-get install -y python3 make g++

# Instala n8n globalmente
RUN npm install -g n8n

# Define variáveis de ambiente
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV N8N_HOST=0.0.0.0

# Expõe a porta usada pelo n8n
EXPOSE 5678

# Comando de inicialização
CMD ["n8n"]
