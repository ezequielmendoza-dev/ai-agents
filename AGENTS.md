# 🤖 ai-agents — Guía para Contribuir al Repositorio

> Este `AGENTS.md` es específico para el desarrollo del **propio repositorio `ai-agents`**.
> No confundir con el template `templates/ide-configs/AGENTS.md`, que es la versión que se instala en los proyectos que consumen esta biblioteca.

---

## 🎯 ¿Qué es este Repositorio?

`ai-agents` es una **biblioteca reutilizable** de agentes, plantillas, workflows y checklists para desarrollo de software asistido por IA. No es un proyecto de software convencional — es un sistema operativo de desarrollo.

### Estructura del Repositorio

```
ai-agents/
├── roles/                    # Definiciones de agentes (v2.0)
│   ├── analyst.md
│   ├── ui-designer.md
│   ├── architect.md
│   ├── tech-lead.md
│   ├── developer.md
│   ├── qa.md
│   ├── devops.md
│   └── prompt-guide.md
├── templates/                # Plantillas reutilizables
│   ├── ide-configs/          # Configuraciones para IDEs de IA
│   └── *.md                  # Templates de documentos de proyecto
├── checklists/               # Checklists por área técnica
├── workflows/                # Flujos de trabajo
├── scripts/                  # Scripts de automatización
├── docs/                     # Documentación del repositorio
├── AGENTS.md                 # ← Este archivo
├── README.md
└── CHANGELOG.md
```

---

## 📋 Reglas para Contribuir

### Reglas Documentales (R1-R5)
Estas reglas aplican también al desarrollo de este repositorio:

| Regla | Enunciado |
| :--- | :--- |
| **R1** | Antes de crear un documento, verificar si existe uno equivalente para actualizar |
| **R2** | Priorizar la **actualización** sobre la creación |
| **R3** | No crear versiones del tipo `architect-v2.md`. Modificar el existente |
| **R4** | Los cambios en roles/workflows deben reflejarse en `CHANGELOG.md` |
| **R5** | Los documentos representan el **estado actual**, no el histórico |

### Convenciones
- **Idioma:** Todo el contenido del repositorio debe estar en **español**.
- **Archivos:** `kebab-case` (ej: `bug-report.md`, `new-feature.md`).
- **Nomenclatura de features:** `FEAT-NNN-slug` en el `CHANGELOG.md`.

---

## 👥 Roles de los Agentes

Los agentes están definidos en `roles/`:

| Agente | Archivo | Responsabilidad |
| :--- | :--- | :--- |
| **Product Analyst** | [analyst.md](file:///Volumes/ExternalSSD/Dev/ai-agents/roles/analyst.md) | Especificaciones funcionales |
| **UI Designer** | [ui-designer.md](file:///Volumes/ExternalSSD/Dev/ai-agents/roles/ui-designer.md) | Diseño de interfaz de usuario y UX |
| **Software Architect** | [architect.md](file:///Volumes/ExternalSSD/Dev/ai-agents/roles/architect.md) | Diseño técnico y ADRs |
| **Tech Lead** | [tech-lead.md](file:///Volumes/ExternalSSD/Dev/ai-agents/roles/tech-lead.md) | Revisión y estándares |
| **Senior Developer** | [developer.md](file:///Volumes/ExternalSSD/Dev/ai-agents/roles/developer.md) | Implementación y tests |
| **QA Engineer** | [qa.md](file:///Volumes/ExternalSSD/Dev/ai-agents/roles/qa.md) | Validación y reportes |
| **DevOps Engineer** | [devops.md](file:///Volumes/ExternalSSD/Dev/ai-agents/roles/devops.md) | CI/CD e infraestructura |

---

## 🔄 Workflows

Los flujos de trabajo están en `workflows/`:

| Workflow | Archivo |
| :--- | :--- |
| Nueva Feature | [new-feature.md](file:///Volumes/ExternalSSD/Dev/ai-agents/workflows/new-feature.md) |
| Corrección de Bugs | [bug-fix.md](file:///Volumes/ExternalSSD/Dev/ai-agents/workflows/bug-fix.md) |
| Refactorización | [refactor.md](file:///Volumes/ExternalSSD/Dev/ai-agents/workflows/refactor.md) |
| Release | [release.md](file:///Volumes/ExternalSSD/Dev/ai-agents/workflows/release.md) |
| Cambio Arquitectónico | [architecture-change.md](file:///Volumes/ExternalSSD/Dev/ai-agents/workflows/architecture-change.md) |

---

## ✅ Checklists de Revisión

Los checklists están en `checklists/` y sirven para validar el cumplimiento de estándares de calidad antes del merge:

| Checklist | Archivo | Propósito |
| :--- | :--- | :--- |
| **Frontend Review** | [frontend-review.md](file:///Volumes/ExternalSSD/Dev/ai-agents/checklists/frontend-review.md) | Revisión de código frontend, semántica HTML y responsividad |
| **UI/UX Review** | [ui-review.md](file:///Volumes/ExternalSSD/Dev/ai-agents/checklists/ui-review.md) | Validación de UI/UX, consistencia visual y a11y |
| **Backend Review** | [backend-review.md](file:///Volumes/ExternalSSD/Dev/ai-agents/checklists/backend-review.md) | Revisión de código backend, API y manejo de errores |
| **Database Review** | [database-review.md](file:///Volumes/ExternalSSD/Dev/ai-agents/checklists/database-review.md) | Revisión de esquemas de BD, queries y migraciones |
| **Security Review** | [security-review.md](file:///Volumes/ExternalSSD/Dev/ai-agents/checklists/security-review.md) | Auditoría de autenticación, input validation y secretos |
| **Performance Review** | [performance-review.md](file:///Volumes/ExternalSSD/Dev/ai-agents/checklists/performance-review.md) | Verificación de tiempos de respuesta, queries óptimas y leaks |
| **Release Review** | [release-review.md](file:///Volumes/ExternalSSD/Dev/ai-agents/checklists/release-review.md) | Checklist operacional para lanzamientos y rollbacks |

---

## ⚙️ Scripts de Automatización

Los scripts se encuentran en `scripts/` y automatizan tareas repetitivas de setup y validación:

| Script | Propósito | Uso |
| :--- | :--- | :--- |
| [`setup-ide.sh`](file:///Volumes/ExternalSSD/Dev/ai-agents/scripts/setup-ide.sh) | Inicializa la estructura `.ai/` y genera reglas de IDE | `bash .ai/agents/scripts/setup-ide.sh` |
| [`new-initiative.sh`](file:///Volumes/ExternalSSD/Dev/ai-agents/scripts/new-initiative.sh) | Bootstrap automático de una feature o bug | `bash .ai/agents/scripts/new-initiative.sh <FEAT\|BUG> <ID> <slug>` |
| [`validate-project.sh`](file:///Volumes/ExternalSSD/Dev/ai-agents/scripts/validate-project.sh) | Valida el cumplimiento de la estructura y reglas en `.ai/` | `bash .ai/agents/scripts/validate-project.sh` |

---

## 📝 Templates para IDEs de IA

Las plantillas de configuración para IDEs están en `templates/ide-configs/`:

| Archivo | IDE Destino | Propósito |
| :--- | :--- | :--- |
| `AGENTS.md` | Todos | Fuente de verdad compartida: roles, workflows, reglas |
| `CLAUDE.md` | Claude Code CLI | Comandos, reglas de terminal, memoria |
| `cursorrules` | Cursor IDE | Reglas para Composer, Chat, edición inline |
| `windsurfrules` | Windsurf (Cascade) | Reglas para flujos de Cascade |
| `clinerules` | Cline / Roo-Code | Control de costos, aprobación de acciones |
| `copilot-instructions.md` | GitHub Copilot | Autocompletado, PR review, workspace agent |

### Cómo Instalar en un Proyecto

```bash
# Desde la raíz del proyecto destino (que ya tiene el submódulo en .ai/agents/)
bash .ai/agents/scripts/setup-ide.sh
```

---

## ⚠️ Qué NO Hacer al Modificar este Repositorio

- No duplicar archivos de roles (usar el existente).
- No crear carpetas `.ai/features/` aquí — este repo no es un proyecto que consume agentes.
- No modificar `templates/ide-configs/AGENTS.md` sin actualizar también este `AGENTS.md` si los cambios son relevantes.
- No agregar contenido específico de un proyecto cliente en los templates genéricos.
