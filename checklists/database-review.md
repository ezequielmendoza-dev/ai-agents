# Database Review Checklist

> **Uso:** Revisar antes de aplicar cualquier migración o cambio de schema.  
> **Responsable:** Software Architect + Tech Lead  
> **Aplica a:** PostgreSQL, MySQL, Firestore, MongoDB, cualquier base de datos

---

## Metadata

| Campo | Valor |
|-------|-------|
| **Proyecto** | `[nombre]` |
| **Feature / Migración** | `FEAT-XXX / MIG-XXX` |
| **Revisor** | `[nombre]` |
| **Fecha** | `YYYY-MM-DD` |
| **DB Engine** | `PostgreSQL / MySQL / Firestore / MongoDB` |

---

## 1. Diseño del Schema

- [ ] Los nombres de tablas/colecciones son en `snake_case` y en plural
- [ ] Los nombres de columnas son descriptivos y en `snake_case`
- [ ] Los tipos de datos son los más apropiados para cada campo
- [ ] Se usan UUIDs (no IDs secuenciales) para evitar enumeración
- [ ] Los campos `created_at` y `updated_at` están presentes en todas las entidades
- [ ] Los campos opcionales y requeridos están correctamente definidos (`NOT NULL`)
- [ ] Los campos de estado usan `ENUM` o tabla de referencia, no strings libres

---

## 2. Integridad Referencial

- [ ] Las claves foráneas están definidas correctamente
- [ ] Las restricciones `ON DELETE` son apropiadas (`CASCADE`, `SET NULL`, `RESTRICT`)
- [ ] No hay referencias circulares sin justificación
- [ ] Las relaciones many-to-many usan tabla pivote
- [ ] Los índices únicos están definidos donde corresponde

---

## 3. Migraciones

- [ ] La migración es reversible (existe script de rollback)
- [ ] La migración puede ejecutarse sin downtime (si aplica)
- [ ] Las migraciones de datos son idempotentes
- [ ] Los datos existentes no se pierden en la migración
- [ ] La migración fue probada en un entorno de staging
- [ ] El orden de ejecución de migraciones es correcto
- [ ] Los datos de inicialización (seeds) son correctos

---

## 4. Índices y Rendimiento

- [ ] Todas las columnas usadas en `WHERE` frecuente tienen índice
- [ ] Todas las columnas usadas en `JOIN` tienen índice
- [ ] Todas las columnas usadas en `ORDER BY` frecuente tienen índice
- [ ] Los índices compuestos están en el orden correcto
- [ ] No hay índices duplicados o innecesarios
- [ ] Las queries críticas fueron analizadas con `EXPLAIN`
- [ ] Se evaluó el uso de índices parciales donde corresponde

---

## 5. Seguridad de Datos

- [ ] Los datos sensibles se almacenan cifrados (passwords, PII)
- [ ] Los passwords usan hashing fuerte (bcrypt, argon2)
- [ ] Los tokens de reset/confirmación se invalidan después de su uso
- [ ] El acceso a la base de datos sigue el principio de mínimo privilegio
- [ ] Las credenciales de DB no están en el repositorio

---

## 6. Consistencia y Constraints

- [ ] Los constraints de unicidad están definidos a nivel de DB (no solo en código)
- [ ] Las validaciones de dominio están reforzadas en DB cuando es posible
- [ ] Los valores por defecto están correctamente definidos
- [ ] Las restricciones de longitud de strings son adecuadas
- [ ] Los campos numéricos tienen rangos apropiados

---

## 7. Soft Delete y Auditoría

- [ ] Las entidades que requieren historial usan soft delete (`deleted_at`)
- [ ] Los registros eliminados no aparecen en queries normales
- [ ] Si aplica, hay registro de auditoría de cambios
- [ ] Los datos de auditoría incluyen quién, cuándo y qué cambió

---

## 8. Escalabilidad

- [ ] El schema puede manejar el volumen proyectado de datos
- [ ] Se consideró particionado para tablas de alto volumen
- [ ] Las queries de reporte están separadas de las queries operacionales
- [ ] Se evaluó el uso de vistas materializadas para reportes costosos

---

## 9. Documentación

- [ ] El schema está documentado (comentarios en la migración o en un ERD)
- [ ] Las decisiones de diseño no obvias están justificadas
- [ ] El ERD (Entity Relationship Diagram) está actualizado

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
