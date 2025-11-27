# Use an official Python runtime as the base image
# Choose the version that matches your project requirements
FROM python:3.13-alpine

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1  # Prevent Python from writing pyc files
ENV PYTHONUNBUFFERED 1          # Prevent Python from buffering stdout and stderr

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file first to leverage Docker cache
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on (adjust as needed)
EXPOSE 8000

# Define the command to run your application
# Adjust based on how you run your app (e.g., Gunicorn, uWSGI, etc.)
CMD ["python", "owa_pot.py"]