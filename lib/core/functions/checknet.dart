import 'dart:io';

checkInterNet() async {
  try {
    var response = await InternetAddress.lookup("google.com");
    if (response.isNotEmpty && response[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}
