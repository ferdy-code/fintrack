import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/chat_session_model.dart';
import '../../../../data/repositories/ai_repository.dart';

final aiRepositoryProvider = Provider((ref) => AiRepository());

class ChatMessage {
  final String role;
  final String content;
  final bool isStreaming;
  final DateTime createdAt;

  ChatMessage({
    required this.role,
    required this.content,
    this.isStreaming = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  ChatMessage copyWith({
    String? role,
    String? content,
    bool? isStreaming,
    DateTime? createdAt,
  }) {
    return ChatMessage(
      role: role ?? this.role,
      content: content ?? this.content,
      isStreaming: isStreaming ?? this.isStreaming,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ChatState {
  final List<ChatMessage> messages;
  final bool isLoading;
  final bool isStreaming;
  final List<ChatSessionModel> sessions;
  final int? activeSessionId;
  final String? errorMessage;

  const ChatState({
    this.messages = const [],
    this.isLoading = false,
    this.isStreaming = false,
    this.sessions = const [],
    this.activeSessionId,
    this.errorMessage,
  });

  ChatState copyWith({
    List<ChatMessage>? messages,
    bool? isLoading,
    bool? isStreaming,
    List<ChatSessionModel>? sessions,
    int? activeSessionId,
    String? errorMessage,
    bool clearActiveSessionId = false,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      isStreaming: isStreaming ?? this.isStreaming,
      sessions: sessions ?? this.sessions,
      activeSessionId: clearActiveSessionId
          ? null
          : activeSessionId ?? this.activeSessionId,
      errorMessage: errorMessage,
    );
  }
}

class ChatNotifier extends StateNotifier<ChatState> {
  final AiRepository _repository;

  ChatNotifier(this._repository) : super(const ChatState()) {
    loadSessions();
  }

  Future<void> loadSessions() async {
    state = state.copyWith(isLoading: true);
    try {
      final sessions = await _repository.getChatSessions();
      state = state.copyWith(sessions: sessions, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> loadHistory(int sessionId) async {
    state = state.copyWith(
      isLoading: true,
      messages: [],
      activeSessionId: sessionId,
    );
    try {
      final history = await _repository.getChatHistory(sessionId);
      final messages = history
          .map(
            (m) => ChatMessage(
              role: m.role,
              content: m.content,
              createdAt: m.createdAt,
            ),
          )
          .toList();
      state = state.copyWith(
        messages: messages,
        activeSessionId: sessionId,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> sendMessage(String text) async {
    final userMessage = ChatMessage(role: 'user', content: text);
    final modelMessage = ChatMessage(
      role: 'model',
      content: '',
      isStreaming: true,
    );
    final updatedMessages = [...state.messages, userMessage, modelMessage];
    state = state.copyWith(messages: updatedMessages, isStreaming: true);

    try {
      final stream = _repository.sendChatMessage(
        message: text,
        sessionId: state.activeSessionId,
      );
      String accumulated = '';
      await for (final chunk in stream) {
        accumulated += chunk;
        final messages = [...state.messages];
        if (messages.isNotEmpty) {
          final lastIdx = messages.length - 1;
          messages[lastIdx] = messages[lastIdx].copyWith(content: accumulated);
          state = state.copyWith(messages: messages);
        }
      }
      final messages = [...state.messages];
      if (messages.isNotEmpty) {
        final lastIdx = messages.length - 1;
        messages[lastIdx] = messages[lastIdx].copyWith(isStreaming: false);
        state = state.copyWith(messages: messages, isStreaming: false);
      }
    } catch (e) {
      final messages = [...state.messages];
      if (messages.isNotEmpty) {
        final lastIdx = messages.length - 1;
        messages[lastIdx] = messages[lastIdx].copyWith(isStreaming: false);
        state = state.copyWith(
          messages: messages,
          isStreaming: false,
          errorMessage: e.toString(),
        );
      }
    }
  }

  Future<void> deleteSession(int id) async {
    try {
      await _repository.deleteChatSession(id);
      final sessions = state.sessions.where((s) => s.id != id).toList();
      state = state.copyWith(sessions: sessions);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  void startNewSession() {
    state = state.copyWith(messages: [], clearActiveSessionId: true);
  }
}

final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>(
  (ref) => ChatNotifier(ref.read(aiRepositoryProvider)),
);
