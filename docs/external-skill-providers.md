# External Skill Providers

El sistema **ai-agents** está diseñado para ser un orquestador agnóstico de plataforma. En lugar de forzar a que todas las skills vivan dentro de su propio repositorio o del repositorio del proyecto, se integra con **Proveedores de Skills Externos** (External Skill Providers).

## ¿Qué es un Proveedor Externo?

Un proveedor externo es cualquier herramienta, CLI, o sistema operativo de IA que posea su propio mecanismo de registro y almacenamiento de skills.

Ejemplos comunes:
- **Google Gemini CLI / Antigravity:** Soporta skills globales en `~/.gemini/config/plugins/` y skills de proyecto en `.agents/skills/`.
- **Claude Code:** Soporta `CLAUDE.md` o directorios personalizados de instrucciones.
- **Roo Code / Cline:** Reglas en `.clinerules`.
- **MCP Servers:** Servidores MCP (Model Context Protocol) que exponen `tools` y `resources` (que actúan como skills).

## Cómo el Skill Manager interactúa con los Proveedores

El `Skill Manager` no está hardcodeado para leer una ruta estricta. Su lógica debe ser capaz de:

1. **Detectar el Entorno:** Reconocer en qué entorno se está ejecutando (ej. revisando variables de entorno, presencia de directorios globales conocidos).
2. **Consultar APIs/Registros:**
   - Si está en un entorno con MCP, listar los recursos disponibles a través de los servidores conectados.
   - Si está en un IDE específico, consultar los archivos de configuración globales.
3. **Mapear a Skills de ai-agents:** Tratar cualquier conjunto estructurado de instrucciones o capacidades externas como si fueran un archivo de skill nativo, asignándole una categoría e inyectándolo en el ciclo de resolución.

## Beneficios de este Enfoque

- **Cero Vendor Lock-in:** Puedes usar las skills tecnológicas desarrolladas por la comunidad de Claude, Gemini o herramientas Open Source sin tener que traducirlas o copiarlas a `ai-agents`.
- **Mantenibilidad:** `ai-agents` no necesita actualizar una skill de Next.js cada vez que sale una nueva versión; confía en que el usuario mantendrá actualizadas sus skills globales a través de su proveedor preferido.
- **Escalabilidad:** Permite que empresas enteras distribuyan sus skills de arquitectura internamente mediante paquetes MCP u otros medios, y `ai-agents` simplemente las orquestará.
