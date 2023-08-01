class TransactionModel {
  String? id;
  String? created;
  String? description;
  int? amount;
  Fees? fees;
  String? currency;
  Merchant? merchant;
  String? notes;
  Metadata? metadata;
  String? labels;
  String? attachments;
  String? international;
  String? category;
  Categories? categories;
  bool? isLoad;
  String? settled;
  int? localAmount;
  String? localCurrency;
  String? updated;
  String? accountId;
  String? userId;
  Counterparty? counterparty;
  String? scheme;
  String? dedupeId;
  bool? originator;
  bool? includeInSpending;
  bool? canBeExcludedFromBreakdown;
  bool? canBeMadeSubscription;
  bool? canSplitTheBill;
  bool? canAddToTab;
  bool? canMatchTransactionsInCategorization;
  bool? amountIsPending;
  String? atmFeesDetailed;
  String? parentAccountId;

  TransactionModel(
      {this.id,
      this.created,
      this.description,
      this.amount,
      this.fees,
      this.currency,
      this.merchant,
      this.notes,
      this.metadata,
      this.labels,
      this.attachments,
      this.international,
      this.category,
      this.categories,
      this.isLoad,
      this.settled,
      this.localAmount,
      this.localCurrency,
      this.updated,
      this.accountId,
      this.userId,
      this.counterparty,
      this.scheme,
      this.dedupeId,
      this.originator,
      this.includeInSpending,
      this.canBeExcludedFromBreakdown,
      this.canBeMadeSubscription,
      this.canSplitTheBill,
      this.canAddToTab,
      this.canMatchTransactionsInCategorization,
      this.amountIsPending,
      this.atmFeesDetailed,
      this.parentAccountId});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    description = json['description'];
    amount = json['amount'];
    fees = json['fees'] != null ? new Fees.fromJson(json['fees']) : null;
    currency = json['currency'];
    merchant = json['merchant'] != null
        ? new Merchant.fromJson(json['merchant'])
        : null;
    notes = json['notes'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    labels = json['labels'];
    attachments = json['attachments'];
    international = json['international'];
    category = json['category'];
    categories = json['categories'] != null
        ? new Categories.fromJson(json['categories'])
        : null;
    isLoad = json['is_load'];
    settled = json['settled'];
    localAmount = json['local_amount'];
    localCurrency = json['local_currency'];
    updated = json['updated'];
    accountId = json['account_id'];
    userId = json['user_id'];
    counterparty = json['counterparty'] != null
        ? new Counterparty.fromJson(json['counterparty'])
        : null;
    scheme = json['scheme'];
    dedupeId = json['dedupe_id'];
    originator = json['originator'];
    includeInSpending = json['include_in_spending'];
    canBeExcludedFromBreakdown = json['can_be_excluded_from_breakdown'];
    canBeMadeSubscription = json['can_be_made_subscription'];
    canSplitTheBill = json['can_split_the_bill'];
    canAddToTab = json['can_add_to_tab'];
    canMatchTransactionsInCategorization =
        json['can_match_transactions_in_categorization'];
    amountIsPending = json['amount_is_pending'];
    atmFeesDetailed = json['atm_fees_detailed'];
    parentAccountId = json['parent_account_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created'] = this.created;
    data['description'] = this.description;
    data['amount'] = this.amount;
    if (this.fees != null) {
      data['fees'] = this.fees!.toJson();
    }
    data['currency'] = this.currency;
    if (this.merchant != null) {
      data['merchant'] = this.merchant!.toJson();
    }
    data['notes'] = this.notes;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['labels'] = this.labels;
    data['attachments'] = this.attachments;
    data['international'] = this.international;
    data['category'] = this.category;
    if (this.categories != null) {
      data['categories'] = this.categories!.toJson();
    }
    data['is_load'] = this.isLoad;
    data['settled'] = this.settled;
    data['local_amount'] = this.localAmount;
    data['local_currency'] = this.localCurrency;
    data['updated'] = this.updated;
    data['account_id'] = this.accountId;
    data['user_id'] = this.userId;
    if (this.counterparty != null) {
      data['counterparty'] = this.counterparty!.toJson();
    }
    data['scheme'] = this.scheme;
    data['dedupe_id'] = this.dedupeId;
    data['originator'] = this.originator;
    data['include_in_spending'] = this.includeInSpending;
    data['can_be_excluded_from_breakdown'] = this.canBeExcludedFromBreakdown;
    data['can_be_made_subscription'] = this.canBeMadeSubscription;
    data['can_split_the_bill'] = this.canSplitTheBill;
    data['can_add_to_tab'] = this.canAddToTab;
    data['can_match_transactions_in_categorization'] =
        this.canMatchTransactionsInCategorization;
    data['amount_is_pending'] = this.amountIsPending;
    data['atm_fees_detailed'] = this.atmFeesDetailed;
    data['parent_account_id'] = this.parentAccountId;
    return data;
  }
}

class Fees {
  int? depositCash;

  Fees({this.depositCash});

  Fees.fromJson(Map<String, dynamic> json) {
    depositCash = json['deposit.cash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deposit.cash'] = this.depositCash;
    return data;
  }
}

class Merchant {
  String? id;
  String? groupId;
  String? name;
  String? logo;
  String? emoji;
  String? category;
  bool? online;
  bool? atm;
  Address? address;
  bool? disableFeedback;
  Metadata? metadata;

  Merchant(
      {this.id,
      this.groupId,
      this.name,
      this.logo,
      this.emoji,
      this.category,
      this.online,
      this.atm,
      this.address,
      this.disableFeedback,
      this.metadata});

  Merchant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    name = json['name'];
    logo = json['logo'];
    emoji = json['emoji'];
    category = json['category'];
    online = json['online'];
    atm = json['atm'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    disableFeedback = json['disable_feedback'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['group_id'] = this.groupId;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['emoji'] = this.emoji;
    data['category'] = this.category;
    data['online'] = this.online;
    data['atm'] = this.atm;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['disable_feedback'] = this.disableFeedback;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    return data;
  }
}

class Address {
  String? shortFormatted;
  String? city;
  double? latitude;
  double? longitude;
  int? zoomLevel;
  bool? approximate;
  String? formatted;
  String? address;
  String? region;
  String? country;
  String? postcode;

  Address(
      {this.shortFormatted,
      this.city,
      this.latitude,
      this.longitude,
      this.zoomLevel,
      this.approximate,
      this.formatted,
      this.address,
      this.region,
      this.country,
      this.postcode});

  Address.fromJson(Map<String, dynamic> json) {
    shortFormatted = json['short_formatted'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    zoomLevel = json['zoom_level'];
    approximate = json['approximate'];
    formatted = json['formatted'];
    address = json['address'];
    region = json['region'];
    country = json['country'];
    postcode = json['postcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['short_formatted'] = this.shortFormatted;
    data['city'] = this.city;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['zoom_level'] = this.zoomLevel;
    data['approximate'] = this.approximate;
    data['formatted'] = this.formatted;
    data['address'] = this.address;
    data['region'] = this.region;
    data['country'] = this.country;
    data['postcode'] = this.postcode;
    return data;
  }
}

class Metadata {
  String? website;

  Metadata({this.website});

  Metadata.fromJson(Map<String, dynamic> json) {
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['website'] = this.website;
    return data;
  }
}

class Metadata1 {
  String? asyncTransaction;
  String? ledgerInsertionId;
  String? paypointLifecycleId;
  String? paypointMessageId;

  Metadata1(
      {this.asyncTransaction,
      this.ledgerInsertionId,
      this.paypointLifecycleId,
      this.paypointMessageId});

  Metadata1.fromJson(Map<String, dynamic> json) {
    asyncTransaction = json['async_transaction'];
    ledgerInsertionId = json['ledger_insertion_id'];
    paypointLifecycleId = json['paypoint_lifecycle_id'];
    paypointMessageId = json['paypoint_message_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['async_transaction'] = this.asyncTransaction;
    data['ledger_insertion_id'] = this.ledgerInsertionId;
    data['paypoint_lifecycle_id'] = this.paypointLifecycleId;
    data['paypoint_message_id'] = this.paypointMessageId;
    return data;
  }
}

class Categories {
  int? income;

  Categories({this.income});

  Categories.fromJson(Map<String, dynamic> json) {
    income = json['income'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['income'] = this.income;
    return data;
  }
}

class Counterparty {
  Counterparty.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
