import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/chat_message_model.dart';

final chatMessagesProvider = StateProvider<List<ChatMessageModel>>((ref) => []);
