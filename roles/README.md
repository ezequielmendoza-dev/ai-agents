# Agents

Definiciones de los agentes del sistema. Cada agente tiene un rol específico, restricciones claras y un formato de output estructurado.

---

## Agentes del Pipeline Principal

Estos agentes forman el flujo estándar de desarrollo. Se usan en orden.

| Archivo | Rol | Posición en el pipeline |
|---------|-----|------------------------|
| [`analyst.md`](analyst.md) | Product Analyst | 1° — Especificaciones funcionales |
| [`ui-designer.md`](ui-designer.md) | UI Designer | 2° — Diseño visual y de interfaz (UI/UX) |
| [`architect.md`](architect.md) | Software Architect | 3° — Diseño técnico |
| [`tech-lead.md`](tech-lead.md) | Tech Lead | 4° / Supervisor — Revisión y decisiones |
| [`developer.md`](developer.md) | Senior Developer | 5° — Implementación |
| [`qa.md`](qa.md) | QA Engineer | 6° — Validación y calidad |

## Agentes Especializados

Estos agentes se activan bajo demanda, no siguen el pipeline estándar.

| Archivo | Rol | Cuándo activarlo |
|---------|-----|-----------------|
| [`devops.md`](devops.md) | DevOps / Infrastructure Engineer | CI/CD, deployments, setup de entornos, incidentes |

---

## Pipeline Visual

```
💡 Idea / Requerimiento
        │
        ▼
🔍 analyst.md ──────────► feature-spec.md
        │
        ▼
🎨 ui-designer.md ──────► ui-design.md
        │
        ▼
🏗️ architect.md ─────────► architecture-spec.md
        │
        ▼
⚖️ tech-lead.md ◄───────── Revisar documentos (spec, UI, arquitectura)
        │
   ┌────┴────┐
   ▼         ▼
APROBADO  RECHAZADO
   │         │
   │         └──► Volver al agente correspondiente
   ▼
💻 developer.md ─────────► código + technical-task.md
        │
        ▼
🧪 qa.md ────────────────► qa-report.md
        │
        ▼
⚖️ tech-lead.md ◄───────── Veredicto final
        │
        ▼
🚀 Producción
```

---

## Recursos

- **Guía de prompts:** [`prompt-guide.md`](prompt-guide.md) — Cómo activar cada agente efectivamente
- **Definición de estructura:** [`../docs/agent-definitions.md`](../docs/agent-definitions.md) — Estándar que siguen todos los agentes
- **Templates de output:** [`../templates/`](../templates/) — Archivos de referencia para los outputs

---

## Versiones

Todos los agentes están en versión **2.0**.  
Ver [`../CHANGELOG.md`](../CHANGELOG.md) para el historial de cambios.

---

*ai-agents library | [github.com/ezequielmendoza-dev/ai-agents](https://github.com/ezequielmendoza-dev/ai-agents)*
