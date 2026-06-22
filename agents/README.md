# Agents

Definiciones de los agentes del sistema. Cada agente tiene un rol específico, restricciones claras y un formato de output estructurado.

---

## Agentes del Pipeline Principal

Estos agentes forman el flujo estándar de desarrollo. Se usan en orden.

| Archivo | Rol | Posición en el pipeline |
|---------|-----|------------------------|
| [`analyst.md`](analyst.md) | Product Analyst | 1° — Especificaciones funcionales |
| [`architect.md`](architect.md) | Software Architect | 2° — Diseño técnico |
| [`tech-lead.md`](tech-lead.md) | Tech Lead | 3° / Supervisor — Revisión y decisiones |
| [`developer.md`](developer.md) | Senior Developer | 4° — Implementación |
| [`qa.md`](qa.md) | QA Engineer | 5° — Validación y calidad |

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
🏗️ architect.md ─────────► architecture-spec.md
        │
        ▼
⚖️ tech-lead.md ◄───────── Revisar ambos documentos
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
