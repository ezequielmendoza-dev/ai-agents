# Performance Review Checklist

> **Uso:** Revisar antes de mergear PRs con impacto en rendimiento, consultas a bases de datos o lógica compleja.  
> **Responsable:** Architect / Tech Lead / Senior Developer  
> **Aplica a:** Backend APIs, consultas de BD, lógica frontend, bundles y optimización de assets.

---

## Metadata

| Campo | Valor |
|-------|-------|
| **Proyecto** | `[nombre]` |
| **Feature / PR** | `FEAT-XXX / PR #XXX` |
| **Revisor** | `[nombre]` |
| **Fecha** | `YYYY-MM-DD` |

---

## 1. Rendimiento Frontend y Assets

- [ ] Las imágenes están optimizadas en tamaño y formato moderno (e.g. WebP/AVIF) y usan `loading="lazy"` para elementos fuera del viewport inicial.
- [ ] Fuentes web optimizadas (e.g. `font-display: swap`, precarga de fuentes críticas).
- [ ] Scripts de terceros cargados de forma asíncrona (`async`/`defer`) o retrasados para no bloquear el hilo principal.
- [ ] Bundle size controlado mediante Code Splitting (lazy loading de rutas/componentes pesados).
- [ ] Evitar re-renders innecesarios (memorización correcta de componentes/funciones costosas).
- [ ] Minimizar el tamaño del DOM (evitar anidaciones excesivas).
- [ ] Monitoreo básico de Core Web Vitals (LCP < 2.5s, INP < 200ms, CLS < 0.1).

---

## 2. Lógica de Backend y APIs

- [ ] Las respuestas de las APIs están comprimidas (e.g. gzip, brotli).
- [ ] Los payloads de respuesta contienen solo la información necesaria (evitar retornar objetos completos de BD).
- [ ] Peticiones independientes procesadas en paralelo (e.g. `Promise.all` en JS/TS) en lugar de secuenciales.
- [ ] Paginación obligatoria e implementada en endpoints que listan colecciones de datos.
- [ ] Procesamiento de tareas pesadas o de larga duración delegado a workers o colas asíncronas (e.g. BullMQ, Celery).

---

## 3. Base de Datos y Almacenamiento

- [ ] Todas las consultas críticas o frecuentes usan índices apropiados.
- [ ] Explicar y analizar el plan de ejecución de consultas pesadas (`EXPLAIN ANALYZE`) para evitar Table Scans completos.
- [ ] Solución al problema de consultas N+1 mediante cargas ansiosas (Eager Loading / Joins adecuados).
- [ ] Conexiones a base de datos gestionadas mediante un Connection Pool configurado adecuadamente.
- [ ] Uso de bases de datos de lectura (Read Replicas) para consultas intensivas de reportes o dashboards si aplica.

---

## 4. Red, Caching y CDN

- [ ] Uso de CDN (Content Delivery Network) para servir assets estáticos (JS, CSS, imágenes, vídeos).
- [ ] Estrategia de Caching implementada para datos de lectura frecuentes y estáticos (e.g. Redis, Memcached).
- [ ] Headers `Cache-Control` configurados de manera adecuada en las respuestas de API y assets.
- [ ] Respuestas HTTP 304 (Not Modified) devueltas cuando los recursos no han cambiado (ETags).

---

## 5. Gestión de Memoria y Recursos

- [ ] Los event listeners, timers (intervals) y suscripciones (RxJS/WebSockets) son destruidos o cancelados correctamente para evitar fugas de memoria.
- [ ] Conexiones a archivos, sockets o streams se cierran explícitamente tras su uso.
- [ ] No se cargan archivos completos en memoria; se usan streams para lectura/escritura de archivos grandes.

---

## Resultado

| Estado | Condición |
|--------|-----------|
| ✅ **Aprobado** | Rendimiento óptimo y sin cuellos de botella conocidos |
| ⚠️ **Aprobado con observaciones** | Mejoras menores de rendimiento recomendadas pero no bloqueantes |
| ❌ **Rechazado** | Problemas críticos detectadas (consultas sin índices, leaks, bloqueos) |

**Observaciones / Oportunidades de mejora:**
> `[detallar hallazgos y recomendaciones si aplica]`

---

*Checklist versión 1.0 — ai-agents library*
