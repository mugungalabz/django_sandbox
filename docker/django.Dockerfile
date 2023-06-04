# Use the official Python base image
FROM python:3.11

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /code

COPY requirements.txt ./
COPY /docker/docker_django_startup.sh /

# Install project dependencies
RUN pip install -r requirements.txt

# Copy the project code to the working directory
COPY . ./


# Expose the port that the Django development server will run on
EXPOSE 8000

# Set the entry point for the container
ENTRYPOINT ["/docker_django_startup.sh"]
