---
id: code-review
category: development
aliases: [pr-review, review-guidelines]
type: method
version: 1.0
---

# Code Review

> Metodología para revisar código (Pull Requests / Merge Requests) garantizando la calidad, mantenibilidad y seguridad del software.

---

## Cuándo Usar Esta Skill
- Al analizar código escrito por otros desarrolladores (o por el usuario).
- Al actuar como "Tech Lead" o validador antes de un merge.
- Para establecer estándares de calidad en el equipo.

## Principios Fundamentales
1. **Asumir Buena Fe:** El código se escribió con las mejores intenciones dado el contexto conocido.
2. **Revisar Comportamiento antes que Estilo:** Dejar que los linters (ESLint, Prettier) discutan por punto y coma o indentación. Enfocarse en la lógica y arquitectura.
3. **Nitpicks:** Etiquetar sugerencias menores de estilo o preferencias personales como "Nit" (Nitpick), indicando que no son bloqueantes para aprobar el PR.

## Lista de Verificación (Checklist) del Revisor

1. **Corrección Funcional:** ¿El código hace lo que dice el requerimiento o ticket?
2. **Arquitectura y Diseño:** ¿Respeta los patrones del proyecto? ¿Se acopla innecesariamente a otras capas?
3. **Manejo de Errores:** ¿Qué pasa si falla una llamada de red? ¿Los errores se tragan (swallowed) o se reportan correctamente?
4. **Seguridad:** ¿Se validan los inputs? ¿Hay riesgo de inyección SQL o XSS? ¿Se exponen secretos?
5. **Testing:** ¿Los tests unitarios o de integración cubren los casos de éxito y los *edge cases* principales?
6. **Legibilidad:** ¿Los nombres de variables y funciones son descriptivos? ¿Las funciones hacen solo una cosa?

## Cómo Entregar Feedback
- ❌ **Autoritario/Vago:** "Cambia esto, está mal."
- ✅ **Constructivo/Explicativo:** "Si usamos `map` aquí en lugar de un `for` loop manual, evitamos mutar la variable externa y ganamos legibilidad. ¿Qué te parece?"
- ✅ **Aportando Soluciones:** Proveer snippets cortos de código mostrando la mejora sugerida en lugar de solo apuntar el error.
