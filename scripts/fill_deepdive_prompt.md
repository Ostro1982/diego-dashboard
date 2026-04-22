Tu tarea: completar el campo `deepDive` en 4 proyectos del dashboard que aun esten vacios (sin `deepDive`).

**Archivos**:
- Target: `C:\Users\Ostro\diego-dashboard\index.html` (buscar array `DEFAULT_PROJECTS` entre lineas ~808-1230 y `DEFAULT_IDEAS` despues)
- Contexto: memory files en `C:\Users\Ostro\.claude\projects\C--Users-Ostro\memory\` (usar el MEMORY.md como indice, luego leer el archivo correspondiente al proyecto)

**Algoritmo**:
1. Leer `index.html`, identificar proyectos sin campo `deepDive`. Priorizar desarrollados (status live/paper/dev/paused) antes que ideas.
2. Elegir 4 proyectos. Para cada uno:
   - Buscar memory file relevante. Patron: `project_<nombre_similar>.md`. Si no hay memory, usar solo la info del proyecto en index.html + razonamiento EV.
   - Redactar el campo `deepDive` con la estructura:
     ```
     deepDive: {
       contexto: "1-3 frases: por que existe, historia, estado actual",
       propuesta: "1-3 frases: que resuelve, para quien, diferenciador",
       potencial: "1-3 frases: TAM, comparables, ceiling realista",
       inversion: { capital: "USD X", horas: "X invertidas / Y pendientes", recurrente: "USD X/mes" },
       retorno: { conservador: "USD X/mes", optimista: "USD X/mes", breakeven: "mes N o N/A" },
       decisiones: "preguntas abiertas, proximos sprints, riesgos criticos"
     }
     ```
3. Insertar el `deepDive` dentro del objeto del proyecto, despues del campo `details` (agregar coma luego de `}` del details). Respetar indentacion existente.
4. Validar sintaxis: ejecutar `node --check` sobre el JS extraido del HTML. Si falla, revertir.
5. Commit con mensaje: `deepdive: agregar analisis a <proyecto1>, <proyecto2>, <proyecto3>, <proyecto4>` y push a origin.

**Reglas escritura**:
- Espanol. Sin acentos (romper JS si no se escapan).
- NO usar emojis, bold statements, drama, muletillas IA ("here's the thing", "not X it's Y", "game-changer").
- 100% realista. Si no hay data para un campo, escribir "Sin data suficiente aun" en vez de inventar.
- Precios en USD siempre.
- Diego es ex poker/MTG pro, AR, capital USD 5000, runway 7 meses, objetivo USD 3000/mes pasivo. Calibrar potenciales contra eso.

**Criterios exito**:
- 4 nuevos `deepDive` en index.html
- `node --check` pasa
- Commit pusheado a master
- Si no quedan proyectos vacios, log "Todos completos" y salir sin commit.
