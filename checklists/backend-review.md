# Backend Review Checklist

> **Uso:** Revisar antes de mergear cualquier PR con cambios de backend.  
> **Responsable:** QA Engineer + Tech Lead  
> **Aplica a:** APIs REST, servicios, workers, integraciones

---

## Metadata

| Campo | Valor |
|-------|-------|
| **Proyecto** | `[nombre]` |
| **Feature / PR** | `FEAT-XXX / PR #XXX` |
| **Revisor** | `[nombre]` |
| **Fecha** | `YYYY-MM-DD` |

---

## 1. Diseño de API

- [ ] Los endpoints siguen convenciones REST (`/resources`, `/resources/:id`)
- [ ] Verbos HTTP correctos (`GET`, `POST`, `PUT`/`PATCH`, `DELETE`)
- [ ] Códigos de estado HTTP apropiados (`200`, `201`, `400`, `401`, `403`, `404`, `409`, `500`)
- [ ] Las respuestas tienen estructura consistente en todo el proyecto
- [ ] La paginación está implementada en endpoints que devuelven listas
- [ ] Los filtros y ordenamiento están documentados
- [ ] Versionado de API considerado (`/api/v1/...`)

---

## 2. Validación de Inputs

- [ ] Todos los inputs del request body son validados
- [ ] Todos los parámetros de ruta son validados
- [ ] Todos los query params son validados
- [ ] Tipos de datos verificados (string, number, boolean, dates)
- [ ] Longitudes máximas definidas para strings
- [ ] Los mensajes de error de validación son descriptivos
- [ ] Campos requeridos vs opcionales correctamente definidos

---

## 3. Autenticación y Autorización

- [ ] Todos los endpoints privados verifican el token de autenticación
- [ ] Los permisos son verificados (no solo que el usuario esté autenticado)
- [ ] Un usuario no puede acceder a recursos de otro usuario
- [ ] Los roles tienen los permisos mínimos necesarios
- [ ] Los tokens expirados retornan `401`, no `403`
- [ ] Los tokens son validados correctamente (firma, expiración, claims)

---

## 4. Lógica de Negocio

- [ ] Todas las reglas de negocio del feature-spec están implementadas
- [ ] Los casos borde identificados están manejados
- [ ] Las transacciones se usan donde se necesita atomicidad
- [ ] Los estados de entidades son consistentes tras operaciones
- [ ] No hay condiciones de carrera en operaciones concurrentes

---

## 5. Manejo de Errores

- [ ] Los errores esperados se manejan explícitamente
- [ ] Los errores inesperados se capturan y loguean correctamente
- [ ] Las respuestas de error no exponen información sensible (stack traces, rutas internas)
- [ ] Los errores de integración con servicios externos están manejados
- [ ] Los timeouts de servicios externos tienen fallback

---

## 6. Integridad de Datos

- [ ] No hay queries N+1 (uso de eager loading donde corresponde)
- [ ] Las relaciones entre entidades son correctas
- [ ] No se eliminan datos sin validar dependencias
- [ ] Los soft deletes están implementados donde corresponde
- [ ] Los datos se sanitizan antes de persistirse

---

## 7. Rendimiento

- [ ] Los endpoints de alta frecuencia tienen índices adecuados en DB
- [ ] No hay queries innecesariamente pesadas
- [ ] El caché se usa donde corresponde (datos poco cambiantes)
- [ ] Las operaciones costosas son asíncronas o se delegan a workers
- [ ] Los payloads de respuesta no incluyen campos innecesarios

---

## 8. Logging y Observabilidad

- [ ] Los errores críticos se loguean con contexto suficiente
- [ ] Los logs no contienen datos sensibles (passwords, tokens, PII)
- [ ] Las operaciones críticas de negocio tienen trazabilidad
- [ ] Los tiempos de respuesta de operaciones lentas se registran

---

## 9. Calidad de Código

- [ ] Las funciones tienen un único propósito (SRP)
- [ ] No hay código duplicado sin justificación
- [ ] Los nombres de variables y funciones son descriptivos
- [ ] La complejidad ciclomática es manejable
- [ ] Las constantes están extraídas (no valores mágicos)
- [ ] No hay `TODO` o `FIXME` sin ticket asociado

---

## 10. Testing

- [ ] Tests unitarios para la lógica de negocio
- [ ] Tests de integración para los endpoints principales
- [ ] Los casos de error están cubiertos en tests
- [ ] Los tests de concurrencia cubren escenarios críticos
- [ ] Los mocks de servicios externos son correctos

---

## Resultado

| Estado | Condición |
|--------|-----------|
| ✅ **Aprobado** | Todos los ítems críticos OK |
| ⚠️ **Aprobado con observaciones** | Ítems no críticos pendientes |
| ❌ **Rechazado** | Ítems críticos fallidos |

**Observaciones:**
> `[detallar observaciones si aplica]`

---

*Checklist versión 1.0 — ai-agents library*
