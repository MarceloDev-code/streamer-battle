# 🕹️ Streamer Battle (Godot)

**Streamer Battle** es un juego hecho en **Godot Engine**


---

## 🧩 Tech stack & arquitectura

- **Motor**: Godot Engine (micro: 3.x o 4.x según tu código)
- **Lenguaje**: C#
- **Estructura de carpetas**:
  ```
  /scenes      # escenas: main, menú, niveles, jugadores...
  /scripts     # lógica dividida por nodo/funcionalidad
  /assets      # sprites, audio, fuentes, etc.
  /addons      # plugins o herramientas opcionales
  /ui          # recursos y escenas de UI
  /tests       # scripts de testing (si aplican)
  ```
- **Escena principal (“main.tscn”)** que instancia UI, estado del juego y lógica de cambio de escenas.

---

## 📦 Instalación y configuración

1. Clona el repositorio:
   ```bash
   git clone https://github.com/MarceloDev-code/streamer-battle.git
   ```
2. Abre el proyecto en Godot:
   - Abre Godot y usa “Importar” o arrastra la carpeta al Project Manager.
3. Asegúrate de tener el **main.tscn** configurado como escena principal (Project Settings → Application → Run → Main Scene).
4. Ejecuta el juego con “Play”.

---


## 🧪 Pruebas

- Si tienes tests en `/tests`, puedes usar la plantilla de Godot 4 para correrlos.
- Agrega prints condicionados (`if DEBUG: print(...)`) para facilitar debugging.

---

## 🚀 Roadmap

- ✅ Menú principal y selección de personajes
- ✅ Mecánicas de pelea y puntaje
- ❌ Modo multijugador online
- ❌ Pantalla de resultados/clasificación
- ❌ IA de bots
- ❌ Ajustes en UI (temas, responsividad)

---

## 🤝 Contribuciones

1. Haz fork del repositorio.
2. Crea una branch: `feature/nueva-funcionalidad`.
3. Haz cambios y agrega pruebas si corresponde.
4. Envia un PR describiendo qué agregaste o solucionaste.

---

## 📄 Licencia

Revisa el archivo [LICENSE](LICENSE).

---

## 📫 Contacto

Creado por **@MarceloDev-code**.  
Si tienes dudas, puedes comentar en el repo o contactarme por correo.