class FAQ {
  String title;
  String body;
  bool isExpanded;

  FAQ(
    this.title,
    this.body,
    [this.isExpanded = false]
  );
}

List<FAQ> getFaqs() {
  return [
    FAQ("Как работает приложение?", "Something"),
    FAQ("Какие предметы охватывает?", "Something"),
    FAQ("Могу ли я использовать в оффлайн-режиме?", "Хотя BN Academy предпочтительно использовать онлайн для получения обновлений и доступа к новым материалам, некоторые ресурсы могут быть загружены для использования в оффлайн-режиме, чтобы обеспечить непрерывную подготовку."),
    FAQ("Есть ли какие-либо расходы за использование?", "Something"),
    FAQ("Как я могу получить поддержку, если у меня возникли проблемы с приложением?", "Something")
  ];
}