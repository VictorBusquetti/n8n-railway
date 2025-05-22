# Base Node.js
FROM node:18

# Diretório de trabalho
WORKDIR /app

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y python3 make g++

# Instalar n8n globalmente
RUN npm install -g n8n

# Copiar arquivos do projeto (se tiver scripts personalizados)
COPY . .

# Variáveis de ambiente básicas
ENV N8N_DISABLE_PRODUCTION_MAIN_PACKAGE_JSON=false
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV N8N_HOST=0.0.0.0

# Expõe a porta padrão do n8n
EXPOSE 5678

# Iniciar o n8n
CMD ["n8n"]
