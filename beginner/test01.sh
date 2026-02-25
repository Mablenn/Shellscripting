#!/bin/bash

# 1. Mostrar texto por consola
# 2. Uso de variables

# 1.
# El comando 'echo' muestra líneas de texto por consola. Aunque, el comando 'printf' es mucho más completo,
# de momento lo utilaremos para mostrar texto por pantalla.
echo "=============================="
echo "Empenzando con shellscripting."
echo "=============================="
echo "" # Genera un salto de línea

# 2.
# La declaración de variables siempre sigue el mismo patrón 'nombre=valor', sin espacios antes y después del signo '='
# Diferencia entre definir variables numéricas o de texto:
numero=240                               # Variable de tipo numérico
texto="siempre entre comillas dobles"    # Variable de tipo texto

# Mostrar variables
echo "Valor de la variable 'numero': $numero"
echo ""
echo "Valor de la variable 'texto': $texto"
