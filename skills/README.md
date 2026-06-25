# 🧩 Skills — Capacidades Técnicas Reutilizables

> **Versión:** 1.0  
> **Propósito:** Separar el conocimiento técnico específico de los roles de los agentes.

---

## ¿Qué es un Skill?

Un **Skill** es una unidad de conocimiento técnico especializado que define las convenciones, patrones, anti-patrones y mejores prácticas de una tecnología, herramienta o disciplina específica.

Los Skills son **independientes de los roles** — cualquier agente puede consumirlos según las necesidades de la tarea.

### Filosofía

| Dimensión | Responde a... |
|-----------|--------------|
| **Roles** (`roles/`) | ¿Quién hace el trabajo? |
| **Skills** (`skills/`) | ¿Qué sabe hacer? |
| **Workflows** (`workflows/`) | ¿Cómo se trabaja? |
| **Context** (`.ai/`) | ¿Dónde se trabaja? |
| **Orchestrator** (Skill Manager) | ¿Cuándo participa cada componente? |

---

## Estructura

```
skills/
├── README.md           ← Este archivo
├── registry.md         ← Registro centralizado (fuente de verdad)
│
├── frontend/           # Skills de frontend
│   ├── react.md
│   ├── nextjs.md
│   ├── mui.md
│   └── shadcn.md
│
├── backend/            # Skills de backend
│   ├── nodejs.md
│   ├── express.md
│   └── nestjs.md
│
├── database/           # Skills de bases de datos y BaaS
│   ├── postgresql.md
│   ├── supabase.md
│   └── firebase.md
│
├── testing/            # Skills de testing
│   ├── vitest.md
│   └── playwright.md
│
├── ux/                 # Skills de UX y accesibilidad
│   ├── accessibility.md
│   └── design-system.md
│
├── devops/             # Skills de DevOps e infraestructura
│   ├── docker.md
│   └── github-actions.md
│
└── ai/                 # Skills de IA y ML
    ├── openai.md
    ├── gemini.md
    └── rag.md
```

---

## Formato de un Skill

Cada skill es un archivo Markdown con **frontmatter YAML** para metadatos y **cuerpo Markdown** para instrucciones.

```markdown
---
id: nombre-del-skill
category: frontend | backend | database | testing | ux | devops | ai
aliases: [alias1, alias2]
tags: [tag1, tag2]
dependencies: [skill-id-1, skill-id-2]
version: 1.0
---

# Nombre del Skill

> Descripción breve de una línea.

## Cuándo Usar Este Skill
[Criterios de activación]

## Convenciones
[Reglas y convenciones de la tecnología]

## Patrones Recomendados
[Patrones de diseño y arquitectura]

## Anti-Patrones
[Errores comunes a evitar]

## Integración con Otros Skills
[Cómo se relaciona con otros skills]
```

---

## Convenciones

### Nomenclatura
- **IDs de skills:** `kebab-case` (ej: `github-actions`, `design-system`)
- **Archivos:** `kebab-case.md` dentro de la categoría correspondiente
- **Categorías:** Nombres en plural, minúsculas

### Reglas
- Un skill = un archivo = una tecnología/herramienta/disciplina
- Los skills **no contienen lógica de negocio** — solo conocimiento técnico
- Los skills son **agnósticos al proyecto** — aplican a cualquier proyecto que use esa tecnología
- Si un skill tiene dependencias, deben estar declaradas en el frontmatter
- El `registry.md` debe actualizarse cada vez que se agrega, modifica o elimina un skill

### Cuándo crear un nuevo skill

| Criterio | ¿Crear skill? |
|----------|--------------|
| Tecnología usada en 2+ proyectos | ✅ Sí |
| Herramienta con convenciones específicas | ✅ Sí |
| Librería trivial sin configuración especial | ❌ No |
| Patrón que ya está cubierto por otro skill | ❌ No — extender el existente |
| Regla de negocio de un proyecto | ❌ No — eso va en `.ai/business-rules.md` |

---

## Cómo se Consumen los Skills

1. El **Skill Manager** (`roles/skill-manager.md`) detecta y activa los skills necesarios
2. Los agentes del pipeline consultan los skills activos antes de trabajar
3. El archivo `.ai/skills.md` del proyecto lista los skills instalados

Ver [`docs/skill-system.md`](../docs/skill-system.md) para la guía completa del ciclo de vida.

---

*Skills versión 1.0 — ai-agents library | github.com/ezequielmendoza-dev/ai-agents*
