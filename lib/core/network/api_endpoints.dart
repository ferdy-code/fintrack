class ApiEndpoints {
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String profile = '/auth/profile';

  static const String wallets = '/wallets';
  static String walletDetail(String id) => '/wallets/$id';

  static const String categories = '/categories';
  static String categoryDetail(String id) => '/categories/$id';

  static const String transactions = '/transactions';
  static String transactionDetail(String id) => '/transactions/$id';

  static const String budgets = '/budgets';
  static String budgetDetail(String id) => '/budgets/$id';

  static const String recurring = '/recurring';
  static String recurringDetail(String id) => '/recurring/$id';

  static const String currencies = '/currencies';

  static const String aiInsights = '/ai/insights';
  static const String aiChat = '/ai/chat';

  static const String exportData = '/export';
}
