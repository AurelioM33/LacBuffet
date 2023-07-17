String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email e/ou senha invalidos';

    case 'Invalid session token':
      return 'Token inválido';

    case 'INVALID_FULLNAME':
      return 'Ocorreu um erro ao cadastras usuário: Nome inválido';

    case 'Invalid_PHONE':
      return 'Ocorreu um erro ao cadastras usuário: Celular inválido';

    case 'Invalid_CPF':
      return 'Ocorreu um erro ao cadastras usuário: CPF inválido';

    default:
      return 'um erro indefinido ocorreu';
  }
}
