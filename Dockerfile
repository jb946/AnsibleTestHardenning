FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y iputils-ping iproute2 && \
    apt-get install -y --no-install-recommends ansible ssh python3-pip && \
    pip3 install jmespath && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Installer les modules Python nécessaires
RUN pip3 install jmespath

# Créer le répertoire de travail
WORKDIR /app

# Copier les fichiers du projet
COPY playbooks /app/playbooks
COPY reports /app/reports
COPY inventory /app/inventory
COPY entrypoint.sh /app/entrypoint.sh

# Donner les permissions d'exécution au script d'entrée
RUN chmod +x /app/entrypoint.sh

# Définir le point d'entrée
ENTRYPOINT ["/app/entrypoint.sh"]
