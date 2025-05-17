# Dockerfile
FROM --platform=linux/amd64 python:3.9-slim
WORKDIR /app
COPY requirements.txt .  # requirements.txt is in root
RUN python -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir -r requirements.txt
COPY app.py .  # app.py is also in root
EXPOSE 5153
CMD ["/opt/venv/bin/python", "app.py"]
