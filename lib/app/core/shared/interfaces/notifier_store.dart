import 'package:flutter_triple/flutter_triple.dart';

import '../failures/i_app_exception.dart';

abstract class IBoardNotifierStore<State extends Object>
    extends NotifierStore<IAppException, State> {
  IBoardNotifierStore(State initialState) : super(initialState);

  bool get hasError => error != null;
  State get currentState => state;
}
