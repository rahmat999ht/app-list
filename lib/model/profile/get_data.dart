class UserProfile {
  final String userName;
  final String? phone;
  final String? address;

  UserProfile({
    required this.userName,
    required this.phone,
    required this.address,
  });

  // Factory constructor to create an instance from a map (e.g. from JSON)
  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      userName: map['userName'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
    );
  }

  // Method to convert an instance to a map (e.g. to JSON)
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'phone': phone,
      'address': address,
    };
  }
}
