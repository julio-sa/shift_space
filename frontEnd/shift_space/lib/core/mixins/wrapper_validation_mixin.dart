import 'package:shift_space/core/classes/app_exception_class.dart';
import 'package:shift_space/core/classes/error_utils.dart';


mixin WrapperValidationMixin<T, M> {
  /// Valida e retorna a model, ou lança exceção.
  M getValidatedModel(M? model) {
    if (model == null) {
      ErrorUtils.handleAndReturn(
        file: 'WrapperValitationMixin',
        method: 'getValidatedModel',
        error: AppException(
          'Model is null',
        ),
      );
    }
    return model!;
  }

  /// Valida e retorna o usuário, ou lança exceção.
  // User getValidatedUser(User? user) {
  //   if (user == null) {
  //     ErrorUtils.handleAndReturn(
  //       file: 'WrapperValitationMixin',
  //       method: 'getValidatedUser',
  //       error: AppException('User is null'),
  //     );
  //   }
  //   return user!;
  // }
}
