---
id: api-design
category: architecture
aliases: [rest-design, api-architecture]
type: method
version: 1.0
---

# API Design (RESTful)

> Metodología para diseñar interfaces de programación de aplicaciones (APIs) robustas, predecibles y escalables.

---

## Cuándo Usar Esta Skill
- Durante el diseño arquitectónico de servicios backend.
- Al definir contratos entre el frontend y el backend (System Design).
- Cuando se requiere integrar sistemas de terceros.

## Principios Fundamentales
1. **API First:** Diseñar y documentar la API (ej. OpenAPI/Swagger) antes de escribir código.
2. **Resource-Oriented:** Pensar en términos de recursos y sustantivos (ej. `/users`, `/bookings`), no acciones (evitar `/createUser`).
3. **Statelessness:** Cada solicitud del cliente al servidor debe contener toda la información necesaria para entender y procesar la petición.

## Reglas de Diseño

- **Nomenclatura:** Usar plurales para los recursos (`/users` en vez de `/user`). Usar *kebab-case* para URIs.
- **Métodos HTTP:** 
  - `GET`: Obtener recurso (Idempotente, seguro).
  - `POST`: Crear nuevo recurso.
  - `PUT`: Reemplazar recurso completo (Idempotente).
  - `PATCH`: Modificar recurso parcialmente.
  - `DELETE`: Eliminar recurso (Idempotente).
- **Códigos de Estado:**
  - `200 OK` para éxitos generales.
  - `201 Created` para POST exitosos.
  - `400 Bad Request` para validaciones fallidas (incluir detalle estructurado del error).
  - `401 Unauthorized` si falta token o es inválido.
  - `403 Forbidden` si el usuario no tiene permisos para el recurso.
  - `404 Not Found` si el recurso no existe.
- **Paginación y Filtrado:** Usar query parameters. Ej: `/users?role=admin&limit=20&offset=0`.
- **Versionado:** Incluir versionado en la URL (ej. `/api/v1/users`) o en los headers (`Accept: application/vnd.company.v1+json`).

## Anti-Patrones
- ❌ **Custom Verbs:** `POST /api/users/123/activate`. (Mejor: `PATCH /api/users/123` con `{"status": "active"}`).
- ❌ **Datos anidados excesivos:** Devolver gráfos de objetos gigantes. Preferir referencias (IDs) o parámetros `?expand=relationships`.
- ❌ **Errores opacos:** Devolver `500 Internal Server Error` sin contexto en ambientes de desarrollo o devolver `200 OK` con un cuerpo `{"error": true}`.
