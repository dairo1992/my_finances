# 🚀 Guía de Inicio Rápido - Finance App Core

Esta guía te ayudará a configurar y ejecutar el chasis de la aplicación de finanzas en pocos pasos.

## 📋 Prerrequisitos

Antes de comenzar, asegúrate de tener instalado:

- **Flutter SDK** >=3.10.0
- **Dart SDK** >=3.0.0
- **Node.js** (para Firebase CLI)
- **Git**
- **Android Studio** o **VS Code**

### Verificar Instalación

```bash
flutter --version
dart --version
node --version
git --version
```

## 🛠️ Configuración Inicial

### 1. Clonar y Configurar el Proyecto

```bash
# Clonar el repositorio
git clone <tu-repositorio>
cd finance_app_core

# Hacer ejecutables los scripts
chmod +x scripts/*.sh

# Ejecutar configuración automática
make setup
# o manualmente:
# ./scripts/setup.sh
```

### 2. Configurar Firebase

```bash
# Configurar Firebase (seguir las instrucciones en pantalla)
flutterfire configure

# Esto generará automáticamente:
# - lib/core/config/firebase_options.dart
# - android/app/google-services.json
# - ios/Runner/GoogleService-Info.plist
```

### 3. Verificar Configuración

```bash
# Verificar que no hay errores
flutter doctor

# Verificar análisis de código
flutter analyze

# Ejecutar tests
flutter test
```

### 4. Ejecutar la Aplicación

```bash
# Modo debug
flutter run

# O usando Makefile
make run

# Modo release
make run-release
```

## 🏗️ Estructura del Proyecto Generado

```
finance_app_core/
├── lib/
│   ├── core/                          # ✅ Núcleo de la aplicación
│   │   ├── app/                       # ✅ Configuración de la app
│   │   │   └── app.dart               # ✅ Widget principal
│   │   ├── config/                    # ✅ Configuraciones
│   │   │   ├── app_config.dart        # ✅ Configuración general
│   │   │   └── firebase_options.dart  # 🔧 Generar con flutterfire
│   │   ├── di/                        # ✅ Inyección de dependencias
│   │   │   ├── dependency_injection.dart
│   │   │   └── dependency_injection.config.dart
│   │   ├── domain/                    # ✅ Estructuras base DDD
│   │   │   └── base_structures.dart
│   │   ├── error/                     # ✅ Manejo de errores
│   │   │   └── failures.dart
│   │   ├── navigation/                # ✅ Sistema de navegación
│   │   │   └── app_router.dart
│   │   ├── services/                  # ✅ Servicios compartidos
│   │   │   ├── firebase_service.dart
│   │   │   ├── storage_service.dart
│   │   │   └── connectivity_service.dart
│   │   ├── theme/                     # ✅ Temas de la aplicación
│   │   │   └── app_theme.dart
│   │   └── utils/                     # ✅ Utilidades
│   │       ├── logger.dart
│   │       └── bloc_observer.dart
│   ├── presentation/                  # ✅ Capa de presentación
│   │   ├── auth/                      # ✅ Autenticación
│   │   │   ├── bloc/
│   │   │   └── pages/
│   │   ├── home/                      # ✅ Página principal
│   │   ├── main/                      # ✅ Navegación principal
│   │   └── splash/                    # ✅ Pantalla de carga
│   └── main.dart                      # ✅ Punto de entrada
├── packages/                          # 📦 Módulos independientes
├── scripts/                           # 🔧 Scripts de automatización
├── .vscode/                           # 🔧 Configuración VS Code
├── pubspec.yaml                       # ✅ Dependencias
├── analysis_options.yaml             # ✅ Reglas de análisis
├── build.yaml                        # ✅ Configuración build_runner
├── Makefile                           # 🔧 Comandos útiles
└── README.md                          # 📖 Documentación
```

**Leyenda:**

- ✅ Completado e implementado
- 🔧 Requiere configuración
- 📦 Listo para módulos
- 📖 Documentación

## 🧩 Crear tu Primer Módulo

### Usar el Script Automático

```bash
# Crear módulo de transacciones
make create-module MODULE=transactions

# O manualmente
./scripts/create_module.sh transactions
```

### Integrar el Módulo

1. **Agregar al pubspec.yaml principal:**

```yaml
dependencies:
  # ... otras dependencias
  transactions_module:
    path: packages/transactions_module
```

2. **Inicializar en main.dart:**

```dart
import 'package:transactions_module/transactions_module.dart';

void main() async {
  // ... configuración inicial

  // Inicializar módulos
  await TransactionsModule.init();

  runApp(const FinanceApp());
}
```

3. **Usar en la UI:**

```dart
// En main_page.dart
Widget _getBody(int index) {
  switch (index) {
    case 1:
      return TransactionsModule.getTransactionsPage();
    // ... otros casos
  }
}
```

## 🔧 Comandos Útiles

### Makefile Commands

```bash
make help           # Mostrar todos los comandos disponibles
make setup          # Configuración inicial completa
make clean          # Limpiar proyecto
make deps           # Actualizar dependencias
make generate       # Generar código (build_runner)
make test           # Ejecutar tests
make lint           # Análisis estático
make format         # Formatear código
make run            # Ejecutar app en debug
make run-release    # Ejecutar app en release
make build-apk      # Construir APK
make firebase-config # Configurar Firebase
```

### Comandos Manuales

```bash
# Limpiar y resetear
flutter clean && flutter pub get

# Generar código
flutter packages pub run build_runner build --delete-conflicting-outputs

# Regenerar código (limpiar primero)
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs

# Watch mode (regeneración automática)
flutter packages pub run build_runner watch

# Análisis y formato
flutter analyze
dart format lib/ test/

# Tests con cobertura
flutter test --coverage
```

## 🎯 Próximos Pasos

### 1. Personalizar la Aplicación

- [ ] Cambiar nombre de la app en `pubspec.yaml`
- [ ] Personalizar colores en `app_theme.dart`
- [ ] Configurar íconos y splash screen
- [ ] Actualizar configuración de Firebase

### 2. Desarrollar tu Primer Módulo

- [ ] Crear módulo usando el script
- [ ] Implementar entidades del dominio
- [ ] Crear casos de uso
- [ ] Implementar repositorios
- [ ] Desarrollar UI con BLoC
- [ ] Agregar tests

### 3. Configuraciones Adicionales

- [ ] Configurar flavors (dev, staging, prod)
- [ ] Setup CI/CD
- [ ] Configurar analytics
- [ ] Implementar crash reporting
- [ ] Configurar notificaciones push

## 🐛 Solución de Problemas

### Error: "No Firebase App found"

```bash
# Ejecutar configuración de Firebase
flutterfire configure

# Verificar que firebase_options.dart existe
ls lib/core/config/firebase_options.dart
```

### Error: "build_runner not found"

```bash
# Activar build_runner globalmente
dart pub global activate build_runner

# O ejecutar desde el proyecto
flutter packages pub run build_runner build
```

### Error de dependencias

```bash
# Limpiar y reinstalar
flutter clean
flutter pub get
cd packages/transactions_module && flutter pub get
```

### Error: "Injectable not generating"

```bash
# Verificar que las anotaciones estén correctas
# Regenerar código
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## 📚 Recursos Adicionales

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase for Flutter](https://firebase.flutter.dev/)
- [BLoC Documentation](https://bloclibrary.dev/)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Domain Driven Design](https://martinfowler.com/bliki/DomainDrivenDesign.html)

## 🤝 Contribuir

1. Fork el proyecto
2. Crea una rama feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -am 'Agregar nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Crea un Pull Request

---

**¡Feliz desarrollo! 🎉**

Si tienes preguntas o encuentras problemas, no dudes en crear un issue en el repositorio.
