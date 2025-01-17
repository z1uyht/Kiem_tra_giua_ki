class PingResponse {
  final String mess;

  PingResponse({
    required this.mess,
  });

  factory PingResponse.fromJson(Map<String, dynamic> json) {
    return PingResponse(
      mess: json["mess"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "mess": mess,
    };
  }
}
