# Technical Task Template

> **Uso:** Crear una tarea técnica específica para el Developer.  
> **Responsable:** Tech Lead  
> **Ejecutado por:** Senior Developer

---

## Metadata

| Campo | Valor |
|-------|-------|
| **Proyecto** | `[nombre-del-proyecto]` |
| **Task ID** | `TASK-XXX` |
| **Feature ID** | `FEAT-XXX` |
| **Fecha** | `YYYY-MM-DD` |
| **Estimación** | `[X horas / X días]` |
| **Prioridad** | `Alta / Media / Baja` |
| **Estado** | `Todo / In Progress / Done / Blocked` |
| **Asignado a** | `[nombre o agente]` |
| **Rama Git** | `feat/XXX-descripcion` |

---

## 1. Descripción

> ¿Qué se debe implementar? Descripción concisa y sin ambigüedades.

**Ejemplo:**
> Implementar el endpoint `POST /api/bookings` que permite a un pasajero autenticado reservar un asiento en un viaje. La reserva debe crear un registro en la tabla `bookings` con estado `PENDING` y decrementar `available_seats` en la tabla `trips`, todo en una transacción atómica.

---

## 2. Contexto

> ¿Por qué existe esta tarea? ¿Qué problema resuelve en el contexto del proyecto?

---

## 3. Criterios de Aceptación

> Lista verificable de condiciones que deben cumplirse para considerar la tarea completada.

- [ ] `[criterio 1]`
- [ ] `[criterio 2]`
- [ ] `[criterio 3]`

**Ejemplo:**
- [ ] El endpoint acepta `tripId` y `seatNumber` en el body
- [ ] Valida que el trip exista y esté en estado `SCHEDULED`
- [ ] Valida que el asiento esté disponible
- [ ] Crea el booking en estado `PENDING` atómicamente
- [ ] Decrementa `available_seats` en la misma transacción
- [ ] Retorna `201` con el booking creado
- [ ] Retorna `409` si el asiento no está disponible
- [ ] La operación es idempotente ante reintentos

---

## 4. Especificaciones Técnicas

### Endpoint / Función / Componente

```
[Tipo]: [nombre]
[Ruta/Ubicación]: [path en el proyecto]
```

**Ejemplo:**
```
Endpoint: POST /api/bookings
Archivo: src/modules/bookings/bookings.controller.ts
Service: src/modules/bookings/bookings.service.ts
```

### Inputs

```typescript
// Ejemplo TypeScript
interface CreateBookingDto {
  tripId: string;
  seatNumber: number;
}
```

### Outputs

```typescript
// Ejemplo TypeScript
interface BookingResponse {
  id: string;
  tripId: string;
  passengerId: string;
  seatNumber: number;
  status: 'PENDING' | 'CONFIRMED' | 'CANCELLED';
  createdAt: string;
}
```

---

## 5. Restricciones de Implementación

> Qué NO hacer. Límites del alcance de esta tarea.

- ❌ No implementar el flujo de pago (es otra tarea)
- ❌ No enviar notificaciones (es otra tarea)
- ❌ No modificar la lógica de creación de viajes
- ✅ Solo implementar la lógica de reserva

---

## 6. Archivos a Modificar / Crear

| Acción | Archivo | Descripción |
|--------|---------|-------------|
| Crear | `src/modules/bookings/booking.entity.ts` | Entidad Booking |
| Crear | `src/modules/bookings/bookings.service.ts` | Lógica de negocio |
| Crear | `src/modules/bookings/bookings.controller.ts` | Controlador REST |
| Modificar | `src/modules/trips/trips.service.ts` | Agregar método para decrementar asientos |
| Crear | `migrations/YYYYMMDD_create_bookings.sql` | Migración de base de datos |

---

## 7. Dependencias

> ¿Esta tarea depende de otras? ¿Otras tareas dependen de esta?

| Tipo | Task ID | Descripción |
|------|---------|-------------|
| Depende de | `TASK-001` | Migración de base de datos debe existir |
| Bloqueada por | `TASK-002` | Necesita el modelo `Trip` actualizado |
| Bloquea | `TASK-005` | El flujo de pagos necesita el ID del booking |

---

## 8. Validaciones y Pruebas

> Lista de escenarios que el Developer debe validar manualmente o con tests.

### Tests Unitarios

- [ ] `createBooking` crea registro correctamente
- [ ] `createBooking` lanza error si el viaje no existe
- [ ] `createBooking` lanza error si no hay asientos disponibles

### Tests de Integración

- [ ] `POST /api/bookings` retorna 201 con datos correctos
- [ ] `POST /api/bookings` retorna 409 en concurrencia

### Tests Manuales

- [ ] Probar con Postman el flujo completo
- [ ] Verificar en DB que `available_seats` se actualiza

---

## 9. Notas para el Developer

> Información adicional, patterns a seguir, referencias de código existente.

**Ejemplo:**
- Seguir el pattern de otros módulos en `src/modules/`
- Usar el `DatabaseService` existente para transacciones
- Ver `payments.service.ts` como referencia para manejo de errores
- El Logger ya está configurado — úsalo para errores críticos

---

*Template versión 1.0 — ai-agents library*
