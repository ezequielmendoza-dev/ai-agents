# CHANGELOG

Todas los cambios notables en este repositorio se documentan en este archivo.

Formato basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/).

---

## [1.3.0] — 2026-06-23

### Agregado
- **Auto-Contextualización / Bootstrap**: Se extendió el rol del `Product Analyst` (`roles/analyst.md`) y las plantillas de configuración (`templates/ide-configs/AGENTS.md`) con la capacidad de inicializar el archivo `.ai/context.md` de forma guiada y automatizada escaneando el código y la estructura de directorios del proyecto.

### Modificado
- `README.md` — Se actualizó el Paso 3 de la guía de integración detallando cómo usar la IA del IDE para autogenerar el contexto del proyecto a partir del código existente.

---

## [1.2.0] — 2026-06-23

### Agregado
- `templates/ide-configs/` — Plantillas de configuración para IDEs de IA como Cursor (`.cursorrules`), Claude Code (`CLAUDE.md`), Windsurf (`.windsurfrules`), Cline (`.clinerules`), y Copilot (`copilot-instructions.md`).
- `scripts/setup-ide.sh` — Script automatizado interactivo para inicializar la estructura `.ai/` y copiar las plantillas de configuración de IDEs de IA en el proyecto.
- `docs/project-integration.md` — Guía detallada para integrar `ai-agents` como submódulo Git.

### Modificado
- `README.md` — Reescrita la guía de integración como un paso a paso detallado y limpio que detalla la estructura y el uso del script `setup-ide.sh`.

---

## [1.1.0] — 2026-06-22

### Agregado

**Estrategia documental:**
- `docs/documentation-strategy.md` — Manifiesto filosófico del sistema documental: conocimiento permanente vs. trabajo por feature, 5 reglas documentales, ciclo de vida de documentos y anti-patrones
- `docs/naming-conventions.md` — Convenciones de nomenclatura: `FEAT-NNN`, `BUG-NNN`, `ARCH-NNN`, branches de Git y commits (Conventional Commits)
- `docs/project-ai-structure.md` — Guía completa de la estructura `.ai/` para proyectos: propósito de cada carpeta (`context.md`, `business-rules.md`, `architecture.md`, `decisions.md`, `glossary.md`, `features/`, `archive/`, `sessions/`)

**Template:**
- `templates/feature-folder-template.md` — Template que documenta la estructura de una carpeta de feature (`FEAT-XXX/`), propósito de cada archivo (`spec.md`, `architecture.md`, `qa.md`, `decision.md`) y ciclo de vida completo

**Workflows (nueva carpeta):**
- `workflows/new-feature.md` — Pipeline completo de nueva feature integrado con `.ai/` y `features/FEAT-XXX/`
- `workflows/bug-fix.md` — Proceso de corrección de bugs con triaje, escalación de críticos y post-mortem
- `workflows/refactor.md` — Workflow de refactorización con principio de comportamiento externo inmutable
- `workflows/release.md` — Proceso de deployment a producción con smoke test en staging, plan de rollback y flujo de hotfix
- `workflows/architecture-change.md` — Cambios estructurales del sistema con ADR obligatorio y enfoque por fases

### Modificado

**Estructura del repositorio (Renombre de Carpeta):**
- Carpeta principal `agents/` renombrada a `roles/` para evitar la redundancia de rutas (`.ai/agents/agents/` -> `.ai/agents/roles/`) al integrar el repositorio como submodule en la ruta recomendada `.ai/agents/`.
- Actualizadas todas las referencias internas y externas en guías de activación, prompts, workflows y documentación para apuntar a `roles/` en lugar de `agents/`.

**Agentes — Sección `Documentation Rules` agregada a todos:**
- `roles/analyst.md` — Reglas para documentos de feature y actualización de docs permanentes (business-rules, glossary)
- `roles/architect.md` — Reglas para architecture.md de feature y actualización de architecture.md global
- `roles/tech-lead.md` — Rol como guardián de los estándares documentales del equipo
- `roles/developer.md` — Scope documental acotado: output del agente y escalación de conocimiento permanente
- `roles/qa.md` — qa.md como único output documental y reporte de conocimiento permanente descubierto
- `roles/devops.md` — Scope de infraestructura y context.md como fuente de verdad operacional

**README principal:**
- Actualizado para reflejar el nuevo sistema documental
- Sección "Sistema Documental" con el modelo de dos niveles y las 5 reglas
- Tabla de convenciones de nomenclatura
- Estructura de carpetas actualizada (workflows/ ahora existe, roles/ reemplaza a agents/)
- Flujo de trabajo con paso de archivado de features
- Buenas prácticas actualizadas con reglas de actualización documental
- Versión bumped a `v1.1.0`

---

## [2.0.1] — 2026-06-22

### Eliminado
- `analyst.md` (raíz) — v1.0 obsoleta, reemplazada por `roles/analyst.md` v2.0
- `architect.md` (raíz) — v1.0 obsoleta, reemplazada por `roles/architect.md` v2.0
- `developer.md` (raíz) — v1.0 obsoleta, reemplazada por `roles/developer.md` v2.0
- `qa.md` (raíz) — v1.0 obsoleta, reemplazada por `roles/qa.md` v2.0
- `tech-lead.md` (raíz) — v1.0 obsoleta, reemplazada por `roles/tech-lead.md` v2.0
- `agent-definitions.md` (raíz) — reemplazado por `docs/agent-definitions.md` con contenido real

### Razón
Los archivos de la raíz eran versiones v1.0 sin headers markdown, sin Chain of Thought, sin output format estructurado y sin guías de activación. Mantenerlos junto a las versiones v2.0 en `roles/` generaba confusión sobre cuál era la fuente canónica. La raíz queda limpia — los agentes viven en `roles/`.

---

## [2.0.0] — 2026-06-22


### Agregado
- `roles/analyst.md` v2.0 — Chain of Thought, Output Format estructurado, guía de activación
- `roles/architect.md` v2.0 — Chain of Thought, Output Format estructurado, guía de activación
- `roles/tech-lead.md` v2.0 — Decision Framework, Chain of Thought, Output Format estructurado
- `roles/developer.md` v2.0 — Chain of Thought, Output Format estructurado, guía de activación
- `roles/qa.md` v2.0 — Clasificación de bugs, Chain of Thought, Output Format estructurado
- `roles/devops.md` v1.0 — Nuevo agente especializado para infraestructura y deployments
- `roles/prompt-guide.md` v1.0 — Guía completa de prompts por agente con ejemplos reales
- `docs/agent-definitions.md` — Meta-documento con estándar de diseño de agentes
- `templates/feature-spec.md` — Template completo para especificaciones funcionales
- `templates/architecture-spec.md` — Template completo para diseños técnicos
- `templates/technical-task.md` — Template para tareas técnicas de desarrollo
- `templates/qa-report.md` — Template para reportes de QA
- `templates/bug-report.md` — Template para reporte de bugs
- `templates/project-context.md` — Template para el contexto del proyecto (`.ai/context.md`)
- `checklists/frontend-review.md` — Checklist de revisión frontend
- `checklists/backend-review.md` — Checklist de revisión backend
- `checklists/database-review.md` — Checklist de revisión de base de datos
- `README.md` — README principal del repositorio
- `.gitignore` — Archivos a ignorar por Git
- `CHANGELOG.md` — Este archivo

### Modificado
- Repositorio inicializado como Git repo con remote `https://github.com/ezequielmendoza-dev/ai-agents.git`
- Rama principal renombrada de `master` a `main`

### Estructura de carpetas establecida
```
agents/       checklists/       docs/       examples/       templates/       workflows/
```

---

## [1.0.0] — 2026-06-01

### Agregado
- `analyst.md` v1.0 — Agente Product Analyst (versión inicial)
- `architect.md` v1.0 — Agente Software Architect (versión inicial)
- `developer.md` v1.0 — Agente Senior Developer (versión inicial)
- `qa.md` v1.0 — Agente QA Engineer (versión inicial)
- `tech-lead.md` v1.0 — Agente Tech Lead (versión inicial)
- `agent-definitions.md` — Template base de estructura de agente

---

*ai-agents library | [github.com/ezequielmendoza-dev/ai-agents](https://github.com/ezequielmendoza-dev/ai-agents)*
