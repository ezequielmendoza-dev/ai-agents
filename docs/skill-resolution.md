# Skill Resolution

Una vez que el `Skill Manager` ha descubierto un conjunto potencial de skills a partir del [Descubrimiento de Skills](skill-discovery.md), debe resolverlas para crear un subconjunto coherente y óptimo para la tarea.

## Reglas de Resolución

### 1. Resolución de Alias
Las skills descubiertas pueden ser referenciadas por el usuario o por el proyecto mediante alias (ej. "reactjs", "react.js"). El Skill Manager debe normalizar estos alias al identificador único de la skill.
- Si se solicita `reactjs`, y la skill `react` declara el alias `reactjs`, se resuelve a `react`.

### 2. Resolución de Prioridad (Shadowing)
Si se descubre la misma skill (mismo ID o alias) en múltiples fuentes, se aplica la prioridad de fuentes:
1. `Project Skills` sobrescribe a todas.
2. `User Installed Skills` sobrescribe a Framework y Model.
3. `Framework Skills` sobrescribe a Model.

**Ejemplo:** Si el usuario tiene una skill global para `auth` (User Installed), pero el proyecto tiene su propia skill `auth` (Project Skill), el Skill Manager cargará la versión del proyecto e ignorará la global.

### 3. Resolución de Dependencias
Si una skill activada requiere de otras skills para funcionar (ej. `nextjs` depende de `react`), el Skill Manager debe buscar y activar recursivamente las dependencias requeridas usando el mismo proceso de descubrimiento.

### 4. Resolución de Conflictos (Conflict Resolution)
Si el contexto o la tarea intentan activar skills mutuamente excluyentes, el Skill Manager debe:
1. **Revisar el Contexto del Proyecto:** Si el `package.json` o `.ai/context.md` define claramente la tecnología (ej. dice explícitamente "Usamos Express, no NestJS"), se descarta la skill incorrecta.
2. **Preguntar al Usuario:** Si es ambiguo (ej. un proyecto migrando de Vue a React), el Skill Manager *debe detenerse* y solicitar clarificación al usuario en lugar de intentar adivinar o mezclar contextos.

## Resultado de la Resolución

El producto final es un **Skill Activation Report**, que contiene:
- Lista de IDs de skills activadas con sus rutas.
- Fuentes de las cuales fueron cargadas.
- Razón de la activación (solicitado explícitamente, dependencia, detectado en entorno).
- Skills descartadas y el motivo (shadowing, conflicto).
