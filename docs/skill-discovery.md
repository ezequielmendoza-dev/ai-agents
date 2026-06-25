# Skill Discovery

El sistema **ai-agents** actúa como un orquestador que descubre y ensambla capacidades (skills) disponibles en el entorno para enriquecer el contexto de los agentes.

ai-agents **no mantiene** una biblioteca de skills tecnológicas (como React, Next.js, o Postgres). En su lugar, detecta estas skills desde múltiples fuentes.

## Fuentes de Descubrimiento

El `Skill Manager` buscará skills en el siguiente orden de prioridad (de mayor a menor):

### 1. Project Skills
Son las skills explícitamente declaradas o alojadas dentro del proyecto actual en el que se está trabajando.
- **Carpetas detectadas:** `.skills/`, `.agents/skills/`, `.ai/skills/` (o cualquier otra declarada en la configuración del proyecto).
- **Propósito:** Capacidades únicas de negocio, adaptaciones súper específicas de tecnologías para el proyecto, reglas de negocio.
- **Prioridad:** Máxima. Sobrescriben cualquier otra skill con el mismo nombre.

### 2. User Installed Skills
Skills instaladas en el entorno local del desarrollador o en la herramienta de IA utilizada (External Skill Providers).
- **Ejemplos:** Skills instaladas globalmente en `~/.gemini/config/plugins/`, configuraciones de Claude Code, u otros agentes CLI.
- **Propósito:** Tecnologías, frameworks y lenguajes que el usuario maneja frecuentemente en múltiples proyectos.
- **Prioridad:** Alta. Aportan el conocimiento tecnológico central.

### 3. Framework Skills
Skills metodológicas y de proceso que vienen *built-in* con la biblioteca `ai-agents`.
- **Ubicación:** `ai-agents/skills/`
- **Ejemplos:** `requirements-discovery`, `domain-modeling`, `code-review`.
- **Propósito:** Enseñar a los agentes **cómo** realizar actividades de ingeniería de software, independientemente de la tecnología.
- **Prioridad:** Media.

### 4. Built-in Model Knowledge
El conocimiento intrínseco pre-entrenado que posee el LLM.
- **Propósito:** Fallback cuando no existe una skill explícita para una tecnología detectada o requerida.
- **Prioridad:** Baja. Siempre es preferible una skill explícita si existe.

## El Proceso de Descubrimiento

1. **Análisis de Entorno:** El Skill Manager analiza la solicitud del usuario, el `package.json`, y los archivos de contexto del proyecto (`.ai/context.md`).
2. **Escaneo de Fuentes:** Escanea las rutas de `Project Skills` y se comunica con los `External Skill Providers` para listar capacidades.
3. **Resolución:** Pasa la lista cruda al motor de [Resolución de Skills](skill-resolution.md) para resolver dependencias y conflictos.
