FROM python:3.14-slim

WORKDIR /app
RUN pip install --no-cache-dir uv

COPY . .
RUN uv sync

RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*

EXPOSE 8501
ENV PORT 8501
HEALTHCHECK CMD curl --fail http://localhost:${PORT}/_stcore/health || exit 1

CMD ["sh", "-c", "streamlit run main.py --server.port=${PORT} --server.address=0.0.0.0"]
