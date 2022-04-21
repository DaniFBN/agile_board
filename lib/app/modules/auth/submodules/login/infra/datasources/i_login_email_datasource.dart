import 'package:fpdart/fpdart.dart';

import '../../domain/helpers/params.dart';

abstract class ILoginEmailDatasource {
  Future<Unit> call(LoginEmailParam param);
}
