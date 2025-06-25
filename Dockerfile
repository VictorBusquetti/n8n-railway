FROM n8nio/n8n:latest

# Mudar temporariamente para o usuário root para instalar as dependências
USER root
# Instalar dependências para pacotes personalizados (como Python) usando APK (para Alpine Linux)
RUN apk add --no-cache python3 make g++ && rm -rf /var/cache/apk/*
# Voltar para o usuário padrão (geralmente 'node' ou 'n8n' na imagem oficial)
# A imagem n8nio/n8n já define seu usuário padrão, então basta remover a linha USER root e o próximo comando RUN será executado com o usuário padrão da imagem.
# No entanto, para fins de clareza e caso a imagem mude, é bom ser explícito.
# Vamos assumir que a imagem n8nio/n8n usa o usuário 'node' para suas operações.

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

# Comando para iniciar o n8n (será executado com o usuário padrão da imagem n8n)
CMD ["n8n", "start"]
