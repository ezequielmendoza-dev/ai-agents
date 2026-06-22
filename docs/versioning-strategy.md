# Estrategia de Versionado

> Cómo se versiona el repositorio `ai-agents` y sus componentes.

---

## Principios

1. **El repositorio tiene versión propia** — independiente de los proyectos que lo usan
2. **Los agentes tienen versión propia** — pueden evolucionar a distintas velocidades
3. **El versionado es semántico** — los números tienen significado
4. **Los cambios están documentados** — siempre en `CHANGELOG.md`

---

## Versionado del Repositorio (Git Tags)

El repositorio usa [Semantic Versioning](https://semver.org/) con tags de Git:

```
v[MAJOR].[MINOR].[PATCH]

Ejemplos:
  v1.0.0  — primera versión estable
  v1.1.0  — nuevos agentes o templates (no breaking)
  v1.1.1  — correcciones menores
  v2.0.0  — cambios que rompen compatibilidad o rediseño mayor
```

### Cuándo incrementar cada número

| Tipo | Cuándo | Ejemplo |
|------|--------|---------|
| **MAJOR** | Rediseño de agentes, cambios breaking en output format | v1.x.x → v2.0.0 |
| **MINOR** | Nuevo agente, nuevo template, nueva sección importante | v1.0.x → v1.1.0 |
| **PATCH** | Correcciones, mejoras de redacción, fixes de ejemplos | v1.0.0 → v1.0.1 |

---

## Versionado de Agentes

Cada agente tiene su versión declarada en el encabezado:

```markdown
> **Versión:** 2.0
```

Los agentes usan versionado de dos números `[MAJOR].[MINOR]`:

| Cambio | Versión |
|--------|---------|
| Corrección de constraint mal redactado | `2.0` → `2.1` |
| Nueva sección (ej: Chain of Thought agregado) | `1.0` → `2.0` |
| Rediseño completo del Output Format | `2.x` → `3.0` |

### Historial actual de versiones por agente

| Agente | Versión actual | Cambio principal de v1→v2 |
|--------|---------------|--------------------------|
| `analyst.md` | `2.0` | Chain of Thought + Output estructurado + guía de activación |
| `architect.md` | `2.0` | Chain of Thought + Output estructurado + guía de activación |
| `tech-lead.md` | `2.0` | Decision Framework + Output tabular + veredictos formales |
| `developer.md` | `2.0` | Chain of Thought + Output de implementación estructurado |
| `qa.md` | `2.0` | Clasificación de bugs + Chain of Thought + Output estructurado |
| `devops.md` | `1.0` | Agente nuevo |

---

## Proceso de Release

### 1. Preparar el release

```bash
# Asegurarse de estar en main y actualizado
git checkout main && git pull

# Verificar que no hay cambios sin commitear
git status
```

### 2. Actualizar CHANGELOG.md

```markdown
## [X.Y.Z] — YYYY-MM-DD

### Agregado
- [nuevo agente / template / doc]

### Modificado
- [qué cambió y por qué]

### Eliminado
- [qué se eliminó y por qué]

### Corregido
- [qué se corrigió]
```

### 3. Crear el tag

```bash
git add CHANGELOG.md
git commit -m "chore: prepare release vX.Y.Z"
git tag -a vX.Y.Z -m "Release vX.Y.Z — [descripción breve]"
```

### 4. Push

```bash
git push origin main
git push origin vX.Y.Z
```

---

## Estrategia de Branches

| Branch | Propósito |
|--------|-----------|
| `main` | Versión estable del repositorio |
| `develop` | Trabajo en progreso (opcional, para cambios grandes) |
| `feat/nombre` | Nueva feature o agente |
| `fix/nombre` | Corrección puntual |
| `docs/nombre` | Documentación nueva o actualizada |

Para este repositorio (solo docs, sin código compilado), es suficiente trabajar directo en `main` para cambios pequeños.

---

## Compatibilidad entre Versiones

### Para proyectos que usan ai-agents como submodule

| Versión de ai-agents | Compatibilidad |
|---------------------|----------------|
| `v2.x.x` | Los output formats son estables dentro de la misma MAJOR |
| `v3.0.0` | Breaking — revisar CHANGELOG antes de actualizar |

### Recomendación para proyectos en producción

```bash
# Pinear a una versión específica para estabilidad
cd .ai/agents
git checkout v2.0.1

# Solo actualizar cuando hayas revisado el CHANGELOG
```

---

## Convención de Commits

Este repositorio sigue [Conventional Commits](https://www.conventionalcommits.org/):

```
feat(agents): add devops.md agent for infrastructure tasks
fix(analyst): correct constraint about technical proposals
docs(project-integration): add troubleshooting section
chore: remove legacy v1.0 agent files from root
refactor(templates): improve feature-spec acceptance criteria section
```

| Prefijo | Cuándo usarlo |
|---------|---------------|
| `feat` | Nuevo agente, template, workflow o doc importante |
| `fix` | Corrección de error en instrucciones o ejemplos |
| `docs` | Documentación nueva o actualizada en `docs/` |
| `chore` | Tareas de mantenimiento (gitignore, CHANGELOG, etc.) |
| `refactor` | Mejora sin cambio de comportamiento |

---

*Documentación versión 1.0 — ai-agents library | [github.com/ezequielmendoza-dev/ai-agents](https://github.com/ezequielmendoza-dev/ai-agents)*
