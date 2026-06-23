# UI/UX Design Specification Template

> **Uso:** Completar después de tener una Feature Spec aprobada, antes de diseñar la arquitectura técnica o en paralelo a ella.  
> **Responsable:** UI Designer  
> **Revisado por:** Tech Lead

---

## Metadata

| Campo | Valor |
|-------|-------|
| **Proyecto** | `[nombre-del-proyecto]` |
| **Feature ID** | `FEAT-XXX` |
| **Fecha** | `YYYY-MM-DD` |
| **Versión** | `1.0` |
| **Estado** | `Draft / In Review / Approved` |
| **Diseñador UI** | `[nombre-del-agente]` |
| **Referencia Funcional** | `[link-a-feature-spec]` |

---

## 1. Concepto Visual y Dirección de Diseño

> [!NOTE]
> Describe el estilo visual general de la feature y cómo se alinea con la estética y el sistema de diseño del proyecto. Explica las decisiones de color, tipografía y sensaciones que busca transmitir la interfaz.

- **Identidad Visual:** [Alineación con el branding actual: minimalista, dark mode, flat, glassmorphism, etc.]
- **Paleta de Colores Propuesta:**
  - `Primary`: `[Clase / CSS Token]` (ej: `--color-primary-500` / `#3b82f6`)
  - `Secondary`: `[Clase / CSS Token]` (ej: `--color-secondary-500`)
  - `Background`: `[Clase / CSS Token]`
  - `Text/Foreground`: `[Clase / CSS Token]`
- **Tipografía y Jerarquía:**
  - `Headings`: `[Familia tipográfica | Weight | Size]`
  - `Body`: `[Familia tipográfica | Weight | Size]`

---

## 2. Layout y Arquitectura de Pantallas

> Detalla la organización espacial de la interfaz para cada vista involucrada en los casos de uso.
> Puedes incluir wireframes en formato ASCII para esquematizar el layout.

### Vista 1: [Nombre de la Vista]
- **Estructura General:** [ej: Sidebar de navegación izquierda de 240px fijo, Header superior pegajoso, Área de contenido con scroll con un ancho máximo de 1200px centrado]
- **Jerarquía Visual:** [Cómo se guiará el ojo del usuario. Qué elementos tienen mayor peso visual]

#### Wireframe (Esquema ASCII)
```
+-------------------------------------------------------+
|  [Logo]   [Navegación]                       [Perfil] | (Header)
+-------------------------------------------------------+
|  +--------------------+  +-------------------------+  |
|  |  (Sidebar Filtros)  |  |  (Lista de Resultados)  |  |
|  |                    |  |                         |  |
|  |  [ ] Opción A      |  |  +-------------------+  |  |
|  |  [ ] Opción B      |  |  | Tarjeta Item 1    |  |  |
|  |                    |  |  +-------------------+  |  |
|  +--------------------+  +-------------------------+  |
+-------------------------------------------------------+
```

---

## 3. Componentes de Interfaz (UI Components)

> Detalla las especificaciones visuales de los componentes reutilizados y los nuevos componentes a construir.

### Componentes Reutilizados del Design System
- **[Nombre del Componente]**: [Indicar cómo se configura para este caso, ej: Button con variante `primary` y tamaño `lg`].

### Nuevos Componentes a Crear
#### `[Nombre del Nuevo Componente]`
- **Semántica HTML:** `[ej. <article> / <dialog> / <button>]`
- **Estructura y Jerarquía:** [Describir los subelementos visuales]
- **Estilos Visuales (CSS / Tailwind):**
  - **Estructura/Bordes:** `[ej. rounded-xl shadow-md border border-slate-200]`
  - **Padding/Margin:** `[ej. p-6 gap-4]`
- **Estados de Interacción:**
  - `Default`: [Apariencia estándar]
  - `Hover` (Puntero encima): [ej. translación vertical de -2px, aumento de sombra]
  - `Focus` (Teclado): [ej. outline de 2px color primario con offset]
  - `Active` (Click): [ej. reducción de escala sutil]
  - `Disabled` (Deshabilitado): [ej. opacidad al 50%, puntero tipo `not-allowed`]

---

## 4. Estados de la Interfaz (UX States)

> Describe el aspecto visual y la retroalimentación al usuario en cada uno de los estados del ciclo de vida del componente o vista.

- **Carga (Loading State):**
  - *Descripción:* [ej: Skeleton loaders ocupando el mismo espacio que el contenido final para evitar saltos bruscos ("layout shift")]
  - *Diseño visual:* [ej. fondo grisáceo animado con pulso suave]
- **Éxito (Success State):**
  - *Descripción:* [ej: Notificación toast no invasiva que aparece en la esquina superior derecha]
  - *Diseño visual:* [ej. icono de check verde, borde verde, texto descriptivo corto]
- **Error (Error State):**
  - *Descripción:* [ej: Banner centrado con instrucciones claras y un botón accionable de reintento]
  - *Diseño visual:* [ej. colores de alerta rojos/naranjas con contraste alto, mensaje no técnico]
- **Vacío (Empty State):**
  - *Descripción:* [ej: Ilustración o icono descriptivo con un botón prominente para incitar a la primera acción]
  - *Diseño visual:* [ej. alineado verticalmente al centro con texto en gris secundario]

---

## 5. Adaptabilidad (Responsive Design)

> Describe el comportamiento fluido de la interfaz a través de los viewports.

- **Mobile (< 768px):** [ej: Grid de 1 columna, menús laterales colapsados en un menú hamburguesa inferior, paddings reducidos a 16px]
- **Tablet (768px - 1024px):** [ej: Grid de 2 columnas, sidebar colapsada a iconos]
- **Desktop (> 1024px):** [ej: Grid de 3 columnas, sidebar visible completa, paddings de 32px]

---

## 6. Accesibilidad (a11y) y Semántica

> Pautas para asegurar el cumplimiento del estándar WCAG 2.1 AA.

- **Relación de Contraste:** [ej: Se valida que todo el texto y botones mantengan una relación de contraste superior a 4.5:1 contra sus fondos respectivos]
- **Focus Order & Keyboard:** [ej: El orden de tabulación sigue estrictamente el orden visual de lectura (de izquierda a derecha y de arriba a abajo). Todos los modales atrapan el foco del teclado al abrirse]
- **Etiquetas de Accesibilidad (ARIA):**
  - [ej: Las imágenes decorativas tienen `alt=""`]
  - [ej: Los botones que solo contienen iconos tienen un atributo `aria-label="Cerrar modal"`]
  - [ej: Los mensajes dinámicos de error usan `aria-live="polite"`]

---

## 7. Micro-interacciones y Animaciones

> Detalla las animaciones necesarias para mejorar el enganche y dinamismo de la UI.

- **Animaciones de Entrada/Salida:** [ej: Modales aparecen con un fade-in y un slide-up suave de 150ms utilizando `cubic-bezier(0.4, 0, 0.2, 1)`]
- **Transiciones de Estado:** [ej: Cambio de color de fondo al hacer hover con una duración de 200ms en transición lineal]

---

*Template versión 1.0 — ai-agents library*
