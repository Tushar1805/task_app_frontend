class UserDetailsResponseModel {
  UserDetailsResponseModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  UserDetailsResponseModel.fromJson(final Map<String, dynamic>? json)
      : status = json?['status'] as bool?,
        statusCode = json?['status_code'] as int?,
        message = json?['message'] as String?,
        data = (json?['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json?['data'] as Map<String, dynamic>)
            : null;
  final bool? status;
  final int? statusCode;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() => {
        'status': status,
        'status_code': statusCode,
        'message': message,
        'data': data?.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.dialCode,
    this.mobile,
    this.gender,
    this.cityType,
    this.fullAddress,
    this.address,
    this.city,
    this.state,
    this.postalCode,
    this.longitude,
    this.latitude,
    this.photo,
    this.otp,
    this.otpExpireAt,
    this.userType,
    this.registrationDone,
    this.status,
    this.fcmToken,
    this.googleId,
    this.facebookId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoUrl,
    this.profilePhotoThumbUrl,
  });

  Data.fromJson(final Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        email = json['email'] as String?,
        emailVerifiedAt = json['email_verified_at'],
        dialCode = json['dial_code'] as String?,
        mobile = json['mobile'] as String?,
        gender = json['gender'],
        cityType = json['city_type'] as String?,
        fullAddress = json['full_address'] as String?,
        address = json['address'] as String?,
        city = json['city'] as String?,
        state = json['state'] as String?,
        postalCode = json['postal_code'] as String?,
        longitude = json['longitude'] as double?,
        latitude = json['latitude'] as double?,
        photo = json['photo'],
        otp = json['otp'],
        otpExpireAt = json['otp_expire_at'],
        userType = json['user_type'] as int?,
        registrationDone = json['registration_done'] as int?,
        status = json['status'] as int?,
        fcmToken = json['fcm_token'] as String?,
        googleId = json['google_id'],
        facebookId = json['facebook_id'],
        deletedAt = json['deleted_at'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        profilePhotoUrl = json['profile_photo_url'],
        profilePhotoThumbUrl = json['profile_photo_thumb_url'];
  final int? id;
  final String? name;
  final String? email;
  final dynamic emailVerifiedAt;
  final String? dialCode;
  final String? mobile;
  final dynamic gender;
  final String? cityType;
  final String? fullAddress;
  final String? address;
  final String? city;
  final String? state;
  final String? postalCode;
  final double? longitude;
  final double? latitude;
  final dynamic photo;
  final dynamic otp;
  final dynamic otpExpireAt;
  final int? userType;
  final int? registrationDone;
  final int? status;
  final String? fcmToken;
  final dynamic googleId;
  final dynamic facebookId;
  final dynamic deletedAt;
  final String? createdAt;
  final String? updatedAt;
  final dynamic profilePhotoUrl;
  final dynamic profilePhotoThumbUrl;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'email_verified_at': emailVerifiedAt,
        'dial_code': dialCode,
        'mobile': mobile,
        'gender': gender,
        'city_type': cityType,
        'full_address': fullAddress,
        'address': address,
        'city': city,
        'state': state,
        'postal_code': postalCode,
        'longitude': longitude,
        'latitude': latitude,
        'photo': photo,
        'otp': otp,
        'otp_expire_at': otpExpireAt,
        'user_type': userType,
        'registration_done': registrationDone,
        'status': status,
        'fcm_token': fcmToken,
        'google_id': googleId,
        'facebook_id': facebookId,
        'deleted_at': deletedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'profile_photo_url': profilePhotoUrl,
        'profile_photo_thumb_url': profilePhotoThumbUrl,
      };
}
