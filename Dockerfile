FROM oven/bun:latest

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends unzip && rm -rf /var/lib/apt/lists/*

COPY . .

RUN bun upgrade --canary
RUN bun --revision
RUN bun install --frozen-lockfile
RUN bun run --filter=@fullstack-template/api build

EXPOSE 3001

CMD ["bun", "run", "--filter=@fullstack-template/api", "start"]
