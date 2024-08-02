
class MetaData {
  var code;
  var developerMessage;
  late UserMessages messages;
  var accessToken;

  MetaData(this.messages);

  factory MetaData.fromJson(Map<String, dynamic> json) {
    var code = json['code'];
    var developerMessage = json['developer_message'];
    var messages = UserMessages.fromJson(json['user_messages']);
    var accessToken = json['access_token'];

    return MetaData(messages)
      ..code = code
      ..developerMessage = developerMessage
      ..accessToken = accessToken;
  }
}

class UserMessages {
  var message;

  UserMessages(this.message);

  factory UserMessages.fromJson(Map<String, dynamic> json) {
    var message = json['en'];

    return UserMessages(message);
  }
}
































// class MetaData {
//   var code;
//   var developerMessage;
//    late UserMessages messages;
//   var accessToken;
//   MetaData(this.messages);

//   factory MetaData.fromJson(Map<String, dynamic> json) {
//     MetaData d = MetaData();
//     d.code = json['code'];
//     d.developerMessage = json['developer_message'];
//     d.messages = UserMessages.fromJson(json['user_messages']);
//     d.accessToken = json['access_token'];
//     return d;
//   }
// }

// class UserMessages {
//   var message;
//   UserMessages(this.message);
//   factory UserMessages.fromJson(Map<String, dynamic> json) {
//     UserMessages userMessages = UserMessages();

//     userMessages.message = json['en'];

//     return userMessages;
//   }
// }
