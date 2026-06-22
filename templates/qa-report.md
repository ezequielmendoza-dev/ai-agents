# QA Report Template

> **Uso:** Completar después de revisar una implementación.  
> **Responsable:** QA Engineer  
> **Revisado por:** Tech Lead

---

## Metadata

| Campo | Valor |
|-------|-------|
| **Proyecto** | `[nombre-del-proyecto]` |
| **Feature ID** | `FEAT-XXX` |
| **QA Report ID** | `QA-XXX` |
| **Fecha** | `YYYY-MM-DD` |
| **Versión Revisada** | `[branch / commit / versión]` |
| **Entorno** | `Development / Staging / Production` |
| **QA Engineer** | `[nombre]` |

---

## 1. Resumen General

| Aspecto | Estado |
|---------|--------|
| Validación Funcional | ✅ OK / ⚠️ Con observaciones / ❌ Fallido |
| Validación de Reglas de Negocio | ✅ OK / ⚠️ Con observaciones / ❌ Fallido |
| Casos Borde | ✅ Cubiertos / ⚠️ Parciales / ❌ No cubiertos |
| Seguridad | ✅ OK / ⚠️ Con observaciones / ❌ Fallido |
| UX/UI | ✅ OK / ⚠️ Con observaciones / ❌ Fallido |

**Descripción General:**
> `[Descripción de 2-3 líneas sobre el estado general de la funcionalidad]`

---

## 2. Cobertura de Criterios de Aceptación

| # | Criterio | Estado | Observación |
|---|----------|--------|-------------|
| 1 | `[criterio del feature-spec]` | ✅/⚠️/❌ | `[observación si aplica]` |
| 2 | `[criterio]` | ✅/⚠️/❌ | |
| 3 | `[criterio]` | ✅/⚠️/❌ | |

---

## 3. Bugs Detectados

> Ordenados por severidad: Crítico > Alto > Medio > Bajo

### BUG-001 — `[Título descriptivo del bug]`

| Campo | Valor |
|-------|-------|
| **Severidad** | Crítico / Alto / Medio / Bajo |
| **Componente** | `[frontend / backend / database / integración]` |
| **Estado** | Abierto / En progreso / Resuelto |

**Pasos para reproducir:**
1. `[paso 1]`
2. `[paso 2]`
3. `[resultado actual]`

**Resultado Esperado:**
> `[qué debería ocurrir]`

**Resultado Actual:**
> `[qué ocurre actualmente]`

**Evidencia:**
> `[screenshot, log, request/response, etc.]`

---

### BUG-002 — `[Título]`

*(Repetir estructura para cada bug)*

---

## 4. Casos Borde Faltantes

| ID | Escenario | Impacto | Recomendación |
|----|-----------|---------|---------------|
| CB-01 | `[escenario no cubierto]` | Alto/Medio/Bajo | `[qué hacer]` |

**Ejemplo:**

| ID | Escenario | Impacto | Recomendación |
|----|-----------|---------|---------------|
| CB-01 | Reserva simultánea del último asiento por dos usuarios | Alto | Agregar test de concurrencia y manejo de `409` |
| CB-02 | Usuario sin método de pago intenta reservar | Medio | Validar antes de crear el booking |

---

## 5. Riesgos de Seguridad

| ID | Riesgo | Severidad | Recomendación |
|----|--------|-----------|---------------|
| RS-01 | `[descripción del riesgo]` | Crítica/Alta/Media/Baja | `[acción recomendada]` |

**Ejemplo:**

| ID | Riesgo | Severidad | Recomendación |
|----|--------|-----------|---------------|
| RS-01 | El endpoint no valida que el `passengerId` sea el usuario autenticado | Alta | Validar `req.user.id === passengerId` |
| RS-02 | Los IDs de booking son secuenciales y predecibles | Media | Usar UUIDs v4 |

---

## 6. Riesgos de Concurrencia

| ID | Escenario | Impacto | Mitigación Recomendada |
|----|-----------|---------|------------------------|
| RC-01 | `[escenario]` | Alto/Medio/Bajo | `[solución]` |

---

## 7. Riesgos de UX/UI

| ID | Problema | Pantalla/Flujo | Recomendación |
|----|----------|----------------|---------------|
| RU-01 | `[descripción]` | `[dónde ocurre]` | `[solución]` |

---

## 8. Escenarios de Prueba Ejecutados

| ID | Escenario | Tipo | Resultado |
|----|-----------|------|-----------|
| EP-01 | `[descripción]` | Manual / Automatizado | ✅ PASS / ❌ FAIL |

**Ejemplo:**

| ID | Escenario | Tipo | Resultado |
|----|-----------|------|-----------|
| EP-01 | Reserva exitosa de asiento disponible | Manual | ✅ PASS |
| EP-02 | Intentar reservar asiento ocupado | Manual | ✅ PASS |
| EP-03 | Cancelar reserva dentro del plazo | Manual | ❌ FAIL (BUG-001) |
| EP-04 | Cancelar reserva fuera del plazo | Manual | ⚠️ Sin validación de penalidad |

---

## 9. Recomendaciones Generales

> Sugerencias de mejora que no son bugs pero mejorarían la calidad.

- `[recomendación 1]`
- `[recomendación 2]`

---

## 10. Resultado Final

---

> ### ✅ PASS
> La funcionalidad cumple todos los criterios de aceptación sin observaciones críticas.

---

> ### ⚠️ PASS WITH OBSERVATIONS
> La funcionalidad es funcional pero tiene observaciones que deben resolverse antes del siguiente release.
> **Observaciones:** `[lista de observaciones]`

---

> ### ❌ FAIL
> La funcionalidad tiene bugs críticos o incumplimientos de requerimientos que impiden su aprobación.
> **Bugs Bloqueantes:** `[lista de bugs críticos]`

---

*Template versión 1.0 — ai-agents library*
