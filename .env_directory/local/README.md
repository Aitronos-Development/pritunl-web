# Local Development Environment — Pritunl Web

Configuration for the Pritunl web UI (Go).

## Key Variables

- `BIND_HOST` — Listen address (default: 0.0.0.0)
- `BIND_PORT` — Listen port
- `SSL_CERT` — Base64-encoded TLS certificate
- `SSL_KEY` — Base64-encoded TLS private key
- `REVERSE_PROXY_HEADER` — Reverse proxy detection header
- `REVERSE_PROXY_PROTO_HEADER` — Protocol detection header
- `REDIRECT_SERVER` — Enable HTTP-to-HTTPS redirect (true/false)
- `INTERNAL_ADDRESS` — Internal server address for ACME
- `WEB_STRICT` — Enable strict mode (true/false)
- `WEB_SECRET` — Base64-encoded 32-byte session secret

## Note

In production, these variables are set by the pritunl-server process when spawning pritunl-web as a subprocess. They are unset immediately after reading for security.
