# CHANGELOG

Todas los cambios notables en este repositorio se documentan en este archivo.

Formato basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/).

---

## [2.0.1] — 2026-06-22

### Eliminado
- `analyst.md` (raíz) — v1.0 obsoleta, reemplazada por `agents/analyst.md` v2.0
- `architect.md` (raíz) — v1.0 obsoleta, reemplazada por `agents/architect.md` v2.0
- `developer.md` (raíz) — v1.0 obsoleta, reemplazada por `agents/developer.md` v2.0
- `qa.md` (raíz) — v1.0 obsoleta, reemplazada por `agents/qa.md` v2.0
- `tech-lead.md` (raíz) — v1.0 obsoleta, reemplazada por `agents/tech-lead.md` v2.0
- `agent-definitions.md` (raíz) — reemplazado por `docs/agent-definitions.md` con contenido real

### Razón
Los archivos de la raíz eran versiones v1.0 sin headers markdown, sin Chain of Thought, sin output format estructurado y sin guías de activación. Mantenerlos junto a las versiones v2.0 en `agents/` generaba confusión sobre cuál era la fuente canónica. La raíz queda limpia — los agentes viven en `agents/`.

---

## [2.0.0] — 2026-06-22


### Agregado
- `agents/analyst.md` v2.0 — Chain of Thought, Output Format estructurado, guía de activación
- `agents/architect.md` v2.0 — Chain of Thought, Output Format estructurado, guía de activación
- `agents/tech-lead.md` v2.0 — Decision Framework, Chain of Thought, Output Format estructurado
- `agents/developer.md` v2.0 — Chain of Thought, Output Format estructurado, guía de activación
- `agents/qa.md` v2.0 — Clasificación de bugs, Chain of Thought, Output Format estructurado
- `agents/devops.md` v1.0 — Nuevo agente especializado para infraestructura y deployments
- `agents/prompt-guide.md` v1.0 — Guía completa de prompts por agente con ejemplos reales
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
