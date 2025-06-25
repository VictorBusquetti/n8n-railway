FROM n8nio/n8n:latest

# Instalar dependências para pacotes personalizados (como Python) usando APK (para Alpine Linux)
RUN apk add --no-cache python3 make g++ && rm -rf /var/cache/apk/*

# Permitir a instalação de pacotes personalizados (se necessário)
ENV N8N_DISABLE_PRODUCTION_MAIN_PACKAGE_JSON=false

# Configurações do Redis (as variáveis serão puxadas do Railway)
ENV N8N_REDIS_HOST=$N8N_REDIS_HOST
ENV N8N_REDIS_PORT=$N8N_REDIS_PORT
ENV N8N_REDIS_PASSWORD=$N8N_REDIS_PASSWORD
ENV N8N_REDIS_DB=$N8N_REDIS_DB

# Configurações de porta e host do n8n
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV N8N_HOST=0.0.0.0
EXPOSE 5678

# Comando para iniciar o n8n
CMD ["n8n", "start"]
