# Workflow: Nueva Feature

> **Versión:** 1.0  
> **Agentes involucrados:** Analyst → Architect → Tech Lead → Developer → QA → DevOps (si aplica)

---

## Cuándo usar este workflow

- Se solicita implementar una funcionalidad nueva
- La feature no existe en ninguna forma en el sistema
- Hay un requerimiento del stakeholder que necesita especificarse y construirse

---

## Flujo

```mermaid
flowchart TD
    A[💡 Requerimiento del stakeholder] --> B[Verificar .ai/context.md y business-rules.md]
    B --> C[🔍 Analyst: Crear spec.md en FEAT-XXX]
    C --> D{Tech Lead: Revisar spec}
    D -->|Rechazado| C
    D -->|Aprobado| E[🏗️ Architect: Crear architecture.md en FEAT-XXX]
    E --> F{Tech Lead: Revisar diseño}
    F -->|Rechazado| E
    F -->|Aprobado| G[💻 Developer: Implementar]
    G --> H[🧪 QA: Crear qa.md en FEAT-XXX]
    H --> I{Resultado QA}
    I -->|FAIL| G
    I -->|PASS / PASS WITH OBS| J{Tech Lead: Veredicto final}
    J -->|Rechazado| G
    J -->|Aprobado| K[🚀 DevOps: Deployment]
    K --> L[📁 Mover FEAT-XXX a archive/]
    L --> M[📝 Actualizar docs permanentes si aplica]
```

---

## Pasos Detallados

### Paso 0 — Preparación

Antes de iniciar cualquier trabajo:

1. Leer `.ai/context.md` para entender el sistema actual
2. Leer `.ai/business-rules.md` para conocer las restricciones de negocio
3. Leer `.ai/architecture.md` para entender la arquitectura vigente
4. Consultar `.ai/decisions.md` para conocer decisiones relevantes anteriores
5. **Asignar el ID de la feature** consultando el Registro de IDs en `context.md`
6. Crear la carpeta `.ai/features/FEAT-NNN-slug/`

```bash
mkdir -p .ai/features/FEAT-NNN-slug
touch .ai/features/FEAT-NNN-slug/spec.md
touch .ai/features/FEAT-NNN-slug/architecture.md
touch .ai/features/FEAT-NNN-slug/qa.md
touch .ai/features/FEAT-NNN-slug/decision.md
```

7. Actualizar el Registro de IDs en `.ai/context.md`

---

### Paso 1 — Especificación Funcional (Analyst)

**Agente:** Product Analyst  
**Output:** `.ai/features/FEAT-NNN-slug/spec.md`  
**Template:** [`templates/feature-spec.md`](../templates/feature-spec.md)

**Activación:**

```
Actúa como el agente Product Analyst definido en roles/analyst.md.

Contexto del proyecto: [contenido de .ai/context.md]
Reglas de negocio: [contenido de .ai/business-rules.md]

Feature a especificar: FEAT-NNN — [nombre]

Requerimiento:
[descripción del requerimiento]
```

**Criterio de salida:** `spec.md` completa, sin preguntas abiertas bloqueantes, lista para revisión del Tech Lead.

---

### Paso 2 — Revisión de Especificación (Tech Lead)

**Agente:** Tech Lead  
**Veredictos posibles:** APROBADO / APROBADO CON OBSERVACIONES / RECHAZADO

Si es **RECHAZADO** → volver al Paso 1 con el feedback del Tech Lead.  
Si es **APROBADO** → continuar al Paso 3.

**Activación:**

```
Actúa como el agente Tech Lead definido en roles/tech-lead.md.

Contexto del proyecto: [contenido de .ai/context.md]

Estoy presentando para revisión: feature-spec

[contenido de .ai/features/FEAT-NNN-slug/spec.md]
```

---

### Paso 3 — Diseño Técnico (Architect)

**Agente:** Software Architect  
**Output:** `.ai/features/FEAT-NNN-slug/architecture.md`  
**Template:** [`templates/architecture-spec.md`](../templates/architecture-spec.md)

Si el diseño requiere cambios en la arquitectura global, actualizar `.ai/architecture.md` en este paso.

**Activación:**

```
Actúa como el agente Software Architect definido en roles/architect.md.

Contexto del proyecto: [contenido de .ai/context.md]
Arquitectura actual: [contenido de .ai/architecture.md]

Especificación funcional a diseñar:
[contenido de .ai/features/FEAT-NNN-slug/spec.md]
```

---

### Paso 4 — Revisión de Diseño (Tech Lead)

**Agente:** Tech Lead  
**Veredictos posibles:** APROBADO / APROBADO CON OBSERVACIONES / RECHAZADO

Si es **RECHAZADO** → volver al Paso 3 con el feedback del Tech Lead.  
Si hay decisiones de arquitectura importantes → registrar en `.ai/decisions.md`.  
Si es **APROBADO** → continuar al Paso 5.

---

### Paso 5 — Implementación (Developer)

**Agente:** Senior Developer  
**Template de referencia:** [`templates/technical-task.md`](../templates/technical-task.md)

**Activación:**

```
Actúa como el agente Senior Developer definido en roles/developer.md.

Contexto del proyecto: [contenido de .ai/context.md]

Tarea a implementar:
[descripción de la tarea técnica]

Especificación de referencia:
[contenido de .ai/features/FEAT-NNN-slug/spec.md]

Diseño de referencia:
[contenido de .ai/features/FEAT-NNN-slug/architecture.md]
```

**Criterio de salida:** Implementación completa y funcional, lista para QA.

---

### Paso 6 — Validación de Calidad (QA)

**Agente:** QA Engineer  
**Output:** `.ai/features/FEAT-NNN-slug/qa.md`  
**Template:** [`templates/qa-report.md`](../templates/qa-report.md)

**Activación:**

```
Actúa como el agente QA Engineer definido en roles/qa.md.

Contexto del proyecto: [contenido de .ai/context.md]

Feature spec de referencia:
[contenido de .ai/features/FEAT-NNN-slug/spec.md]

Diseño técnico de referencia:
[contenido de .ai/features/FEAT-NNN-slug/architecture.md]

Implementación a revisar:
[descripción de los cambios implementados]
```

Si el resultado es **FAIL** → volver al Paso 5 con los bugs reportados.  
Si el resultado es **PASS** o **PASS WITH OBSERVATIONS** → continuar al Paso 7.

---

### Paso 7 — Veredicto Final (Tech Lead)

**Agente:** Tech Lead  
**Acción:** Revisar el reporte de QA y emitir veredicto final de deployment.

---

### Paso 8 — Deployment (DevOps)

**Agente:** DevOps Engineer (bajo demanda del Tech Lead)  
**Workflow:** Ver [`workflows/release.md`](release.md) para el proceso de deployment.

---

### Paso 9 — Cierre de Feature

Cuando la feature está en producción:

1. **Mover** la carpeta al archivo histórico:
   ```bash
   mv .ai/features/FEAT-NNN-slug .ai/archive/FEAT-NNN-slug
   ```

2. **Actualizar** los documentos permanentes si la feature cambió algo global:
   - `.ai/architecture.md` si cambió la arquitectura del sistema
   - `.ai/business-rules.md` si se incorporaron nuevas reglas permanentes
   - `.ai/glossary.md` si aparecieron nuevos términos del dominio
   - `.ai/decisions.md` si hay decisiones que aplican globalmente

3. **Actualizar** el `CHANGELOG.md` del proyecto con la feature completada.

---

## Checklist de Cierre de Feature

- [ ] `spec.md` en estado `Aprobada`
- [ ] `architecture.md` en estado `Aprobado`
- [ ] `qa.md` en estado `PASS` o `PASS WITH OBSERVATIONS` resueltas
- [ ] Veredicto del Tech Lead: `APROBADO`
- [ ] Código en rama principal / producción
- [ ] Documentos permanentes actualizados si fue necesario
- [ ] Feature movida a `archive/`
- [ ] `CHANGELOG.md` actualizado

---

*Workflow new-feature v1.0 — ai-agents library | github.com/ezequielmendoza-dev/ai-agents*
