# 1. Mudamos para o Python 3.12 que é compatível com suas bibliotecas
FROM python:3.12-slim

# 2. Define a pasta de trabalho
WORKDIR /app

# 3. Ajuste da sintaxe ENV (usando '=' para evitar avisos)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 4. Instala dependências do sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libc-dev \
    && rm -rf /var/lib/apt/lists/*

# 5. Copia e instala as dependências
COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# 6. Copia o restante do projeto
COPY . /app/

# 7. Expõe a porta
EXPOSE 8000

# 8. Comando para rodar
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]