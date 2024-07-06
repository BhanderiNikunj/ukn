import 'dart:io';
import 'package:unk/exports.dart';

class ChatSupportController extends GetxController {
  int userId = 0;

  TextEditingController sendMesssageController = TextEditingController();
  bool isLoading = false;
  List<ChatSupportModel> listOfChat = [];

  Future<void> getUserId() async {
    userId = await SharedHelper.getLoginData();
    update();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChatMessage() {
    return FirebaseFirestore.instance
        .collection("chat_box")
        .doc(userId.toString())
        .collection("chat_list")
        .snapshots();
  }

  void sendChatMessage({String? message}) {
    String id = listOfChat.isEmpty
        ? "100000001"
        : ((int.tryParse(listOfChat.last.id) ?? 0) + 1).toString();
    FirebaseFirestore.instance
        .collection("chat_box")
        .doc(userId.toString())
        .collection("chat_list")
        .doc(id)
        .set(
      {
        "date_time": DateTime.now().microsecondsSinceEpoch,
        "is_send": true,
        "message": message ?? sendMesssageController.text,
        "message_type": message != null ? "image" : "text",
        "user_name": "User",
      },
    );
    sendMesssageController.clear();
  }

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['jpg', 'png'],
      type: FileType.custom,
    );
    if (result?.files.isNotEmpty ?? false) {
      if (result!.files.first.path != null) {
        isLoading = true;
        update();
        await firebaseStorage
            .ref('$userId')
            .child(result.files.first.xFile.path.split('/').last)
            .putFile(File(result.files.first.xFile.path));
        String imagePath = await firebaseStorage
            .ref('$userId')
            .child(result.files.first.xFile.path.split('/').last)
            .getDownloadURL();
        sendChatMessage(message: imagePath);
        isLoading = false;
        update();
      }
    }
  }
}
