# Skill Context

Cuando el `Skill Manager` activa una skill y se la pasa a un Agente (por ejemplo, el `Developer`), esa skill se convierte en una pieza fundamental del **Contexto Enriquecido** del agente.

## ¿Cómo aporta contexto una Skill?

Una skill no es solo documentación; es una inyección de capacidades que altera el comportamiento del agente receptor.

### Ejemplo Teórico: Tarea de Desarrollo

Supongamos que el Workflow actual es "Crear nueva feature (API Route)" y el agente asignado es el **Developer**.

**Sin Skills (Fallback al conocimiento del Modelo):**
El Developer escribiría una API genérica. Puede que use Next.js Pages Router o App Router arbitrariamente, y podría incluir lógica de negocio directamente en el handler o usar un ORM que el proyecto no utiliza.

**Con Skills Activadas (Contexto Enriquecido):**
El Skill Manager ha activado las skills externas `nextjs-app-router` y `supabase-rls`.

El Developer recibe este contexto:
```markdown
# Contexto de Skills Activas
## nextjs-app-router
[Contenido de la skill...] "Siempre usar Server Actions para mutaciones. No usar Route Handlers (API routes) a menos que sea para webhooks de terceros."

## supabase-rls
[Contenido de la skill...] "Nunca confiar en validaciones del cliente. Toda mutación debe estar respaldada por una política RLS en Postgres."
```

**Resultado:** El Developer, influenciado por este contexto, decide *no* crear una API Route como pensaba inicialmente, sino que crea un Server Action y además redacta el script de migración SQL para la política RLS de Supabase.

## El Contrato de Skill Awareness

Para que este contexto funcione, todos los agentes en `roles/` implementan la sección **Skill Awareness**. Esta sección es un contrato que obliga al agente a:
1. No asumir stack tecnológico; leer siempre las skills activas.
2. Si las instrucciones de la skill contradicen el conocimiento pre-entrenado del modelo, **la skill siempre gana**.
3. Adaptar la salida esperada a los patrones exigidos por la skill.
