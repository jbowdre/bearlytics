FROM python:3-slim
RUN groupadd -g 1000 bear && \
  useradd -u 1000 -g 1000 -m -s /bin/bash bear && \
  mkdir -p /app/data && \
  chown -R bear:bear /app
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN chmod +x entrypoint.sh run.sh
RUN mkdir -p /app/data
EXPOSE 8000
HEALTHCHECK --interval=60s --timeout=30s --start-period=15s --retries=3 CMD curl -f http://localhost:8000/healthcheck || exit 1
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/app/run.sh"]
