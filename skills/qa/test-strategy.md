---
id: test-strategy
category: qa
aliases: [testing-pyramid, testing]
type: method
version: 1.0
---

# Test Strategy

> Metodología para diseñar una estrategia de pruebas balanceada que garantice la estabilidad del sistema con un alto retorno de inversión en tiempo de desarrollo.

---

## Cuándo Usar Esta Skill
- Al planificar la cobertura de pruebas de una nueva funcionalidad.
- Como QA Agent definiendo qué probar automáticamente y qué probar manualmente.
- Al analizar deuda técnica relacionada a testing.

## Principios Fundamentales
1. **La Pirámide de Pruebas:**
   - **Unit Tests (Base):** Rápidos, baratos, aislados. Muchos. Testean lógica pura y funciones/componentes aislados.
   - **Integration Tests (Medio):** Verifican que 2 o más componentes funcionen juntos (ej. Service + Base de datos). Más lentos, cantidad moderada.
   - **E2E / UI Tests (Cúspide):** Verifican el flujo completo desde el punto de vista del usuario. Muy lentos y frágiles. Pocos (solo flujos críticos).
2. **Shift-Left Testing:** Mover las pruebas lo más temprano posible en el ciclo de vida de desarrollo.
3. **No persigas el 100% de Coverage a ciegas:** Enfócate en cubrir los caminos críticos de negocio y los casos borde complejos; el código *boilerplate* trivial rara vez justifica el costo de mantenimiento del test.

## Estrategia por Capa

### Frontend
- **Unidad:** Funciones utilitarias complejas (cálculos de fechas, formateo).
- **Componentes:** Testing de renderizado y comportamiento de UI basado en interacción del usuario (ej. React Testing Library). Evitar testear detalles de implementación (estado interno).
- **E2E:** Flujos dorados (Login, Checkout, Alta de Entidad principal).

### Backend
- **Unidad:** Lógica de negocio core sin dependencias externas (servicios, parsers).
- **Integración:** Repositorios contra la base de datos de test, o API endpoints completos usando inyección de dependencias (supertest, testcontainers).

## Gestión de Datos de Prueba (Test Data)
- Preferir fábricas (factories) o builders dinámicos antes que fixtures estáticos enormes, para evitar fragilidad si el esquema cambia.
- Asegurar que la base de datos se limpia o se reinicia a un estado conocido antes de cada ejecución de prueba de integración.
