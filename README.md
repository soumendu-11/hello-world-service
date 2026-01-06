# Hello World Service with Docker and GitHub Actions

This project demonstrates a simple "Hello World" Python service that is containerized with Docker and managed via GitHub Actions.

## Project Structure

- `hello.py`: The Python script that prints "Hello World".
- `Dockerfile`: Configuration for containerizing the script.
- `.github/workflows/main.yml`: GitHub Actions workflow for automated triggers.
- `.env`: (Local only) Stores environment variables and credentials.

## Setup

1. **Local Environment**:
   - Ensure Docker is installed.
   - Create a `.env` file with your credentials (see template).

2. **GitHub Secrets**:
   To enable the GitHub Actions workflow to run successfully with AWS, add the following secrets to your GitHub repository:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_SESSION_TOKEN` (Optional, if using temporary credentials)

## Triggers

The service is triggered in three ways:
1. **Push**: Automatically runs when changes are pushed to the `main` branch.
2. **Schedule**: Runs daily at midnight (UTC).
3. **On-Demand**: Can be manually triggered from the GitHub Actions tab.

## Running Locally

To build and run the service locally:

```bash
docker build -t hello-world-service .
docker run hello-world-service
```
# hello-world-service
