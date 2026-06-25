# Skill Manager

El **Skill Manager** es el componente orquestador responsable de inyectar capacidades (skills) en el sistema multi-agente de `ai-agents`. Es el "pre-procesador" que actúa antes de que el trabajo duro de codificación, diseño o testing comience.

## ¿Por qué existe un Skill Manager?

Sin un Skill Manager, cada agente (Developer, Architect) tendría que buscar e interpretar el entorno por sí mismo, corriendo el riesgo de que el Architect asuma una tecnología (ej. GraphQL) y el Developer asuma otra (ej. REST).

El Skill Manager centraliza la decisión de qué capacidades técnicas o metodológicas están activas durante una sesión específica, garantizando un contexto unificado (el *Skill Activation Report*) para todos los agentes.

## Tareas Clave

1. **Discovery (Descubrimiento):** Localizar de dónde sacar el conocimiento. 
   *(Ver [Skill Discovery](skill-discovery.md))*
2. **Resolution (Resolución):** Limpiar, ordenar y resolver dependencias de las skills descubiertas.
   *(Ver [Skill Resolution](skill-resolution.md))*
3. **Activation (Activación):** Entregar el contexto final empaquetado.

## Integración en el Pipeline

El flujo estándar de un requerimiento dentro de ai-agents se modifica así:

1. El usuario envía el requerimiento.
2. El sistema llama al **Skill Manager**.
3. El Skill Manager evalúa el requerimiento y el estado del entorno (`package.json`, skills locales, plugins externos).
4. El Skill Manager genera el *Skill Activation Report*.
5. El sistema selecciona el Workflow adecuado (ej. Nueva Feature).
6. El pipeline continúa (Analyst -> Architect -> Tech Lead -> Developer -> QA).
   - *Nota:* Todos estos agentes leen el *Skill Activation Report* antes de empezar gracias a su cláusula de **Skill Awareness**.

## Interacción Humana

El Skill Manager es el agente con mayor probabilidad de hacer preguntas de clarificación arquitectónica temprana. 
Si el proyecto tiene dependencias para `react` y `vue` al mismo tiempo (ej. un microfrontend en transición) y el usuario pide "crear un componente de botón", el Skill Manager detendrá el proceso y preguntará: *"He detectado skills para React y Vue. ¿En qué tecnología deseas crear este componente?"*.
