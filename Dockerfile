# analytics/Dockerfile
# Base image for x86_64 compatibility (CodeBuild uses Amazon Linux 2)
FROM --platform=linux/amd64 python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements.txt first to leverage Docker layer caching
COPY requirements.txt .

# Create virtual environment (for cleaner dependency management)
RUN python -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose application port
EXPOSE 5153

# Use virtual environment interpreter for final command
CMD ["/opt/venv/bin/python", "app.py"]
