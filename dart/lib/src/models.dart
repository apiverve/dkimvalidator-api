/// Response models for the DKIM Validator API.

/// API Response wrapper.
class DkimvalidatorResponse {
  final String status;
  final dynamic error;
  final DkimvalidatorData? data;

  DkimvalidatorResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory DkimvalidatorResponse.fromJson(Map<String, dynamic> json) => DkimvalidatorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? DkimvalidatorData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the DKIM Validator API.

class DkimvalidatorData {
  String? dkimHost;
  String? dkimRecord;
  int? dkimRecordsCount;
  bool? hasDkimRecord;
  String? host;
  List<DkimvalidatorDataIssuesFoundItem>? issuesFound;
  String? keyType;
  String? selector;
  bool? valid;
  String? version;

  DkimvalidatorData({
    this.dkimHost,
    this.dkimRecord,
    this.dkimRecordsCount,
    this.hasDkimRecord,
    this.host,
    this.issuesFound,
    this.keyType,
    this.selector,
    this.valid,
    this.version,
  });

  factory DkimvalidatorData.fromJson(Map<String, dynamic> json) => DkimvalidatorData(
      dkimHost: json['dkim_host'],
      dkimRecord: json['dkim_record'],
      dkimRecordsCount: json['dkim_records_count'],
      hasDkimRecord: json['has_dkim_record'],
      host: json['host'],
      issuesFound: (json['issues_found'] as List?)?.map((e) => DkimvalidatorDataIssuesFoundItem.fromJson(e)).toList(),
      keyType: json['key_type'],
      selector: json['selector'],
      valid: json['valid'],
      version: json['version'],
    );
}

class DkimvalidatorDataIssuesFoundItem {
  String? code;
  String? message;
  String? type;

  DkimvalidatorDataIssuesFoundItem({
    this.code,
    this.message,
    this.type,
  });

  factory DkimvalidatorDataIssuesFoundItem.fromJson(Map<String, dynamic> json) => DkimvalidatorDataIssuesFoundItem(
      code: json['code'],
      message: json['message'],
      type: json['type'],
    );
}

class DkimvalidatorRequest {
  String domain;

  DkimvalidatorRequest({
    required this.domain,
  });

  Map<String, dynamic> toJson() => {
      'domain': domain,
    };
}
