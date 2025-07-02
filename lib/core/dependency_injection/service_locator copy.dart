import 'dart:async';
import 'package:get_it/get_it.dart';

// Clase abstracta que expone un singlenton para registrar y obtener las dependencias del proyecto
abstract class ServiceLocator {
  static final ServiceLocator _instance = _ServiceLocatorImpl();
  static ServiceLocator get instance => _instance;

  // Registrar factory de dependencias
  void registerFactory<T extends Object>(
    T Function() factoryFunc, {
    String? instanceName,
  });

  // Registrar factory de dependencias con parametros.
  void registerFactoryParam<T extends Object, P1, P2>(
    FactoryFuncParam<T, P1, P2> factoryFunc, {
    String? instanceName,
  });

  // Registrar factory de dependencias
  void registerLazysinglenton<T extends Object>(
    T Function() factoryfunc, {
    String? instanceName,
  });

  // Remover dependencias
  FutureOr unregister<T extends Object>({
    Object? instance,
    String? instanceName,
    FutureOr Function(T)? disposingFunction,
  });

  // Obtener Dependencias
  T get<T extends Object>({
    dynamic param1,
    dynamic param2,
    String? instanceName,
    Type? type,
  });
}

class _ServiceLocatorImpl extends ServiceLocator {
  final GetIt _serviceLocator = GetIt.instance;

  @override
  void registerFactory<T extends Object>(
    T Function() factoryFunc, {
    String? instanceName,
  }) {
    _serviceLocator.registerFactory<T>(factoryFunc, instanceName: instanceName);
  }

  @override
  void registerFactoryParam<T extends Object, P1, P2>(
    T Function(P1, P2) factoryFunc, {
    String? instanceName,
  }) {
    _serviceLocator.registerFactoryParam<T, P1, P2>(
      factoryFunc,
      instanceName: instanceName,
    );
  }

  @override
  void registerLazysinglenton<T extends Object>(
    T Function() factoryFunc, {
    String? instanceName,
  }) {
    _serviceLocator.registerLazySingleton(
      factoryFunc,
      instanceName: instanceName,
    );
  }

  @override
  FutureOr unregister<T extends Object>({
    Object? instance,
    String? instanceName,
    FutureOr Function(T p1)? disposingFunction,
  }) {
    return _serviceLocator.unregister<T>(
      instance: instance,
      instanceName: instanceName,
      disposingFunction: disposingFunction,
    );
  }

  @override
  T get<T extends Object>({param1, param2, String? instanceName, Type? type}) {
    return _serviceLocator.get<T>(
      param1: param1,
      param2: param2,
      instanceName: instanceName,
      type: type,
    );
  }
}
