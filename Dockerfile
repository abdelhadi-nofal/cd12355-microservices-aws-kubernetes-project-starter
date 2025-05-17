FROM python:3.9-slim
WORKDIR /coworking_app
COPY requirements.txt .
RUN python -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir -r requirements.txt
COPY . .  # Copy all files, not just app.py
EXPOSE 5153
CMD ["/opt/venv/bin/python", "app.py"]
