class ApiEndPoints {
  static const String baseUrl =
      'https://www.visaino.com/lawyers/backend/public';
  static const String apiKey = "4efbae7ad2853174bfa06313080ee4fe";
  static const String loginPortal = 'https://www.visaino.com/lawyers/public';
  // Bundles
  static const String showBundles = '$baseUrl/bundles/show_bundles.php';
  static const String checkOut =
      '$baseUrl/payment/checkout.php?api_key=$apiKey';

  // Authentication

  static const String register = '$baseUrl/auth/register.php';
  static const String login = '$baseUrl/auth/login.php';
  static const String checkAuth = '$baseUrl/auth/check_auth.php';

  // clients
  static const String showClientsDropDown =
      '$baseUrl/clients/show_clients_dropdown.php';
  static const String showClients = '$baseUrl/clients/show_clients.php';
  static const String addClient = '$baseUrl/clients/add_client.php';

  // Cases
  static const String showCases = '$baseUrl/cases/show_cases.php';
  static const String showCaseFiles = '$baseUrl/cases/show_case_files.php';
  static const String addCaseFile = '$baseUrl/cases/add_case_file.php';
  static const String addCase = '$baseUrl/cases/add_case.php';
}
