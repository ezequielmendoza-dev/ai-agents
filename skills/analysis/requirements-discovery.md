---
id: requirements-discovery
category: analysis
aliases: [requirements, discovery]
type: method
version: 1.0
---

# Requirements Discovery

> Metodología para explorar, descubrir y documentar requerimientos de software de manera exhaustiva antes del diseño técnico.

---

## Cuándo Usar Esta Skill
- Durante la fase de ideación o análisis de producto.
- Cuando el usuario proporciona un requerimiento ambiguo o de alto nivel ("Quiero hacer una app como Uber").
- Como paso previo obligado antes de involucrar al Software Architect.

## Principios Fundamentales
1. **Evitar la asunción tecnológica:** Nunca asumir la tecnología a utilizar durante el descubrimiento de requerimientos. El foco debe ser estrictamente en el "qué" y el "por qué", dejando el "cómo" para más adelante.
2. **Mentalidad de First Principles:** Descomponer los problemas hasta sus verdades fundamentales.
3. **Foco en el Usuario:** Documentar los flujos desde la perspectiva del valor entregado al usuario (User Stories o Jobs To Be Done).

## Metodología Recomendada (El Método de los 5 Pilares)

1. **Contexto del Negocio:** ¿Cuál es el modelo de negocio? ¿Cuál es el KPI principal a mover con este requerimiento?
2. **Actores:** ¿Quiénes interactúan con el sistema? (ej. Admin, Usuario Invitado, Usuario Registrado).
3. **Flujos Críticos (Happy Paths):** Paso a paso de la experiencia óptima.
4. **Casos Extremos (Edge Cases):** ¿Qué sucede si la red falla? ¿Qué pasa si el pago es rechazado?
5. **Criterios de Éxito:** ¿Cómo sabemos que la funcionalidad está terminada y cumple su objetivo?

## Entregables Esperados
El resultado de aplicar esta skill debe ser un documento estructurado (típicamente `requirements.md` o un Product Requirements Document - PRD) que contenga historias de usuario, reglas de negocio y restricciones no funcionales (desempeño, seguridad, etc.).
