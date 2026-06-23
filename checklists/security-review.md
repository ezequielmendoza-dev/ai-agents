# Security Review Checklist

> **Uso:** Revisar antes de mergear cualquier cambio crítico de backend, APIs, o gestión de datos sensibles.  
> **Responsable:** Architect / Tech Lead / QA Engineer  
> **Aplica a:** APIs, microservicios, bases de datos, integraciones con Auth Providers (e.g. Firebase, Auth0) y lógica de negocio.

---

## Metadata

| Campo | Valor |
|-------|-------|
| **Proyecto** | `[nombre]` |
| **Feature / PR** | `FEAT-XXX / PR #XXX` |
| **Revisor** | `[nombre]` |
| **Fecha** | `YYYY-MM-DD` |

---

## 1. Autenticación y Gestión de Sesiones

- [ ] Las contraseñas se almacenan con hashing seguro y salting (e.g. bcrypt, Argon2) o se delega a un proveedor seguro (e.g. Firebase Auth).
- [ ] Los tokens de sesión (JWT) usan firmas criptográficas fuertes y algoritmos seguros (e.g. RS256).
- [ ] Los tokens de acceso tienen tiempos de expiración cortos (e.g. 15-60 min) y se implementa rotación de refresh tokens.
- [ ] Las cookies de sesión están marcadas como `HttpOnly`, `Secure` y `SameSite` (Strict/Lax).
- [ ] Se implementa protección contra ataques de fuerza bruta en el login (e.g. rate limiting, bloqueo temporal de cuentas).
- [ ] Cierre de sesión (logout) invalida la sesión tanto en el cliente como en el backend.

---

## 2. Autorización y Control de Acceso (RBAC/ABAC)

- [ ] Cada endpoint valida explícitamente los permisos y roles del usuario autenticado.
- [ ] No hay referencias directas a objetos inseguros (IDOR); los IDs de recursos en URLs/cuerpos son validados contra la sesión del usuario.
- [ ] Principio de menor privilegio aplicado en los accesos a nivel de código y base de datos.
- [ ] Las rutas de administración y endpoints sensibles están protegidos bajo middleware de autorización robusto.

---

## 3. Validación y Sanitización de Datos

- [ ] Todas las entradas del usuario (Query parameters, Path variables, Request Body) son validadas en el servidor contra un esquema estricto (e.g. Zod, Joi, class-validator).
- [ ] Los datos de salida se escapan/sanitizan para mitigar ataques Cross-Site Scripting (XSS).
- [ ] Las consultas a base de datos están parametrizadas (ORMs, Prepared Statements) para evitar Inyección SQL.
- [ ] Validación estricta en subida de archivos (tamaño máximo, extensiones/MIME types permitidos, almacenamiento en un bucket aislado).

---

## 4. Protección de Datos Sensibles

- [ ] Los datos en tránsito se envían exclusivamente sobre HTTPS (TLS 1.2+).
- [ ] Los datos sensibles en reposo (e.g. tarjetas de crédito, PIIs, tokens externos) se almacenan encriptados.
- [ ] La información sensible es enmascarada o excluida en logs del sistema.
- [ ] Las respuestas de error no exponen stack traces, detalles de la base de datos o software utilizado (e.g. `Server: Express`).

---

## 5. Manejo de Secretos y Configuración

- [ ] No existen credenciales, tokens, certificados o API keys hardcodeados en el código.
- [ ] Los secretos del entorno de producción se gestionan mediante variables de entorno seguras o un Secret Manager (e.g. GCP Secret Manager, Vault).
- [ ] El archivo `.env` o similares están agregados explícitamente en el `.gitignore`.
- [ ] Los entornos (development, staging, production) tienen credenciales completamente aisladas y diferentes.

---

## 6. Seguridad en Comunicaciones y APIs

- [ ] Configuración estricta de CORS (Cross-Origin Resource Sharing), permitiendo únicamente los dominios autorizados de producción.
- [ ] Headers de seguridad básicos configurados (e.g. CSP - Content Security Policy, HSTS, X-Frame-Options, X-Content-Type-Options).
- [ ] Se implementa Rate Limiting en endpoints expuestos públicamente para mitigar ataques DDoS y scraping masivo.

---

## 7. Dependencias y Terceros

- [ ] No se importan librerías obsoletas, sin mantenimiento o con vulnerabilidades conocidas (`npm audit` o herramientas equivalentes limpias).
- [ ] Las APIs de terceros se consumen de manera segura usando timeouts y manejando fallos sin comprometer la disponibilidad del sistema.

---

## Resultado

| Estado | Condición |
|--------|-----------|
| ✅ **Aprobado** | Todos los ítems críticos OK (especialmente Secretos y Auth) |
| ⚠️ **Aprobado con observaciones** | Ítems no críticos pendientes de parchear a corto plazo |
| ❌ **Rechazado** | Vulnerabilidades críticas detectadas |

**Observaciones / Vulnerabilidades encontradas:**
> `[detallar hallazgos y severidad si aplica]`

---

*Checklist versión 1.0 — ai-agents library*
