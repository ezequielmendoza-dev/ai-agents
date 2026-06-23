#!/usr/bin/env bash

# ==============================================================================
# setup-ide.sh — ai-agents OS Installer
# ==============================================================================
# Este script inicializa la estructura .ai/ y genera los archivos de reglas
# para diferentes IDEs de IA en el proyecto donde se ejecuta.
# ==============================================================================

set -euo pipefail

# Colores para la consola
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # Sin color

echo -e "${BLUE}====================================================${NC}"
echo -e "${BLUE}   🤖 Instalador de Configuración de IDEs de IA      ${NC}"
echo -e "${BLUE}            ai-agents OS v1.6.2                     ${NC}"
echo -e "${BLUE}====================================================${NC}"

# 1. Determinar rutas y directorios
CWD="$(pwd)"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
AI_AGENTS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Intentar detectar si ai-agents está como submódulo en .ai/agents
if [ -d "$CWD/.ai/agents" ]; then
    PROJECT_ROOT="$CWD"
    IN_SUBMODULE=true
    echo -e "${GREEN}✓ Detectado proyecto raíz en: ${PROJECT_ROOT}${NC}"
    echo -e "${GREEN}✓ ai-agents está integrado como submódulo Git.${NC}"
elif [ "$CWD" = "$AI_AGENTS_ROOT" ]; then
    PROJECT_ROOT="$CWD"
    IN_SUBMODULE=false
    echo -e "${YELLOW}! Ejecutando directamente en el repositorio ai-agents (modo desarrollo).${NC}"
else
    PROJECT_ROOT="$CWD"
    IN_SUBMODULE=false
    echo -e "${YELLOW}! No se detectó la carpeta .ai/agents/. Usando el directorio actual como raíz del proyecto.${NC}"
fi

# Ruta origen de las plantillas (dentro del repo de ai-agents)
TEMPLATES_DIR="$AI_AGENTS_ROOT/templates"
IDE_TEMPLATES_DIR="$TEMPLATES_DIR/ide-configs"

# Verificar que existen las plantillas
if [ ! -d "$IDE_TEMPLATES_DIR" ]; then
    echo -e "${RED}Error: No se encontró el directorio de plantillas en $IDE_TEMPLATES_DIR${NC}"
    exit 1
fi

echo -e "\n${BLUE}--- Paso 1: Inicialización de Estructura Documental .ai/ ---${NC}"

# Preguntar si desea inicializar la estructura .ai/
read -p "¿Deseas inicializar la estructura de carpetas .ai/? (s/n): " init_ai
if [[ "$init_ai" =~ ^[sS]$ ]]; then
    # Crear carpetas
    mkdir -p "$PROJECT_ROOT/.ai/features"
    mkdir -p "$PROJECT_ROOT/.ai/archive"
    mkdir -p "$PROJECT_ROOT/.ai/sessions"
    echo -e "${GREEN}✓ Estructura de carpetas .ai/ creada (.ai/features, .ai/archive, .ai/sessions).${NC}"

    # Copiar context.md si no existe
    if [ ! -f "$PROJECT_ROOT/.ai/context.md" ]; then
        if [ -f "$TEMPLATES_DIR/project-context.md" ]; then
            cp "$TEMPLATES_DIR/project-context.md" "$PROJECT_ROOT/.ai/context.md"
            echo -e "${GREEN}✓ Creado .ai/context.md (basado en plantilla). ¡Recuerda editarlo con los datos del proyecto!${NC}"
        fi
    else
        echo -e "  - .ai/context.md ya existe. Omitido."
    fi

    # Crear business-rules.md si no existe
    if [ ! -f "$PROJECT_ROOT/.ai/business-rules.md" ]; then
        cat << 'EOF' > "$PROJECT_ROOT/.ai/business-rules.md"
# Reglas de Negocio Permanentes

Este documento centraliza las reglas de negocio globales del dominio que no cambian con cada feature.

## Módulo: General

| ID | Regla | Fuente | Vigente desde |
|----|-------|--------|---------------|
| RN-001 | [Regla general de ejemplo] | [Owner/Doc] | YYYY-MM-DD |
EOF
        echo -e "${GREEN}✓ Creado .ai/business-rules.md inicial.${NC}"
    else
        echo -e "  - .ai/business-rules.md ya existe. Omitido."
    fi

    # Crear architecture.md si no existe
    if [ ! -f "$PROJECT_ROOT/.ai/architecture.md" ]; then
        cat << 'EOF' > "$PROJECT_ROOT/.ai/architecture.md"
# Arquitectura del Sistema

## Última actualización: YYYY-MM-DD

## Visión General
[Diagrama general de arquitectura]

## Tecnologías Principales
* Ver `.ai/context.md` para el stack detallado.

## Decisiones de Arquitectura Vigentes (ADRs)
Ver `.ai/decisions.md` para el log completo de decisiones.
EOF
        echo -e "${GREEN}✓ Creado .ai/architecture.md inicial.${NC}"
    else
        echo -e "  - .ai/architecture.md ya existe. Omitido."
    fi

    # Crear decisions.md si no existe
    if [ ! -f "$PROJECT_ROOT/.ai/decisions.md" ]; then
        cat << 'EOF' > "$PROJECT_ROOT/.ai/decisions.md"
# Log de Decisiones de Arquitectura (ADR)

Este archivo registra las decisiones arquitectónicas importantes tomadas en el proyecto.

## ARCH-001: [Título de la Decisión]

*   **Estado:** Propuesto / Aprobado / Reemplazado por ARCH-XXX
*   **Fecha:** YYYY-MM-DD
*   **Contexto:** [Descripción del problema y por qué requiere una decisión técnica]
*   **Decisión:** [Detalle de la decisión adoptada]
*   **Consecuencias:** [Lo que ganamos y lo que perdemos con esta decisión]
EOF
        echo -e "${GREEN}✓ Creado .ai/decisions.md inicial.${NC}"
    else
        echo -e "  - .ai/decisions.md ya existe. Omitido."
    fi

    # Crear glossary.md si no existe
    if [ ! -f "$PROJECT_ROOT/.ai/glossary.md" ]; then
        cat << 'EOF' > "$PROJECT_ROOT/.ai/glossary.md"
# Glosario del Dominio

Definiciones claras de los conceptos clave utilizados en este proyecto.

| Término | Definición | Contexto / Notas |
| :--- | :--- | :--- |
| Ejemplo | Definición del término de ejemplo | Utilizado en todo el sistema |
EOF
        echo -e "${GREEN}✓ Creado .ai/glossary.md inicial.${NC}"
    else
        echo -e "  - .ai/glossary.md ya existe. Omitido."
    fi
else
    echo -e "Omitiendo inicialización de estructura documental .ai/"
fi

echo -e "\n${BLUE}--- Paso 2: Generación de Archivos de Reglas para IDEs ---${NC}"
echo "Selecciona qué archivos de reglas deseas generar en la raíz de tu proyecto:"
echo "1) Cursor IDE (.cursorrules)"
echo "2) Claude Code (CLAUDE.md)"
echo "3) Windsurf IDE (.windsurfrules)"
echo "4) Cline / Roo-Code (.clinerules)"
echo "5) GitHub Copilot (.github/copilot-instructions.md)"
echo "6) Guía General de Agentes (AGENTS.md)"
echo "7) Instalar TODOS los anteriores"
echo "8) Ninguno"

read -p "Ingresa tu opción (1-8): " ide_choice

copy_rule_file() {
    local src="$1"
    local dest="$2"
    local name="$3"
    
    if [ -f "$src" ]; then
        # Crear directorio destino si no existe (ej. .github)
        mkdir -p "$(dirname "$dest")"
        cp "$src" "$dest"
        echo -e "${GREEN}✓ Creado $name en $dest${NC}"
    else
        echo -e "${RED}Error: No se encontró la plantilla para $name en $src${NC}"
    fi
}

case $ide_choice in
    1)
        copy_rule_file "$IDE_TEMPLATES_DIR/cursorrules" "$PROJECT_ROOT/.cursorrules" "Cursor (.cursorrules)"
        ;;
    2)
        copy_rule_file "$IDE_TEMPLATES_DIR/CLAUDE.md" "$PROJECT_ROOT/CLAUDE.md" "Claude Code (CLAUDE.md)"
        ;;
    3)
        copy_rule_file "$IDE_TEMPLATES_DIR/windsurfrules" "$PROJECT_ROOT/.windsurfrules" "Windsurf (.windsurfrules)"
        ;;
    4)
        copy_rule_file "$IDE_TEMPLATES_DIR/clinerules" "$PROJECT_ROOT/.clinerules" "Cline (.clinerules)"
        ;;
    5)
        copy_rule_file "$IDE_TEMPLATES_DIR/copilot-instructions.md" "$PROJECT_ROOT/.github/copilot-instructions.md" "Copilot (.github/copilot-instructions.md)"
        ;;
    6)
        copy_rule_file "$IDE_TEMPLATES_DIR/AGENTS.md" "$PROJECT_ROOT/AGENTS.md" "Guía General (AGENTS.md)"
        ;;
    7)
        copy_rule_file "$IDE_TEMPLATES_DIR/cursorrules" "$PROJECT_ROOT/.cursorrules" "Cursor (.cursorrules)"
        # Modificar ligeramente CLAUDE.md para proyectos con submódulo
        copy_rule_file "$IDE_TEMPLATES_DIR/CLAUDE.md" "$PROJECT_ROOT/CLAUDE.md" "Claude Code (CLAUDE.md)"
        copy_rule_file "$IDE_TEMPLATES_DIR/windsurfrules" "$PROJECT_ROOT/.windsurfrules" "Windsurf (.windsurfrules)"
        copy_rule_file "$IDE_TEMPLATES_DIR/clinerules" "$PROJECT_ROOT/.clinerules" "Cline (.clinerules)"
        copy_rule_file "$IDE_TEMPLATES_DIR/copilot-instructions.md" "$PROJECT_ROOT/.github/copilot-instructions.md" "Copilot (.github/copilot-instructions.md)"
        copy_rule_file "$IDE_TEMPLATES_DIR/AGENTS.md" "$PROJECT_ROOT/AGENTS.md" "Guía General (AGENTS.md)"
        ;;
    *)
        echo -e "Omitiendo generación de reglas de IDEs."
        ;;
esac

echo -e "\n${BLUE}--- Paso 3: Configuración de .gitignore ---${NC}"
# Preguntar si desea configurar el .gitignore
read -p "¿Deseas agregar las carpetas de sesiones locales de IA y temporales al .gitignore del proyecto? (s/n): " configure_git

if [[ "$configure_git" =~ ^[sS]$ ]]; then
    GITIGNORE_PATH="$PROJECT_ROOT/.gitignore"
    
    if [ ! -f "$GITIGNORE_PATH" ]; then
        touch "$GITIGNORE_PATH"
    fi

    # Verificar si ya está configurado
    if grep -q "\.ai/sessions/" "$GITIGNORE_PATH"; then
        echo -e "  - Las sesiones locales de IA ya están ignoradas en el .gitignore."
    else
        cat << 'EOF' >> "$GITIGNORE_PATH"

# ==============================================================================
# ai-agents OS — Ignorar carpetas temporales y de sesión local de IA
# ==============================================================================
.ai/sessions/
EOF
        echo -e "${GREEN}✓ Agregado .ai/sessions/ al .gitignore del proyecto.${NC}"
    fi
else
    echo -e "Omitiendo configuración de .gitignore."
fi

echo -e "\n${GREEN}====================================================${NC}"
echo -e "${GREEN}   🎉 ¡Configuración de ai-agents OS Completada!      ${NC}"
echo -e "${GREEN}====================================================${NC}"
echo -e "Siguientes pasos recomendados:"
echo -e "1. Abre y edita ${YELLOW}.ai/context.md${NC} con la información técnica de tu proyecto."
echo -e "2. Abre tu IDE de IA y comienza a trabajar siguiendo los agentes en ${YELLOW}AGENTS.md${NC}."
echo -e "===================================================="
