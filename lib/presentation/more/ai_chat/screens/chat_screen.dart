import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../providers/chat_provider.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty || ref.read(chatProvider).isStreaming) return;
    _messageController.clear();
    ref.read(chatProvider.notifier).sendMessage(text);
  }

  void _sendSuggested(String text) {
    if (ref.read(chatProvider).isStreaming) return;
    ref.read(chatProvider.notifier).sendMessage(text);
  }

  void _showSessionsSheet() {
    final chatState = ref.read(chatProvider);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          maxChildSize: 0.9,
          minChildSize: 0.3,
          expand: false,
          builder: (context, scrollController) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Chat History',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: chatState.sessions.isEmpty
                      ? const Center(child: Text('No chat history'))
                      : ListView.builder(
                          controller: scrollController,
                          itemCount: chatState.sessions.length,
                          itemBuilder: (context, index) {
                            final session = chatState.sessions[index];
                            return ListTile(
                              title: Text(
                                session.title ?? 'Chat ${session.id}',
                              ),
                              subtitle: session.createdAt != null
                                  ? Text(
                                      '${session.createdAt!.toLocal()}'.split(
                                        ' ',
                                      )[0],
                                    )
                                  : null,
                              selected: session.id == chatState.activeSessionId,
                              onTap: () {
                                ref
                                    .read(chatProvider.notifier)
                                    .loadHistory(session.id);
                                Navigator.pop(context);
                              },
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return AlertDialog(
                                      title: const Text('Delete Chat?'),
                                      content: Text(
                                        'Delete "${session.title ?? 'Chat ${session.id}'}"?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(dialogContext),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            ref
                                                .read(chatProvider.notifier)
                                                .deleteSession(session.id);
                                            Navigator.pop(dialogContext);
                                          },
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(chatProvider, (prev, next) {
      if (prev?.messages.length != next.messages.length) {
        Future.microtask(() {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        });
      }
    });

    final chatState = ref.watch(chatProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Financial Advisor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history_rounded),
            onPressed: _showSessionsSheet,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: chatState.messages.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        children:
                            [
                                  'How can I save more this month?',
                                  'Analyze my spending habits',
                                  'What subscriptions should I review?',
                                  'Am I on track with my budgets?',
                                ]
                                .map(
                                  (prompt) => ActionChip(
                                    label: Text(prompt),
                                    onPressed: () => _sendSuggested(prompt),
                                  ),
                                )
                                .toList(),
                      ),
                    ),
                  )
                : ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    itemCount: chatState.messages.length,
                    itemBuilder: (context, index) {
                      final reversedIndex =
                          chatState.messages.length - 1 - index;
                      final message = chatState.messages[reversedIndex];
                      final isUser = message.role == 'user';

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Align(
                          alignment: isUser
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.75,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: isUser
                                  ? AppColors.primarySeed
                                  : Colors.grey.shade100,
                              borderRadius: isUser
                                  ? const BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    )
                                  : const BorderRadius.only(
                                      bottomRight: Radius.circular(16),
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    message.content,
                                    style: TextStyle(
                                      color: isUser
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                                if (message.isStreaming)
                                  const _StreamingCursor(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Ask about your finances...',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      maxLength: 2000,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FloatingActionButton.small(
                    heroTag: 'chat_send',
                    onPressed: _sendMessage,
                    child: const Icon(Icons.arrow_upward),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StreamingCursor extends StatefulWidget {
  const _StreamingCursor();

  @override
  State<_StreamingCursor> createState() => _StreamingCursorState();
}

class _StreamingCursorState extends State<_StreamingCursor>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        width: 2,
        height: 16,
        margin: const EdgeInsets.only(left: 4),
        color: const Color(0xFF616161),
      ),
    );
  }
}
