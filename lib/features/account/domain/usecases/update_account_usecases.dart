import 'package:cuban_seller/features/account/domain/entities/account.dart';
import 'package:cuban_seller/features/account/domain/entities/coin.dart';
import 'package:cuban_seller/features/account/domain/repositories/account_repository.dart';

class UpdateAccountUsecases {
  final AccountRepository repository;

  UpdateAccountUsecases(this.repository);

  /// Actualiza una cuenta específica.
  /// ## Descripción
  ///
  /// Este método del servicio actúa como intermediario entre la capa de negocio
  /// y el repositorio para actualizar los datos de una cuenta identificada por ID.
  /// Es el punto de entrada principal para operaciones de actualización de cuentas.
  ///
  /// ## Parámetros
  /// - `id` (`int`): ID único de la cuenta a actualizar.
  /// - `account` (`UpdateAccountParam`): Parámetros con los datos a modificar
  ///   (solo campos no nulos se aplican en la actualización).
  ///
  /// ## Retorna
  /// `Future<Account>`: La cuenta completa actualizada con todos sus datos.
  ///
  /// ## Ejemplo de uso
  /// ```
  /// final result = await accountService.call(
  ///   123,
  ///   UpdateAccountParam(
  ///     name: 'Nuevo Nombre',
  ///     email: 'nuevo@ejemplo.com',
  ///   ),
  /// );
  /// ```
  ///
  /// ## Excepciones posibles
  /// - `AccountNotFoundException`: Cuenta no existe.
  /// - `ValidationException`: Datos inválidos.
  /// - `NetworkException`: Error de conexión.
  Future<Account?> call(int id, UpdateAccountParam account) async =>
      repository.updateAccount(id, account);
}

class UpdateAccountParam {
  final String? name;
  final double? amount;
  final Coin? coin;

  UpdateAccountParam({this.name, this.amount, this.coin});
}
