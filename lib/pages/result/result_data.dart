class TestResult {
  final int id;
  final bool opened;
  final bool completed;
  final int sum;
  final DateTime? openedAt;
  final DateTime? completedAt;

  TestResult({
    required this.id,
    required this.opened,
    required this.completed,
    required this.sum,
    this.openedAt,
    this.completedAt,
  });

  factory TestResult.fromJson(Map<String, dynamic> json) {
    return TestResult(
      id: json['id'],
      opened: json['opened'],
      completed: json['completed'],
      sum: json['sum'],
      openedAt: json['openedAt'] != null ? DateTime.parse(json['openedAt']) : null,
      completedAt: json['completedAt'] != null ? DateTime.parse(json['completedAt']) : null,
    );
  }
}
