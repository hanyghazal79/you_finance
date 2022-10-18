// ignore_for_file: prefer_const_declarations

class Strings {
  // TABLE NAMES
  static final String usersTableName = "users";
  static final String loginTableName = "login";
  static final String suppliersTableName = "suppliers";
  static final String clientsTableName = "clients";
  static final String supplierTransactionsTableName = "supplier_transactions";
  static final String clientTransactionsTableName = "client_transactions";
  // static Map<String, Map> tableStrings = {
  //   "users": {"id":"id", "email": "email", "password": "password"},
  //   "login": {"datetime": "datetime", "user_id": "user_id"},
  //   "suppliers": {"id": "id", "name": "name", "phone": "phone", "address": "address"},
  //   "clients": {"id": "id", "name": "name", "phone": "phone", "address": "address"},
  //   "supplier_transactions": {"id": "id", "value": "value", "type": "type", "datetime": "datetime", "supplier_id": "supplier_id"},
  //   "client_transactions": {"id": "id", "value": "value", "type": "type", "datetime": "datetime", "client_id": "supplier_id"}

  //   };
  // CREATE TABLES SQLs
  static final String sqlTableUsers =
      'CREATE TABLE $usersTableName (id INTEGER PRIMARY KEY NOT NULL, email TEXT, password TEXT)';
  // static final String sqlTableLogin =
  //     'CREATE TABLE $loginTableName (datetime DATETIME, user_id INTEGER, FOREIGN KEY(user_id) REFERENCES users(id))';
  static final String sqlTableLogin =
      'CREATE TABLE $loginTableName (datetime DATETIME, email TEXT, password TEXT)';
  static final String sqlTableSuppliers =
      "CREATE TABLE $suppliersTableName ( id INTEGER PRIMARY KEY NOT NULL, name TEXT, phone TEXT, address TEXT)";
  static final String sqlTableClients =
      "CREATE TABLE $clientsTableName ( id INTEGER PRIMARY KEY NOT NULL, name TEXT, phone TEXT, address TEXT)";
  static final String sqlTableSupplierTransactions =
      'CREATE TABLE $supplierTransactionsTableName (id INTEGER PRIMARY KEY NOT NULL, value REAL, type TEXT, datetime DATETIME, supplier_id INTEGER, FOREIGN KEY(supplier_id) REFERENCES suppliers(id))';
  static final String sqlTableClientTransactions =
      'CREATE TABLE $clientTransactionsTableName (id INTEGER PRIMARY KEY NOT NULL, value REAL, type TEXT, datetime DATETIME, client_id INTEGER, FOREIGN KEY(client_id) REFERENCES clients(id))';

  static final String sqlDeleteLogin = "DELETE FROM login";
  static String? result;
  static String path = "";
  static final String suppliersPath = 'SUPPLIERS';
  static final String clientsPath = 'CLIENTS';
}
