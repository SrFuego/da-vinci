# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/engine/reference/builder/

FROM python:3.10-bookworm as base

ARG WORK_DIR="/daVinci"
ARG REQUIREMENTS_FILE="20240214.develop"

# Prevents Python from writing pyc files.
ENV PYTHONDONTWRITEBYTECODE=1

# Keeps Python from buffering stdout and stderr to avoid situations where
# the application crashes without emitting any logs due to buffering.
ENV PYTHONUNBUFFERED=1

WORKDIR ${WORK_DIR}

# Create a non-privileged user that the app will run under.
# See https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#user
ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser

# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.cache/pip to speed up subsequent builds.
# Leverage a bind mount to requirements.txt to avoid having to copy them into
# into this layer.
# RUN --mount=type=cache,target=/root/.cache/pip \
#     --mount=type=bind,source=requirements/${REQUIREMENTS_FILE},target=requirements/${REQUIREMENTS_FILE} \
#     mkdir tmp_downloads && \
#     curl -o tmp_downloads/allure_2.23.0-1_all.deb \
#     -Ls https://github.com/allure-framework/allure2/releases/download/2.23.0/allure_2.23.0-1_all.deb && \
#     apt-get update && \
#     apt-get install -y --no-install-recommends \
#     git python3-dev build-essential default-jre && \
#     dpkg -i tmp_downloads/allure_2.23.0-1_all.deb && \
#     pip install --upgrade pip && \
#     pip install --no-cache-dir -r ${WORK_DIR}/requirements/${REQUIREMENTS_FILE} && \
#     apt-get autoremove -y && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/* && \
#     rm -rf tmp_downloads

COPY api/requirements/${REQUIREMENTS_FILE} ${REQUIREMENTS_FILE}

RUN mkdir tmp_downloads && \
    curl -o tmp_downloads/allure_2.23.0-1_all.deb \
    -Ls https://github.com/allure-framework/allure2/releases/download/2.23.0/allure_2.23.0-1_all.deb && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    git python3-dev build-essential default-jre && \
    dpkg -i tmp_downloads/allure_2.23.0-1_all.deb && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r ${REQUIREMENTS_FILE} && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf tmp_downloads

# Switch to the non-privileged user to run the application.
USER appuser

COPY . .

EXPOSE 8000

EXPOSE 8050

RUN chmod +x scripts/entrypoint.sh

ENTRYPOINT ["sh", "scripts/entrypoint.sh"]