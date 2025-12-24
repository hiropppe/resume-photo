FROM ghcr.io/astral-sh/uv:0.9.2-python3.12-bookworm-slim

WORKDIR /app
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen

COPY . .

CMD ["uv", "run", "jupyter", "lab", "--allow-root", "--ip=0.0.0.0", "--ServerApp.token=''", "--no-browser"]
