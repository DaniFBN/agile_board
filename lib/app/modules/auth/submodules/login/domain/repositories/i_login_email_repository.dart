import 'package:fpdart/fpdart.dart';

import '../../../../../../core/shared/failures/i_app_exception.dart';
import '../helpers/params.dart';

abstract class ILoginEmailRepository {
  Future<Either<IAppException, Unit>> call(LoginEmailParam param);
}
