import 'package:cuban_seller/data_access/account/domain/repositories/account_repository.dart';

class DeleteAccountUsecases {
  final AccountRepository repository;

  DeleteAccountUsecases(this.repository);

  Future<bool> call(int id) async => repository.deleteAccount(id);
}
