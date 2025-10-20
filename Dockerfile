FROM node:18 AS builder
WORKDIR /app
COPY app/package*.json ./
RUN npm ci --silent
COPY app/ .
RUN npm run build || true

FROM node:18-slim
WORKDIR /app
ENV NODE_ENV=production
COPY --from=builder /app ./
RUN npm ci --only=production --silent
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 CMD curl -f http://localhost:8080/health || exit 1
CMD ["node","index.js"]
