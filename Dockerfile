# Dockerfile
FROM --platform=linux/amd64 python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN python -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir -r requirements.txt
COPY analytics/ .
EXPOSE 5153
CMD ["/opt/venv/bin/python", "app.py"]
