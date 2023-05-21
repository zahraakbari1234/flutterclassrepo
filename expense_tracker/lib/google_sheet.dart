import 'package:gsheets/gsheets.dart';

class GoogleSheetApi {
  static const _credential = r''' 
{
  "type": "service_account",
  "project_id": "gsheet-387015",
  "private_key_id": "ceaadedb4306cca9e10056a2637574156da2ab01",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC9aHnce5+kb9d2\nFIPJH4ZMmCrXsFWoSljheDITYiOsr6PEth+ltcMOpSK1h3sz1BIfQh7GLGLeE56X\nM883GGx0c0DteiOgjv5Wmt5Vv86hL+O322bUh8QmwNEbqW/0lO/MAH3R/otvOJan\nRpj7KH/TnDzd1eHq2OER7v/QaPfKiciG3xTwBKzxs68cbHJdDjVV+rb97WtJ1OAX\nPXYeFOELLTWU4Xyne54r2STlZJFXjgYSZOgaJeeHJwJXZJy0F4pCMliZeRrXmi3r\nD+O9k1iAuGJ5YbJvSUECh0yp8Y/aqIToGeIkgE63AXGrmoHE/jsbTq9uUXxbu33R\nTCrsvO3zAgMBAAECggEATLzfYmzTqROG/9gf7IRRLQcZlHlkuuIkUHUaFLBWM8iV\nWUVQXRrfBDfzcAiL6dup2/A196RUChV401myQmgqyKNJUu2BMbO9Z+km2yby2GtG\nn17Msp6u4eSM0+A586XD4arxTvsKEu2iW/NGV7t4zosmPdpBxZxI07M5AX8FpZCq\nqejapyUCXWw1EOD25qM4Jv/ds/Wf1aTBOU4bOVvj8Rmdt90hF5K+Iq+ZMqeyBvwz\np7e6tLvL1V0N59AhhiM4pY6RRRrJNzlls+2VNa1x8cmUac9FtHmWqZrhrodfuXvi\n9T7VDn/U1FDSpbDTAaBsbjVVvCGfnzB8OB03AV1bAQKBgQDhshMkIZ52QL6BcF9i\npxMXo+Lu+Xl8d+ToYRPoqOG9T2epb+ma3hI5mQ2kzcAq1BH++XQl+QqW6AOBn+kU\nxqoOKLueXZpJLiwS/HEqULq/U9KEvHM+wTQOetm+fkzvJ8Q74XzgufwWcOo2wNDr\nyjLp50jHGpy1zpiiEqDIHyKugwKBgQDW1xOhDVeLR/7LvjIp8IDfvNBjodi1GBU7\nruscAJXRJ4xTvzREUNFjcPS6dZR3V04b4pttZU43Y24iffYUjh/TLHIcYxdfaRO8\njHoTaAnP3n+HoFtxj7Mh/jblKVGmoTGbAYFexWhX25g0TFNWF0zDS0zA5gf257AN\nuGhxtAen0QKBgGFepCdoYab+07GgO2aiUfhW+ibDdogeaaFfkGlFwu4bfct5vrzT\npeU3hM1e/tL7XzAzisp/IPRt8GVSCgqukts884SlOVTtGJKwWlo5LfgxP5eIfefL\nDpxYn+wxLRvYei6jX27MjldYK5Onp/qx5zlGUP2lG4rMMMlrY/YyiJHlAoGBAJre\nogTIBGKf/JnMuoanG4+toZ8gzYIGIVBL0Kn39ge29Z5tR/UzOS3xAEnldqfs5J6P\nZTGgBJlC8OKmYJ0CswhcksnJ2NBrg9G4hku1BNW288HGJAUh7KTFh7b8aSKwMn0l\nwaeasJQc9YRFvRFjbG+fuW2YpQckjzHkzE2i1J3xAoGAMowj9W98Tov9pO5MiQNj\ntr9/5W5OVlTZIVLdO3sTMmT3H72HDsjmYZnLo7IKHSjeyGqjJZg6s9yaZXIc3SkG\nTkELG7M9UvJucHFv+y3t86MDJs4FhllCqM4lXzlU0v8MAhOFwVuGbFBxsFcCHUQ9\npEH6zx1e3RLVA4YdI2GdPso=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheet@gsheet-387015.iam.gserviceaccount.com",
  "client_id": "104314343712619728692",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheet%40gsheet-387015.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';

  static const _id = "1Q6WMgharzeTz0i-d3PKDZvSlsj1zkZ7XNTIs-JiCODI";

  static final gsheet = GSheets(_credential); //doc address
  static Worksheet? _worksheet; //instance of our worksheet

  //Vars
  static int numberOfTransactions = 0;
  static List<List<dynamic>> currentTransaction = [];
  static bool loading = true;

  static init() async {
    final spreadSheet = await gsheet.spreadsheet(_id); //spreadsheet address
    _worksheet = spreadSheet.worksheetByTitle("workSheet1"); //sheet name
    countRows();
  }

  static Future countRows() async {
    while ((await _worksheet!.values
            .value(column: 1, row: numberOfTransactions + 1)) !=
        '') {
      numberOfTransactions++;
    }
    loadTransactions();
  }

  static loadTransactions() async {
    if (_worksheet == null) return;
    for (int i = 1; i < numberOfTransactions; i++) {
      final String transactionName =
          await _worksheet!.values.value(column: 1, row: i + 1);

      final String transactionAmount =
          await _worksheet!.values.value(column: 2, row: i + 1);

      final String expenseOrIncome =
          await _worksheet!.values.value(column: 3, row: i + 1);

      if (currentTransaction.length < numberOfTransactions) {
        currentTransaction
            .add([transactionName, transactionAmount, expenseOrIncome]);
      }
    }
    print(currentTransaction);
    loading = false;
  }

  static Future insert(String name, String amount, bool isIncome) async {
    if (_worksheet == null) return;
    numberOfTransactions++;
    currentTransaction.add([
      name,
      amount,
      isIncome == true ? 'income' : 'expense',
    ]);
    await _worksheet!.values.appendRow([
      name,
      amount,
      isIncome == true ? 'income' : 'expense',
    ]);
  }

  static double calculateIncome() {
    double totalIncome = 0;
    for (int i = 0; i < currentTransaction.length; i++) {
      if (currentTransaction[i][2] == 'income') {
        totalIncome += double.parse(currentTransaction[i][1]);
      }
    }
    return totalIncome;
  }



  static double calculateExpense() {
    double totalExpense = 0;
    for (int i = 0; i < currentTransaction.length; i++) {
      if (currentTransaction[i][2] == 'expense') {
        totalExpense += double.parse(currentTransaction[i][1]);
      }
    }
    return totalExpense;
  }

}
