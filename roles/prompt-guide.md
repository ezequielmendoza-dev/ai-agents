# Guía de Prompts — Cómo Usar los Agentes Efectivamente

> **Para quién:** Desarrolladores que usan este repositorio  
> **Objetivo:** Obtener el máximo valor de cada agente  
> **Lectura recomendada:** Antes de usar cualquier agente por primera vez

---

## El Principio Fundamental

Un agente es tan bueno como el contexto que le das.

La diferencia entre un output genérico e inútil y uno preciso y accionable está **completamente en tu prompt**. Los agentes tienen la capacidad — tú debes activarla con el contexto correcto.

---

## Anatomía de un Prompt Efectivo

```markdown
## 1. Activación del agente
"Actúa como el agente [Nombre] definido en roles/[archivo].md"

## 2. Contexto del proyecto (SIEMPRE)
"Contexto del proyecto:
[pegar contenido de .ai/context.md o describir el proyecto en 5-10 líneas]"

## 3. Tarea específica
"[descripción clara de lo que necesitas]"

## 4. Input concreto
"[el artefacto de entrada: requerimiento, spec, código, etc.]"

## 5. Restricciones o foco (opcional)
"Foco especial en: [seguridad / performance / UX / etc.]"
```

---

## Prompts por Agente

### 🔍 Product Analyst

#### Prompt estándar — análisis de nueva feature
```
Actúa como el agente Product Analyst definido en roles/analyst.md.

Contexto del proyecto:
- Nombre: LogiTrack
- Tipo: SaaS de gestión de transporte
- Stack: NestJS + PostgreSQL + React
- Módulos activos: auth, users, trips
- Usuarios: Pasajeros, Conductores, Operadores

Requerimiento a analizar:
"Quiero que los pasajeros puedan calificar al conductor después de cada viaje.
La calificación es con estrellas del 1 al 5 y un comentario opcional."
```

#### Prompt de Bootstrap / Auto-Contextualización de un Proyecto
```
Actúa como el agente Product Analyst definido en roles/analyst.md y genera el archivo `.ai/context.md` de este proyecto basándote en la plantilla `.ai/agents/templates/project-context.md` tras escanear la estructura y archivos de configuración.
```

#### Prompt con contexto de archivo
```
Actúa como el agente Product Analyst definido en roles/analyst.md.

[Pegar contenido completo de .ai/context.md]

Historia de usuario:
Como pasajero, quiero poder cancelar mi reserva desde la app
para no tener que llamar al operador.

Restricciones conocidas:
- El reembolso debe respetar la política de cancelación definida por el operador
- Los conductores no deben ver las cancelaciones en tiempo real (solo al inicio del viaje)
```

#### Prompt de re-análisis por feedback del Tech Lead
```
Actúa como el agente Product Analyst definido en roles/analyst.md.

El Tech Lead rechazó la especificación anterior con este feedback:
[pegar feedback del Tech Lead]

Especificación original:
[pegar la spec rechazada]

Por favor, revisa y corrige los puntos señalados.
```

---

### 🏗️ Software Architect

#### Prompt estándar
```
Actúa como el agente Software Architect definido en roles/architect.md.

Contexto del proyecto:
[pegar .ai/context.md]

Especificación funcional aprobada:
[pegar feature-spec.md completo]

Restricciones técnicas adicionales:
- Debe funcionar con la base de datos PostgreSQL existente (sin cambiar el motor)
- El módulo de pagos ya usa Mercado Pago — reutilizar si es posible
```

#### Prompt con contexto de arquitectura existente
```
Actúa como el agente Software Architect definido en roles/architect.md.

[pegar .ai/context.md]

Arquitectura actual de referencia:
- Los módulos siguen el patrón: entity → repository → service → controller
- Las migraciones usan Prisma Migrate
- Los DTOs usan class-validator para validación

Feature a diseñar:
[pegar feature-spec.md]
```

---

### ⚖️ Tech Lead

#### Prompt de revisión de feature-spec
```
Actúa como el agente Tech Lead definido en roles/tech-lead.md.

[pegar .ai/context.md]

Estoy presentando para revisión la siguiente especificación funcional.
Por favor, evalúa completitud, consistencia y riesgos.

[pegar feature-spec.md]
```

#### Prompt de revisión de diseño técnico
```
Actúa como el agente Tech Lead definido en roles/tech-lead.md.

[pegar .ai/context.md]

Estoy presentando para revisión el siguiente diseño técnico.
Por favor, evalúa solidez, coherencia con la arquitectura existente y riesgos técnicos.

Feature spec de referencia:
[pegar feature-spec.md en resumen]

Diseño técnico a revisar:
[pegar architecture-spec.md]
```

#### Prompt de decisión ante conflicto
```
Actúa como el agente Tech Lead definido en roles/tech-lead.md.

[pegar .ai/context.md]

Hay un conflicto que necesita tu decisión:
- El Analyst especifica que [X]
- El Architect propone implementarlo como [Y]
- El Developer señala que [Y] es técnicamente complejo y propone [Z]

¿Cuál es el camino correcto? ¿Qué agente debe actuar a continuación?
```

---

### 💻 Senior Developer

#### Prompt estándar de implementación
```
Actúa como el agente Senior Developer definido en roles/developer.md.

[pegar .ai/context.md]

Implementa la siguiente tarea técnica:
[pegar technical-task.md]

Diseño técnico aprobado de referencia:
[pegar architecture-spec.md]

Convenciones del proyecto:
- Los servicios se inyectan con el patrón del módulo existente
- Los errores se manejan con la clase HttpException
- Los nombres de archivos en kebab-case
```

#### Prompt de corrección de bug
```
Actúa como el agente Senior Developer definido en roles/developer.md.

[pegar .ai/context.md]

El QA reportó el siguiente bug que debes corregir:
[pegar bug report]

Código actual donde ocurre el bug:
[pegar el código relevante]
```

---

### 🧪 QA Engineer

#### Prompt estándar de validación
```
Actúa como el agente QA Engineer definido en roles/qa.md.

[pegar .ai/context.md]

Feature spec de referencia (criterios de aceptación):
[pegar feature-spec.md]

El Developer completó la implementación con estos cambios:
[pegar el output del Developer o describir los cambios]

Foco especial: validar seguridad en los endpoints de reserva.
```

#### Prompt de re-verificación post bug-fix
```
Actúa como el agente QA Engineer definido en roles/qa.md.

El Developer corrigió los siguientes bugs del reporte anterior:
[listar los bugs corregidos]

Reporte anterior de referencia:
[pegar qa-report.md anterior]

Por favor, verifica:
1. Que los bugs fueron efectivamente corregidos
2. Que la corrección no introdujo nuevos problemas (regression)
```

---

## Errores Comunes y Cómo Evitarlos

### ❌ Error 1: No dar contexto del proyecto
```
❌ Mal:
"Analiza este requerimiento: quiero un sistema de reservas."

✅ Bien:
"Actúa como el Analyst de roles/analyst.md.
Proyecto: LogiTrack — SaaS de transporte. Stack: NestJS + PostgreSQL.
Requerimiento: sistema de reservas de asientos para pasajeros."
```

### ❌ Error 2: Activar el agente incorrecto
```
❌ Mal: Pedirle al Developer que diseñe la arquitectura
❌ Mal: Pedirle al Analyst que proponga tablas de base de datos
❌ Mal: Pedirle al Architect que escriba el código

✅ Bien: Seguir el pipeline. Cada agente en su momento.
```

### ❌ Error 3: Inputs demasiado vagos
```
❌ Mal:
"Revisa el código y dime si está bien."

✅ Bien:
"Actúa como QA Engineer. La feature es reserva de asientos (FEAT-015).
Los criterios de aceptación son: [lista]. El Developer implementó: [descripción].
Valida especialmente los casos de concurrencia."
```

### ❌ Error 4: Saltarse el pipeline
```
❌ Mal: Ir directo al Developer sin feature-spec ni arch-spec
❌ Mal: Hacer QA sin tener los criterios de aceptación documentados

✅ Bien: Analyst → Architect → Tech Lead → Developer → QA
```

---

## Tips Avanzados

### Tip 1: Cadena de agentes en una sola sesión
Puedes activar múltiples agentes en secuencia en la misma conversación:
```
1. "Actúa como Analyst. Analiza este requerimiento: [X]"
   → El AI produce la feature-spec

2. "Ahora actúa como Architect. Diseña la solución técnica para la spec anterior."
   → El AI produce el arch-spec

3. "Ahora actúa como Tech Lead. Revisa ambos documentos anteriores."
   → El AI produce la revisión
```

### Tip 2: Dar el archivo completo del agente como contexto
En algunos IDEs (Cursor, Windsurf) puedes hacer `@roles/analyst.md` para incluir el agente completo automáticamente.

### Tip 3: Usar el contexto del proyecto siempre
La diferencia más grande en la calidad del output viene de tener `.ai/context.md` bien documentado y pegarlo en cada prompt.

### Tip 4: Pedir al agente que haga preguntas antes de responder
```
"Antes de producir el output, pregúntame todo lo que necesites saber
para hacer un análisis completo. No asumas nada."
```

---

*Guía versión 1.0 — ai-agents library | github.com/ezequielmendoza-dev/ai-agents*
