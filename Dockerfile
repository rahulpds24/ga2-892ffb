# Use Python slim base
FROM python:3.11-slim

# Create non-root user with UID 1000
RUN useradd -u 1000 appuser

# Set working directory
WORKDIR /app

# Copy dependencies first
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Set environment variable for app port
ENV APP_PORT=7159

# Expose the port
EXPOSE 7159

# Switch to non-root user
USER appuser

# Run FastAPI app with uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "7159"]
