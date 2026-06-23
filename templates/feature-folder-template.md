# Template: Carpeta de Feature

> Usa este documento como guía para crear y mantener la carpeta de cada feature.

---

## Estructura

```
.ai/features/FEAT-NNN-slug-descriptivo/
├── spec.md           # Especificación funcional
├── ui-design.md      # Diseño visual de interfaz
├── architecture.md   # Diseño técnico
├── qa.md             # Reporte de QA
└── decision.md       # Decisiones específicas de esta feature
```

---

## Cómo crear una nueva carpeta de feature

```bash
# Reemplazar NNN con el número siguiente al último FEAT registrado en .ai/context.md
# Reemplazar "slug-descriptivo" con un nombre en kebab-case

mkdir -p .ai/features/FEAT-001-nombre-feature
touch .ai/features/FEAT-001-nombre-feature/spec.md
touch .ai/features/FEAT-001-nombre-feature/ui-design.md
touch .ai/features/FEAT-001-nombre-feature/architecture.md
touch .ai/features/FEAT-001-nombre-feature/qa.md
touch .ai/features/FEAT-001-nombre-feature/decision.md
```

Actualizar el registro de IDs en `.ai/context.md`:
```markdown
## Registro de IDs
- Último FEAT asignado: FEAT-001  ← actualizar este valor
```

---

## `spec.md` — Especificación Funcional

**Responsable:** Product Analyst  
**Cuándo se crea:** Al inicio de la feature, antes de cualquier diseño técnico  
**Cuándo se actualiza:** Si el Tech Lead rechaza y pide revisión, o si hay preguntas abiertas que se resuelven

**Propósito:** Define **qué** debe hacer la feature desde la perspectiva del usuario y del negocio. No describe implementación técnica.

**Contenido:**

```markdown
# Especificación Funcional: [Nombre de la Feature]

**Feature ID:** FEAT-NNN  
**Versión:** 1.0  
**Estado:** Draft | En revisión | Aprobada  
**Autor:** Product Analyst  
**Fecha:** YYYY-MM-DD

---

## Objetivo
[Qué problema resuelve y para quién]

## Actores
| Actor | Tipo | Rol |
|-------|------|-----|
| [Actor] | Humano / Sistema | [qué hace] |

## Casos de Uso
[CU-01, CU-02, ...]

## Reglas de Negocio
| ID | Regla | Fuente |
|----|-------|--------|
| RN-01 | [regla] | [origen] |

## Criterios de Aceptación
- [ ] [criterio verificable]

## Preguntas Abiertas
| ID | Pregunta | Criticidad |
|----|----------|------------|
| PA-01 | [pregunta] | Blocker/Alta/Media/Baja |
```

**Template completo:** [`templates/feature-spec.md`](../../templates/feature-spec.md)

---

## `ui-design.md` — Diseño de Interfaz (UI/UX)

**Responsable:** UI Designer  
**Cuándo se crea:** Después de que `spec.md` es aprobada por el Tech Lead  
**Cuándo se actualiza:** Si el Tech Lead rechaza el diseño visual, o si durante la implementación o arquitectura se requiere un ajuste en la interfaz

**Propósito:** Define **cómo se ve y se comporta** la interfaz de usuario. Contiene layouts, componentes, estados (loading, success, error, empty) y lineamientos de accesibilidad.

**Contenido:**

```markdown
# Diseño de Interfaz: [Nombre de la Feature]

**Feature ID:** FEAT-NNN  
**Versión:** 1.0  
**Estado:** Draft | En revisión | Aprobado  
**Autor:** UI Designer  
**Fecha:** YYYY-MM-DD

---

## Concepto Visual
[Dirección visual, colores y tipografía]

## Layout y Pantallas
[Estructura y distribución de vistas]

## Componentes UI
[Nuevos y reutilizados con estados de interacción]

## Estados de la UI
[Loading, Success, Error, Empty]

## Adaptabilidad
[Diseño mobile, tablet y desktop]

## Accesibilidad
[Contrasto, tab index, ARIA y roles]
```

**Template completo:** [`templates/ui-design-spec.md`](../../templates/ui-design-spec.md)

---

## `architecture.md` — Diseño Técnico

**Responsable:** Software Architect  
**Cuándo se crea:** Después de que `spec.md` es aprobada por el Tech Lead  
**Cuándo se actualiza:** Si el Tech Lead rechaza el diseño, o si durante la implementación se detecta un problema de diseño

**Propósito:** Define **cómo** se implementa la feature técnicamente. No modifica los requerimientos funcionales.

**Contenido:**

```markdown
# Diseño Técnico: [Nombre de la Feature]

**Arch Spec ID:** ARCH-NNN (si genera una decisión global)  
**Feature ID:** FEAT-NNN  
**Versión:** 1.0  
**Estado:** Draft | En revisión | Aprobado  
**Autor:** Software Architect  
**Fecha:** YYYY-MM-DD

---

## Resumen Técnico
[3-5 líneas describiendo la solución]

## Entidades
[Entidades nuevas o modificadas]

## APIs
[Endpoints con contratos]

## Flujos Técnicos
[Diagramas Mermaid si el flujo es complejo]

## Tareas Técnicas
| # | Tarea | Estimación | Depende de |
|---|-------|------------|------------|
| 1 | [tarea] | [tiempo] | — |

## Riesgos Técnicos
| ID | Riesgo | Criticidad | Mitigación |
|----|--------|------------|------------|
```

**Template completo:** [`templates/architecture-spec.md`](../../templates/architecture-spec.md)

---

## `qa.md` — Reporte de QA

**Responsable:** QA Engineer  
**Cuándo se crea:** Cuando el Developer completa la implementación  
**Cuándo se actualiza:** Cuando el Developer corrige bugs reportados y se necesita re-validar

**Propósito:** Documenta el estado de calidad de la implementación. Es la última puerta antes de que la feature llegue a producción.

**Contenido:**

```markdown
# QA Report: [Nombre de la Feature]

**QA Report ID:** QA-NNN  
**Feature ID:** FEAT-NNN  
**Fecha:** YYYY-MM-DD  
**Entorno:** Development / Staging  
**Versión revisada:** [branch o commit]

---

## Resultado Final
✅ PASS / ⚠️ PASS WITH OBSERVATIONS / ❌ FAIL

## Cobertura de Criterios de Aceptación
| # | Criterio | Estado | Observación |
|---|----------|--------|-------------|

## Bugs Detectados
[Si no hay bugs: "Sin bugs detectados."]

## Escenarios de Prueba Ejecutados
| ID | Escenario | Resultado |
|----|-----------|-----------|
```

**Template completo:** [`templates/qa-report.md`](../../templates/qa-report.md)

---

## `decision.md` — Decisiones de la Feature

**Responsable:** Tech Lead / Architect  
**Cuándo se crea:** Cuando se toma una decisión técnica significativa durante el desarrollo de la feature  
**Cuándo se actualiza:** Cuando aparece una nueva decisión en el contexto de esta feature

**Propósito:** Registra las decisiones no triviales tomadas **durante** el desarrollo de esta feature específica. Las decisiones que impactan el sistema globalmente deben también registrarse en `.ai/decisions.md`.

**Contenido:**

```markdown
# Decisiones: [Nombre de la Feature]

**Feature ID:** FEAT-NNN

---

## Decisión 1: [Título]

**Fecha:** YYYY-MM-DD  
**Tomada por:** [Tech Lead / Architect]  
**Impacto:** Solo esta feature / Global (registrar en .ai/decisions.md también)

### Contexto
[Por qué fue necesario decidir]

### Decisión
[Qué se decidió]

### Alternativas descartadas
- **[Alternativa]:** [por qué se descartó]

### Consecuencias
[Qué implica esta decisión]

---

## Decisión 2: [Título]
...
```

---

## Ciclo de vida de la feature

```
FEAT-NNN creada
     ↓
spec.md (Analyst) → revisión Tech Lead
     ↓ Aprobada
ui-design.md (UI Designer)
     ↓
architecture.md (Architect) → revisión Tech Lead (UI y Técnico)
     ↓ Aprobado
Implementación (Developer)
     ↓
qa.md (QA Engineer) → PASS
     ↓
Tech Lead: veredicto final → Producción
     ↓
Mover carpeta a .ai/archive/FEAT-NNN-slug/
```

---

## Reglas de la carpeta de feature

- ✅ Los documentos se actualizan en el lugar — no se crean versiones (`spec-v2.md`)
- ✅ Si el Tech Lead rechaza y pide revisión, se actualiza el mismo documento
- ✅ Registrar el historial de cambios importantes en el campo `Versión` del documento
- ❌ No crear documentos adicionales fuera de estos 4 archivos sin justificación
- ❌ No compartir información entre features via estos documentos (cada feature es independiente)
- ❌ No dejar la carpeta en `features/` cuando la feature ya está en producción

---

*Feature folder template v1.0 — ai-agents library | github.com/ezequielmendoza-dev/ai-agents*
