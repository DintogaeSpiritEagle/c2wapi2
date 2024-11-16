# Project: C2W API2 Application
# Maintaner: David H Tekwie <yamis.spiriteagle@gmail.com>
# Date: November 2024
# Caution: Speak to maintainer before executing these commands.

# Use Python base image
FROM python:3.10-slim

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev gcc && \
    apt-get clean
RUN ls -l

# Install Python dependencies
COPY requirements.txt .
RUN ls -l
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose the application port
EXPOSE 9000

# Default command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:9000", "c2wapi2.wsgi:application"]
