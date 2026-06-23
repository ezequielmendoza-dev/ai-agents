# UI/UX Review Checklist

> **Uso:** Revisar antes de mergear PRs con cambios significativos de UI, o durante la validación visual de la feature.  
> **Responsable:** UI Designer / QA Engineer / Tech Lead  
> **Aplica a:** Interfaces web, layouts responsivos, flujos de usuario complejos y nuevos componentes del Design System.

---

## Metadata

| Campo | Valor |
|-------|-------|
| **Proyecto** | `[nombre]` |
| **Feature / PR** | `FEAT-XXX / PR #XXX` |
| **Revisor** | `[nombre]` |
| **Fecha** | `YYYY-MM-DD` |

---

## 1. Coherencia y Consistencia Visual (Design System)

- [ ] Los colores coinciden exactamente con los tokens/variables CSS del proyecto (sin colores hardcodeados arbitrariamente).
- [ ] Los border-radius y sombras se ajustan a las clases y tokens globales definidos.
- [ ] El espaciado (padding, margin, gap) respeta la grilla y escala del proyecto (ej: múltiplos de 4 u 8px o clases de Tailwind consistentes).
- [ ] Los iconos provienen de la misma familia o set tipográfico y mantienen consistencia en estilo (stroke vs. solid, grosor).

---

## 2. Layout y Jerarquía Visual

- [ ] Existe un flujo ocular claro de lectura (el elemento más importante capta la atención primero).
- [ ] El espaciado negativo (white space) es suficiente y previene que la interfaz se sienta congestionada.
- [ ] La alineación de los elementos en grillas o columnas es perfecta tanto horizontal como verticalmente.
- [ ] Los contenedores y tarjetas tienen límites visuales definidos de forma consistente (bordes, fondos o sombras sutiles).

---

## 3. Tipografía y Estilo de Texto

- [ ] El tamaño de fuente y el peso (font-weight) corresponden a la jerarquía de headings y body establecida.
- [ ] No existen textos truncados de manera inesperada o que se encabalguen en pantallas pequeñas.
- [ ] La altura de línea (line-height) asegura una legibilidad cómoda (habitualmente entre 1.4 y 1.6 para cuerpo de texto).
- [ ] El contraste del texto cumple con las normas (mínimo 4.5:1 para texto estándar).

---

## 4. Estados de la Interfaz (UX States)

- [ ] **Carga:** Se muestran skeletons o spinners durante transiciones asíncronas para evitar saltos de layout (CLS).
- [ ] **Éxito:** Las confirmaciones visuales (badges, toasts) son visibles y se auto-ocultan o permiten descarte manual.
- [ ] **Error:** Los mensajes de error son legibles, están destacados en tonos de alerta y ofrecen una acción clara de recuperación (ej: botón reintentar).
- [ ] **Vacío:** El estado vacío (empty state) tiene una ilustración/icono claro, un texto explicativo y un botón CTA accionable.
- [ ] **Interacción:** Los botones y enlaces tienen estados diferenciados para `hover`, `focus` (visible y con alto contraste) y `active` (feedback de pulsación).

---

## 5. Diseño Responsivo y Adaptabilidad

- [ ] La interfaz se adapta dinámicamente sin overflow horizontal ni elementos superpuestos en viewports Mobile (320px+).
- [ ] Los elementos táctiles en mobile tienen un tamaño mínimo adecuado de tap-target (mínimo 44x44px).
- [ ] Los menús extensos se colapsan adecuadamente en viewports reducidos (ej: menús hamburguesa, modales inferiores).
- [ ] La tipografía y las imágenes escalan de manera fluida entre breakpoints (mobile, tablet, desktop).

---

## 6. Accesibilidad (a11y)

- [ ] Todos los elementos interactivos se pueden navegar secuencialmente usando el teclado (Tab / Shift+Tab).
- [ ] El indicador visual de foco (focus ring) es claramente visible en todos los elementos cuando se navega por teclado.
- [ ] Los iconos y botones que no contienen texto descriptivo poseen un atributo `aria-label` descriptivo.
- [ ] El marcado HTML es semántico (ej: `<button>` para acciones de click, `<a>` para navegación).

---

## 7. Micro-interacciones y Animaciones

- [ ] Las animaciones y transiciones son suaves (ej: uso de `ease-out` o `cubic-bezier`) y no exceden los 300ms de duración.
- [ ] No hay parpadeos visuales ni saltos toscos de layout al insertar o remover elementos del DOM.
- [ ] El feedback visual ante hover o click ocurre inmediatamente (dentro de los primeros 100ms).

---

## Resultado

| Estado | Condición |
|--------|-----------|
| ✅ **Aprobado** | Interfaz fiel al diseño especificado y sin problemas críticos de UX/a11y |
| ⚠️ **Aprobado con observaciones** | Observaciones menores visuales que no impiden el uso óptimo de la feature |
| ❌ **Rechazado** | Desviaciones visuales críticas, problemas graves de a11y o ausencia de estados clave (loading/error) |

**Observaciones:**
> `[detallar observaciones si aplica]`

---

*Checklist versión 1.0 — ai-agents library*
