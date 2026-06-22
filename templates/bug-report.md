# Bug Report Template

> **Uso:** Reportar un bug encontrado en cualquier etapa del desarrollo.  
> **Responsable:** Quien detecta el bug (QA, Developer, Tech Lead, usuario)  
> **Asignado a:** Developer / Tech Lead para resolución

---

## Metadata

| Campo | Valor |
|-------|-------|
| **Proyecto** | `[nombre-del-proyecto]` |
| **Bug ID** | `BUG-XXX` |
| **Feature Relacionada** | `FEAT-XXX` (si aplica) |
| **Fecha de Detección** | `YYYY-MM-DD` |
| **Detectado por** | `[nombre / agente]` |
| **Asignado a** | `[nombre / agente]` |
| **Entorno** | `Development / Staging / Production` |
| **Versión / Commit** | `[tag / hash]` |

---

## 1. Clasificación

| Campo | Valor |
|-------|-------|
| **Severidad** | 🔴 Crítico / 🟠 Alto / 🟡 Medio / 🟢 Bajo |
| **Prioridad** | 🔴 Urgente / 🟠 Alta / 🟡 Normal / 🟢 Baja |
| **Tipo** | Funcional / Seguridad / Rendimiento / UX / Datos / Integración |
| **Estado** | Nuevo / En análisis / En progreso / Resuelto / Cerrado / Won't fix |

### Criterios de Severidad

| Nivel | Criterio |
|-------|----------|
| 🔴 Crítico | El sistema no funciona o hay pérdida de datos. Bloquea a todos los usuarios |
| 🟠 Alto | Funcionalidad principal afectada. Existe workaround pero es inaceptable |
| 🟡 Medio | Funcionalidad secundaria afectada. Existe workaround aceptable |
| 🟢 Bajo | Problema cosmético o de UX que no afecta la funcionalidad |

---

## 2. Descripción del Bug

> Descripción clara y concisa del problema en una oración.

**Ejemplo:**
> Al cancelar una reserva fuera del plazo de 2 horas, el sistema no aplica la penalidad del 20% y realiza el reembolso completo.

---

## 3. Pasos para Reproducir

> Lista detallada y ordenada de los pasos exactos para reproducir el bug.

1. Iniciar sesión como pasajero con una reserva confirmada
2. Navegar a "Mis Reservas"
3. Seleccionar una reserva con menos de 2 horas para el viaje
4. Hacer clic en "Cancelar reserva"
5. Confirmar la cancelación
6. Verificar el monto del reembolso en la sección de pagos

**Datos de prueba utilizados:**
- Usuario: `testuser@example.com`
- Reserva ID: `booking-abc-123`
- Tiempo hasta el viaje: 45 minutos (debería aplicar penalidad)

---

## 4. Resultado Esperado

> ¿Qué debería ocurrir según los requerimientos?

**Ejemplo:**
> El sistema debería aplicar una penalidad del 20% sobre el monto original y reembolsar solo el 80% restante. El usuario debería ver un mensaje explicando la penalidad aplicada.

---

## 5. Resultado Actual

> ¿Qué ocurre actualmente?

**Ejemplo:**
> El sistema realiza el reembolso del 100% del monto sin aplicar ninguna penalidad. No se muestra ningún mensaje de penalidad. El historial de pagos muestra un reembolso completo.

---

## 6. Evidencia

### Screenshots / Videos

> `[Insertar screenshots o links a videos]`

### Logs Relevantes

```
[Pegar logs del servidor, consola del navegador, etc.]
```

### Request / Response

```http
DELETE /api/bookings/booking-abc-123
Authorization: Bearer [token]

HTTP/1.1 200 OK
{
  "refundAmount": 1500,  // ❌ Debería ser 1200 (1500 * 0.8)
  "status": "CANCELLED"
}
```

---

## 7. Análisis de Causa Raíz

> (Completar al analizar el bug — puede ser el Developer o el Architect)

**Código Afectado:**
```
[archivo/función donde se encuentra el bug]
```

**Causa Identificada:**
> `[descripción técnica de la causa]`

**Ejemplo:**
> En `bookings.service.ts`, función `cancelBooking()`, la condición para verificar el tiempo límite usa `>=` en lugar de `>`, haciendo que el caso exacto de 2 horas no aplique penalidad. Además, la variable `CANCELLATION_PENALTY_PERCENTAGE` está hardcodeada en 0 durante pruebas y no se revirtió al valor de producción.

---

## 8. Solución Propuesta

> (Completar después del análisis — puede proponer el Developer)

**Cambios Requeridos:**

| Archivo | Tipo de Cambio | Descripción |
|---------|---------------|-------------|
| `src/modules/bookings/bookings.service.ts` | Bugfix | Corregir condición de tiempo límite |
| `src/config/constants.ts` | Bugfix | Restaurar valor de `CANCELLATION_PENALTY_PERCENTAGE` |

**Notas de Implementación:**
> `[indicaciones adicionales para el Developer]`

---

## 9. Impacto

> ¿Qué usuarios o funcionalidades se ven afectados?

- **Usuarios afectados:** Todos los pasajeros que cancelen reservas fuera del plazo
- **Impacto financiero:** Pérdida de ingresos por penalidades no cobradas
- **Funcionalidades afectadas:** Módulo de cancelaciones, módulo de reembolsos

---

## 10. Historial

| Fecha | Acción | Responsable | Notas |
|-------|--------|-------------|-------|
| `YYYY-MM-DD` | Bug detectado | QA Engineer | Durante revisión del FEAT-015 |
| `YYYY-MM-DD` | Asignado al Developer | Tech Lead | Prioridad: Alta |
| `YYYY-MM-DD` | En progreso | Developer | — |
| `YYYY-MM-DD` | Resuelto | Developer | Fix en commit `abc123` |
| `YYYY-MM-DD` | Verificado | QA Engineer | Bug cerrado |

---

*Template versión 1.0 — ai-agents library*
