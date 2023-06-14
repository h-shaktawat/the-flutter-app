import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_twitter_clone/core/core.dart';
import 'package:fpdart/fpdart.dart';

final authAPIProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return AuthAPI(account: account);
});

abstract class IAuthAPI {
  FutureEither<Account> signUp({
    required String email,
    required String password,
  });
  FutureEither<Account> login({
    required String email,
    required String password,
  });
}

class AuthAPI implements IAuthAPI {
  final Account _account;
  AuthAPI({required Account account}) : _account = account;
  @override
  FutureEither<Account> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final account = await _account.create(
          userId: ID.unique(), email: email, password: password);
      return right(account as Account);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(message: e.toString(), stackTrace: stackTrace),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(message: e.toString(), stackTrace: stackTrace),
      );
    }
  }

  FutureEither<Account> login({
    required String email,
    required String password,
  }) async {
    try {
      final account = await _account.create(email: email, password: password);
      return right(account as Account);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(message: e.toString(), stackTrace: stackTrace),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(message: e.toString(), stackTrace: stackTrace),
      );
    }
  }
}
