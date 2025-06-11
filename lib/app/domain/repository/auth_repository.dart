import 'package:flutter_kasir/core/network/data_state.dart';
import 'package:flutter_kasir/app/domain/entity/auth.dart';

abstract class AuthRepository {
  Future<DataState> login(AuthEntity param);
}
