class Sensor {
  int? id;
  double? ts;
  double? co;
  double? humidity;
  double? lpg;
  double? smoke;
  double? temp;

  Sensor(
      {this.id,
      this.ts,
      this.co,
      this.humidity,
      this.lpg,
      this.smoke,
      this.temp});

  Sensor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ts = json['ts'];
    co = json['co'];
    humidity = json['humidity'];
    lpg = json['lpg'];
    smoke = json['smoke'];
    temp = json['temp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ts'] = ts;
    data['co'] = co;
    data['humidity'] = humidity;
    data['lpg'] = lpg;
    data['smoke'] = smoke;
    data['temp'] = temp;
    return data;
  }
}
