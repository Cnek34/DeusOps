FROM alpine:latest
RUN apk add --no-cache python3 py3-pip

WORKDIR /app

RUN apk add --no-cache \
    gcc \
    musl-dev \
    python3-dev \
    libffi-dev \
    openssl-dev \
    make \
    postgresql-dev \
    && pip3 install --upgrade pip --break-system-packages

COPY requirements.txt ./requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt --break-system-packages

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

COPY . .

EXPOSE 5000

CMD ["./entrypoint.sh"]