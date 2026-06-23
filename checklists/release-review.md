# Release Review Checklist

> **Uso:** Completar antes y durante el despliegue de una nueva versión o feature crítica a producción.  
> **Responsable:** Tech Lead / DevOps Engineer / Release Manager  
> **Aplica a:** Despliegues de producción, lanzamientos de versión, hotfixes.

---

## Metadata

| Campo | Valor |
|-------|-------|
| **Proyecto** | `[nombre]` |
| **Versión / Tag** | `vX.Y.Z` |
| **Responsable** | `[nombre]` |
| **Fecha** | `YYYY-MM-DD` |

---

## 1. Prerrequisitos de Calidad

- [ ] Todas las features incluidas en el release tienen el reporte de QA en estado `PASS` (`qa.md`).
- [ ] La suite de pruebas automatizadas (unitarias, integración, E2E) está en verde.
- [ ] El código ha sido revisado, aprobado y mergeado a la rama principal (e.g. `main` o `master`).
- [ ] La especificación de arquitectura y reglas de negocio permanentes en `.ai/` han sido consolidadas.

---

## 2. Configuración y Migraciones de Base de Datos

- [ ] Las variables de entorno de producción han sido creadas/actualizadas en el servidor o Secret Manager.
- [ ] Las migraciones de base de datos están listas y han sido probadas con éxito en un entorno clonado (staging).
- [ ] Las migraciones son compatibles hacia atrás (ej. no eliminan columnas activas) para permitir rollback sin downtime.
- [ ] Se ha realizado un respaldo (backup) de la base de datos de producción antes de ejecutar cambios de esquema.

---

## 3. Build y Proceso de Despliegue

- [ ] El build de producción se compila sin errores ni advertencias críticas.
- [ ] El pipeline de CI/CD completa todos los pasos correctamente (linter, build, tests, push de imágenes).
- [ ] El despliegue se realiza de forma progresiva (e.g. Blue-Green, Canary, Rolling Update) para mitigar impacto si aplica.
- [ ] Los assets estáticos optimizados han sido subidos a la CDN y la caché ha sido invalidada si corresponde.

---

## 4. Verificación Post-Despliegue (Smoke Tests)

- [ ] El endpoint de salud (`/health` o similar) responde HTTP 200 OK.
- [ ] Se verificaron manualmente los flujos de usuario más críticos en producción (e.g. login, checkout, registro).
- [ ] Los servicios e integraciones de terceros (APIs externas, pasarelas de pago, Auth) responden correctamente.
- [ ] Monitoreo activo de logs en tiempo real (e.g. Datadog, Sentry, CloudWatch) buscando picos de errores HTTP 500.

---

## 5. Plan de Rollback y Contingencias

- [ ] Se tiene un plan claro y documentado de rollback en caso de fallo crítico en producción.
- [ ] El comando/script para revertir el despliegue a la versión anterior funciona y está listo.
- [ ] Se identificó un plan para revertir las migraciones de base de datos de ser necesario.
- [ ] El equipo técnico clave está disponible y "on-call" durante la ventana de despliegue.

---

## 6. Comunicación y Cierre de Feature

- [ ] El archivo `CHANGELOG.md` del proyecto está actualizado con los cambios de la nueva versión.
- [ ] Se ha creado el Git Tag correspondiente en el repositorio (ej. `git tag -a v1.6.0`).
- [ ] Las carpetas de features involucradas han sido movidas a `.ai/archive/`.
- [ ] Los stakeholders del proyecto han sido notificados sobre el despliegue exitoso.

---

## Resultado

| Estado | Condición |
|--------|-----------|
| ✅ **Exitoso** | Despliegue completado, verificado y estable en producción |
| ⚠️ **Completado con advertencias** | Despliegue exitoso pero con detalles menores no críticos a monitorear |
| ❌ **Fallido / Rollback** | Se detectaron fallos críticos y se ejecutó el plan de rollback |

**Observaciones de la ventana de mantenimiento:**
> `[detallar incidentes, tiempos o notas relevantes]`

---

*Checklist versión 1.0 — ai-agents library*
