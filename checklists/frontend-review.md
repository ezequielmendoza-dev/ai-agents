# Frontend Review Checklist

> **Uso:** Revisar antes de mergear cualquier PR con cambios de frontend.  
> **Responsable:** QA Engineer + Tech Lead  
> **Aplica a:** Web apps, SPAs, componentes React/Vue/Angular/Vanilla JS

---

## Metadata

| Campo | Valor |
|-------|-------|
| **Proyecto** | `[nombre]` |
| **Feature / PR** | `FEAT-XXX / PR #XXX` |
| **Revisor** | `[nombre]` |
| **Fecha** | `YYYY-MM-DD` |

---

## 1. Estructura y Semántica HTML

- [ ] Uso correcto de etiquetas semánticas (`<main>`, `<section>`, `<article>`, `<nav>`, `<header>`, `<footer>`)
- [ ] Un solo `<h1>` por página con jerarquía correcta de headings
- [ ] Formularios con `<label>` asociados a sus inputs
- [ ] Imágenes con atributo `alt` descriptivo
- [ ] Botones usan `<button>`, no `<div>` o `<span>` clickeables
- [ ] Links tienen texto descriptivo (no "click aquí" o "leer más")

---

## 2. Accesibilidad (a11y)

- [ ] Contraste de color mínimo 4.5:1 para texto normal, 3:1 para texto grande
- [ ] Navegación con teclado funciona en todos los elementos interactivos
- [ ] Focus visible en todos los elementos interactivos
- [ ] ARIA labels en iconos sin texto
- [ ] Modales atrapan el foco correctamente
- [ ] Errores de formulario son anunciados por screen readers

---

## 3. Diseño Responsivo

- [ ] Funciona correctamente en mobile (320px+)
- [ ] Funciona correctamente en tablet (768px+)
- [ ] Funciona correctamente en desktop (1280px+)
- [ ] No hay overflow horizontal en ningún viewport
- [ ] Imágenes y media son responsivos
- [ ] Tipografía escala correctamente

---

## 4. Rendimiento

- [ ] Imágenes optimizadas (WebP, tamaño adecuado)
- [ ] No hay renders innecesarios (React: memo, useCallback, useMemo donde corresponde)
- [ ] Lazy loading en componentes pesados o rutas secundarias
- [ ] No hay dependencias importadas innecesariamente
- [ ] Los assets estáticos están cacheados correctamente

---

## 5. Manejo de Estados

- [ ] Estado de carga (`loading`) visible al usuario
- [ ] Estado de error con mensaje claro y accionable
- [ ] Estado vacío diseñado (no pantalla en blanco)
- [ ] Estado de éxito con feedback claro
- [ ] Los estados son coherentes entre recargas de página

---

## 6. Formularios

- [ ] Validación en cliente antes de enviar
- [ ] Mensajes de error descriptivos y específicos por campo
- [ ] Botón de submit deshabilitado durante el envío
- [ ] Datos sensibles no se loguean en consola
- [ ] Autocompletado configurado correctamente (`autocomplete` attribute)
- [ ] Campos requeridos marcados visualmente

---

## 7. Manejo de Errores

- [ ] Errores de red tienen mensajes amigables para el usuario
- [ ] No se exponen stack traces o mensajes técnicos al usuario
- [ ] Existen páginas de error (404, 500)
- [ ] Los errores se loguean correctamente (sin datos sensibles)

---

## 8. Seguridad Frontend

- [ ] No hay tokens o claves en el código fuente
- [ ] No se usa `dangerouslySetInnerHTML` sin sanitizar
- [ ] No hay `eval()` o construcción dinámica de código
- [ ] Variables de entorno públicas no contienen datos sensibles
- [ ] Las rutas privadas redirigen a login si no hay sesión

---

## 9. Calidad de Código

- [ ] No hay código comentado sin justificación
- [ ] Componentes tienen nombres descriptivos
- [ ] Props tienen tipos definidos (TypeScript interfaces/types)
- [ ] No hay `any` sin justificación en TypeScript
- [ ] Constantes mágicas están extraídas a constantes nombradas
- [ ] No hay `console.log` de debug en producción

---

## 10. Testing

- [ ] Tests unitarios para lógica de negocio en el frontend
- [ ] Tests de componentes para UI crítica
- [ ] Escenarios de error cubiertos en tests
- [ ] Tests de accesibilidad (ej: `jest-axe`)

---

## Resultado

| Estado | Condición |
|--------|-----------|
| ✅ **Aprobado** | Todos los ítems críticos OK |
| ⚠️ **Aprobado con observaciones** | Ítems no críticos pendientes |
| ❌ **Rechazado** | Ítems críticos fallidos |

**Observaciones:**
> `[detallar observaciones si aplica]`

---

*Checklist versión 1.0 — ai-agents library*
