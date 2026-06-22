# Integración de ai-agents en Proyectos

> **Audiencia:** Desarrolladores que quieren usar esta biblioteca en sus proyectos  
> **Prerequisito:** Tener acceso a [github.com/ezequielmendoza-dev/ai-agents](https://github.com/ezequielmendoza-dev/ai-agents)

---

## Tabla de Contenidos

1. [Filosofía de integración](#1-filosofía-de-integración)
2. [Estructura .ai/ en cada proyecto](#2-estructura-ai-en-cada-proyecto)
3. [Integración con Git Submodules](#3-integración-con-git-submodules)
4. [Mantener los agentes sincronizados](#4-mantener-los-agentes-sincronizados)
5. [Configurar el contexto del proyecto](#5-configurar-el-contexto-del-proyecto)
6. [Integración con IDEs](#6-integración-con-ides)
7. [Compartir contexto entre proyectos](#7-compartir-contexto-entre-proyectos)
8. [Ejemplos por tipo de proyecto](#8-ejemplos-por-tipo-de-proyecto)
9. [Troubleshooting](#9-troubleshooting)

---

## 1. Filosofía de Integración

El principio fundamental es **referenciar, nunca copiar**.

```
❌ MAL: Copiar los archivos de ai-agents dentro del proyecto
✅ BIEN: Referenciar ai-agents desde el proyecto vía Git Submodule
```

**Por qué submodule y no copia:**

| | Copia | Submodule |
|--|-------|-----------|
| Actualizaciones de agentes | Manual en cada proyecto | `git submodule update` |
| Sincronización | Imposible a escala | Automática |
| Fuente de verdad | Múltiple (deriva) | Única |
| Tamaño del repo | Crece | Solo una referencia |

---

## 2. Estructura `.ai/` en cada Proyecto

Cada proyecto que usa `ai-agents` debe tener una carpeta `.ai/` en su raíz:

```
mi-proyecto/
├── src/
├── .ai/
│   ├── agents/          ← Git Submodule apuntando a ai-agents
│   ├── context.md       ← Contexto del proyecto (basado en templates/project-context.md)
│   └── sessions/        ← Sesiones de trabajo (ignorado por git del proyecto)
├── .gitignore
└── README.md
```

### ¿Qué va en `.ai/`?

| Archivo/Carpeta | Origen | Descripción |
|----------------|--------|-------------|
| `agents/` | Git Submodule de `ai-agents` | Todos los agentes, templates, checklists y workflows |
| `context.md` | Completado manualmente | Memoria del proyecto — se actualiza con el tiempo |
| `sessions/` | Generado localmente | Conversaciones o notas de sesiones de trabajo (no se commitea) |

### Agregar `.ai/sessions/` al `.gitignore` del proyecto

```gitignore
# AI sessions — trabajo local, no compartir en el repo del proyecto
.ai/sessions/
```

---

## 3. Integración con Git Submodules

### 3.1 Agregar ai-agents a un proyecto nuevo

```bash
# Desde la raíz del proyecto
mkdir -p .ai
git submodule add https://github.com/ezequielmendoza-dev/ai-agents.git .ai/agents
git commit -m "chore: add ai-agents as submodule in .ai/agents"
```

Esto crea:
- La carpeta `.ai/agents/` con todo el contenido de `ai-agents`
- El archivo `.gitmodules` en la raíz del proyecto

```ini
# .gitmodules (generado automáticamente)
[submodule ".ai/agents"]
    path = .ai/agents
    url = https://github.com/ezequielmendoza-dev/ai-agents.git
```

---

### 3.2 Clonar un proyecto que ya tiene el submodule

```bash
# Opción A: clonar incluyendo submodules en un solo comando
git clone --recurse-submodules https://github.com/tu-org/mi-proyecto.git

# Opción B: clonar primero, inicializar submodule después
git clone https://github.com/tu-org/mi-proyecto.git
cd mi-proyecto
git submodule update --init --recursive
```

---

### 3.3 Verificar el estado del submodule

```bash
# Ver estado del submodule (commit al que apunta)
git submodule status

# Ejemplo de output:
# acb08b8 .ai/agents (v2.0.1)
```

---

## 4. Mantener los Agentes Sincronizados

### 4.1 Actualizar al último commit de ai-agents

```bash
# Desde la raíz del proyecto
git submodule update --remote .ai/agents

# Verificar qué cambió
cd .ai/agents && git log --oneline -5

# Commitear la actualización en el proyecto
cd ../..
git add .ai/agents
git commit -m "chore: update ai-agents submodule to latest"
```

### 4.2 Actualizar a una versión específica (tag)

```bash
cd .ai/agents
git checkout v2.1.0       # apuntar a un tag específico
cd ../..
git add .ai/agents
git commit -m "chore: pin ai-agents to v2.1.0"
```

### 4.3 Estrategia recomendada por tipo de proyecto

| Proyecto | Estrategia | Razón |
|----------|------------|-------|
| En desarrollo activo | Usar `main` branch, actualizar frecuentemente | Beneficiarse de mejoras |
| En producción estable | Pinear a un tag | Estabilidad ante cambios inesperados |
| Proyecto crítico | Pinear + revisar CHANGELOG antes de actualizar | Control total |

---

## 5. Configurar el Contexto del Proyecto

El archivo `.ai/context.md` es **la memoria del proyecto**. Es lo primero que leerá cualquier agente.

### 5.1 Crear el contexto inicial

```bash
# Copiar el template desde ai-agents
cp .ai/agents/templates/project-context.md .ai/context.md
```

Luego completar todos los campos del template. Ver [`templates/project-context.md`](../templates/project-context.md).

### 5.2 Secciones mínimas obligatorias

Un `context.md` mínimo efectivo debe tener:

```markdown
## Nombre y tipo del proyecto
## Stack tecnológico (con versiones)
## Módulos existentes y su estado
## Convenciones del proyecto (naming, estructura)
## Decisiones técnicas importantes
## Restricciones conocidas
```

### 5.3 Mantener el contexto actualizado

El `context.md` debe actualizarse cuando:

- [ ] Se agrega un nuevo módulo al proyecto
- [ ] Se toma una decisión técnica importante (agregar como ADR)
- [ ] Cambia el stack o una dependencia crítica
- [ ] Se incorpora un nuevo integrante al equipo
- [ ] Se completa una fase importante del proyecto

```bash
# El context.md SÍ debe estar en el repo del proyecto
git add .ai/context.md
git commit -m "docs: update project context - add bookings module"
```

---

## 6. Integración con IDEs

### 6.1 Cursor IDE

Crear `.cursorrules` en la raíz del proyecto:

```markdown
# Reglas para Cursor en este proyecto

## Contexto del proyecto
Antes de cualquier tarea, lee `.ai/context.md` para entender el proyecto.

## Agentes disponibles
Los agentes están en `.ai/agents/roles/`. Úsalos según el tipo de tarea:
- Nueva feature → `.ai/agents/roles/analyst.md`
- Diseño técnico → `.ai/agents/roles/architect.md`
- Supervisión → `.ai/agents/roles/tech-lead.md`
- Implementación → `.ai/agents/roles/developer.md`
- Validación → `.ai/agents/roles/qa.md`
- CI/CD/Deploy → `.ai/agents/roles/devops.md`

## Workflow estándar
Seguir el pipeline: Analyst → Architect → Tech Lead → Developer → QA

## Templates
Los templates están en `.ai/agents/templates/`

## Guía de prompts
Ver `.ai/agents/roles/prompt-guide.md` para ejemplos de activación de agentes.
```

### 6.2 Windsurf / Cline / Continue

Estos IDEs leen archivos de contexto de distintas formas. La estructura `.ai/` es compatible con todos:

```bash
# En Windsurf — referenciar el agente directamente
@.ai/agents/roles/analyst.md

# En Cline — incluir como documento de contexto
/add .ai/context.md
/add .ai/agents/roles/analyst.md
```

### 6.3 VS Code (con extensiones de AI)

Agregar a `.vscode/settings.json`:

```json
{
  "ai.contextFiles": [
    ".ai/context.md",
    ".ai/agents/roles/prompt-guide.md"
  ]
}
```

---

## 7. Compartir Contexto entre Proyectos

### 7.1 El problema

Cuando tienes múltiples proyectos (LogiTrack, ControlFit, SaaS-X), cada uno tiene su propio `context.md`. Pero hay información que es común: tu stack preferido, tus convenciones globales, tus servicios compartidos.

### 7.2 Solución: `global-context.md` en ai-agents

Mantener en `ai-agents` un archivo de contexto global que aplica a todos tus proyectos:

```
ai-agents/
└── context/
    └── global-context.md    ← convenciones, stack base, servicios compartidos
```

```markdown
# global-context.md — aplica a todos los proyectos

## Stack base preferido
- Backend: NestJS + TypeScript
- Base de datos: PostgreSQL + Prisma
- Frontend: React + TypeScript + Vite
- Auth: Firebase Auth
- Deploy: Firebase / Vercel

## Convenciones globales
- Archivos: kebab-case
- Clases: PascalCase
- Variables: camelCase
- APIs: /api/v1/resources

## Servicios compartidos
- Autenticación: Firebase Auth (proyecto: mi-firebase-project)
- Pagos: Mercado Pago
- Email: SendGrid
```

Luego en cada proyecto, el `context.md` referencia el global:

```markdown
# .ai/context.md

> Ver contexto global: `.ai/agents/context/global-context.md`

## Contexto específico de este proyecto
[solo lo que es único de este proyecto]
```

### 7.3 Contexto por dominio

Si tienes proyectos en el mismo dominio (ej: varios proyectos de logística), puedes mantener contextos de dominio:

```
ai-agents/
└── context/
    ├── global-context.md
    ├── logistics-domain.md    ← reglas de negocio comunes de logística
    └── fitness-domain.md      ← reglas de negocio comunes de fitness/gym
```

---

## 8. Ejemplos por Tipo de Proyecto

### Proyecto SaaS (NestJS + React)

```bash
# Setup inicial
mkdir -p .ai
git submodule add https://github.com/ezequielmendoza-dev/ai-agents.git .ai/agents
cp .ai/agents/templates/project-context.md .ai/context.md

# Estructura final
mi-saas/
├── backend/              # NestJS
├── frontend/             # React
├── .ai/
│   ├── agents/           # Submodule ai-agents
│   └── context.md        # Contexto completado
└── .cursorrules
```

### Proyecto Firebase (App Móvil)

```bash
mi-app-movil/
├── lib/                  # Flutter / React Native
├── functions/            # Firebase Functions
├── .ai/
│   ├── agents/           # Submodule ai-agents
│   └── context.md
└── .cursorrules
```

### Script de Automatización

```bash
# Para proyectos simples, el submodule puede ser más ligero
# Usar sparse checkout para traer solo lo necesario
git submodule add https://github.com/ezequielmendoza-dev/ai-agents.git .ai/agents
cd .ai/agents
git sparse-checkout init --cone
git sparse-checkout set agents templates
```

---

## 9. Troubleshooting

### El submodule aparece vacío después de clonar

```bash
# Solución
git submodule update --init --recursive
```

### El submodule está en estado "detached HEAD"

```bash
# Es normal — los submodules apuntan a un commit específico
# Para ver a qué commit apunta:
cd .ai/agents && git log --oneline -1

# Para actualizar al último:
git submodule update --remote .ai/agents
```

### Conflictos al hacer pull con cambios en el submodule

```bash
# Si el submodule tiene conflictos:
cd .ai/agents
git checkout main
git pull origin main
cd ../..
git add .ai/agents
git commit -m "chore: resolve submodule conflict"
```

### El IDE no encuentra los archivos del agente

Verificar que el submodule está inicializado:
```bash
ls .ai/agents/roles/  # debe listar los archivos .md
# Si está vacío:
git submodule update --init
```

---

*Documentación versión 1.0 — ai-agents library | [github.com/ezequielmendoza-dev/ai-agents](https://github.com/ezequielmendoza-dev/ai-agents)*
