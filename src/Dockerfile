FROM python:3.10

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY requirements/requirements.txt /app/requirements.txt

RUN mkdir tmp_downloads && \
    curl -o tmp_downloads/allure_2.23.0-1_all.deb \
    -Ls https://github.com/allure-framework/allure2/releases/download/2.23.0/allure_2.23.0-1_all.deb && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    git python3-dev build-essential default-jre && \
    dpkg -i tmp_downloads/allure_2.23.0-1_all.deb && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf tmp_downloads

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload", "--proxy-headers"]