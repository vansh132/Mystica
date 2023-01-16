class Note {
  final String notebookId;
  final String id;
  final String title;
  final String body;
  final String tag;
  final DateTime createdAt;

  Note({
    required this.notebookId,
    required this.id,
    required this.title,
    required this.body,
    required this.tag,
    required this.createdAt,
  });
}
