---
id: release-readiness
category: workflow
aliases: [go-live, release-checklist]
type: method
version: 1.0
---

# Release Readiness

> Metodología para asegurar que un sistema, funcionalidad o producto está verdaderamente listo para ser desplegado en un ambiente de producción.

---

## Cuándo Usar Esta Skill
- Al final de un ciclo de desarrollo, justo antes de ejecutar un pipeline de despliegue a producción.
- Como DevOps o QA Agent validando el estado del sistema.

## Principios Fundamentales
1. **Despliegue != Lanzamiento (Deploy != Release):** Puedes desplegar código a producción oculto tras un Feature Flag sin lanzarlo a los usuarios.
2. **Automatización:** Si duele, hazlo más a menudo y automatízalo.
3. **Plan de Rollback:** Nunca despliegues sin saber exactamente cómo deshacer los cambios rápidamente si algo sale mal.

## Checklist de Preparación (Release Readiness)

### 1. Funcionalidad y Testing
- [ ] Todos los tests unitarios, de integración y E2E automatizados han pasado (CI verde).
- [ ] Verificación de QA manual completada para los flujos no automatizados.
- [ ] Feature flags configurados correctamente (apagados si es un lanzamiento silencioso).

### 2. Infraestructura y Configuración
- [ ] Variables de entorno requeridas por el nuevo código están configuradas en Producción.
- [ ] Migraciones de base de datos probadas y listas. (Nota: Las migraciones deben ser retrocompatibles con la versión anterior del código).
- [ ] Dependencias externas o servicios de terceros actualizados o aprovisionados (ej. nuevas colas, nuevos buckets).

### 3. Observabilidad
- [ ] Logs adecuados inyectados en los flujos críticos.
- [ ] Métricas clave configuradas (ej. cuántos usuarios usan la nueva feature, tasas de error).
- [ ] Alertas operativas configuradas para fallos de esta nueva funcionalidad.

### 4. Seguridad y Cumplimiento
- [ ] Dependencias libres de vulnerabilidades críticas conocidas (NPM audit, Dependabot).
- [ ] Secretos no hardcodeados en el repositorio (verificados por git hooks/CI).

## Procedimiento ante Fallas en Producción
Si se detectan errores graves tras el despliegue:
1. Contención inmediata: Apagar el Feature Flag o ejecutar rollback a la versión anterior estable.
2. Comunicación: Informar al equipo o stakeholders si hubo impacto al cliente.
3. Investigación: Analizar logs, reproducir en staging. NO aplicar parches "en caliente" (hotfixes) directamente en producción evadiendo el CI.
