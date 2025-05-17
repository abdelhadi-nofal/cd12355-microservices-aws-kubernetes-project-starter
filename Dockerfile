# Dockerfile (in repo root)
FROM --platform=linux/amd64 python:3.9-slim
WORKDIR /app
COPY analytics/requirements.txt .  # Copy requirements from analytics/
RUN python -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir -r requirements.txt
COPY analytics/ .                 # Copy all files from analytics/
EXPOSE 5153
CMD ["/opt/venv/bin/python", "app.py"]
