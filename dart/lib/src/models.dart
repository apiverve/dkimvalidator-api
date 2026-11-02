/// Response models for the DKIM Validator API.

/// API Response wrapper.
class DkimvalidatorResponse {
  final String status;
  final dynamic error;
  final DkimvalidatorData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  DkimvalidatorResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory DkimvalidatorResponse.fromJson(Map<String, dynamic> json) => DkimvalidatorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? DkimvalidatorData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the DKIM Validator API.

class DkimvalidatorData {
  String? selector;
  String? host;
  String? dkimHost;
  dynamic cnameTarget;
  bool? hasDkimRecord;
  String? dkimRecord;
  num? dkimRecordsCount;
  String? keyType;
  List<DkimvalidatorDataIssuesFoundItem>? issuesFound;
  bool? valid;
  num? keyBits;
  bool? isTestMode;
  num? riskScore;
  String? riskLevel;

  DkimvalidatorData({
    this.selector,
    this.host,
    this.dkimHost,
    this.cnameTarget,
    this.hasDkimRecord,
    this.dkimRecord,
    this.dkimRecordsCount,
    this.keyType,
    this.issuesFound,
    this.valid,
    this.keyBits,
    this.isTestMode,
    this.riskScore,
    this.riskLevel,
  });

  factory DkimvalidatorData.fromJson(Map<String, dynamic> json) => DkimvalidatorData(
      selector: json['selector'],
      host: json['host'],
      dkimHost: json['dkim_host'],
      cnameTarget: json['cname_target'],
      hasDkimRecord: json['has_dkim_record'],
      dkimRecord: json['dkim_record'],
      dkimRecordsCount: json['dkim_records_count'],
      keyType: json['key_type'],
      issuesFound: (json['issues_found'] as List?)?.map((e) => DkimvalidatorDataIssuesFoundItem.fromJson(e)).toList(),
      valid: json['valid'],
      keyBits: json['key_bits'],
      isTestMode: json['is_test_mode'],
      riskScore: json['risk_score'],
      riskLevel: json['risk_level'],
    );
}

class DkimvalidatorDataIssuesFoundItem {
  String? code;
  String? type;
  String? message;

  DkimvalidatorDataIssuesFoundItem({
    this.code,
    this.type,
    this.message,
  });

  factory DkimvalidatorDataIssuesFoundItem.fromJson(Map<String, dynamic> json) => DkimvalidatorDataIssuesFoundItem(
      code: json['code'],
      type: json['type'],
      message: json['message'],
    );
}

class DkimvalidatorRequest {
  String domain;
  String? selector;

  DkimvalidatorRequest({
    required this.domain,
    this.selector,
  });

  Map<String, dynamic> toJson() => {
      'domain': domain,
      if (selector != null) 'selector': selector,
    };
}
