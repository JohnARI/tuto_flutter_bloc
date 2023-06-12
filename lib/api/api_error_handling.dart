class ApiErrorHandling {
  static String getErrorMessage(int errorCode) {
    if (errorCode >= 400 && errorCode < 500) {
      return 'Erreur de client';
    }
    if (errorCode >= 500 && errorCode < 600) {
      return 'Erreur de serveur';
    } else {
      return 'Erreur inconnue';
    }
  }
}
