final class CampaignEntity {
  int id;
  String title;
  DateTime startDate;
  DateTime endDate;
  bool isCollected;
  CampaignEntity({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.isCollected,
  });
}
