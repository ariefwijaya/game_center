class ApiPath {
  ApiPath._();
  static const String dashboardOnboardingCompleteness =
      "/dashboard/onboarding/completeness";
  static const String gocreatorGetConnect = "/phyllo/getConnectConfig";
  static const String gocreatorInsertAccount = "/phyllo/insertAccount";
  static const String gocreatorDisconnect = "/phyllo/disconnectAccount";
  static const String profileSocmedAccount =
      "/profile/c/setting/getSocmedAccounts";
  static const String dashboardCelebritySocial =
      "/dashboard/celebrity/phyllo/getSocialAnalytic";
  static const String dashboardCelebrityProfile =
      "/dashboard/celebrity/getProfileSprint9";
  static const String creatorValidateSocial = "/creator/validateSocial";
  static const String verifotpSendOtp = "/messaging/otp/send";
  static const String verifotpVerifOtp = "/messaging/otp/verify";
  static const String profileUser = "/profile/u/setting/get";
  static const String montoolsSuitableJob =
      "/dashboard/celebrity/montools/suitableJob";
  static const String montoolsCommentToPost =
      "/dashboard/celebrity/montools/commentToPost";
  static const String montoolsBrandDeals =
      "/dashboard/celebrity/brand_deals/list";
  static const String montoolsJobDetail =
      "/dashboard/celebrity/jobnetwork/detail";
  static const String montoolsJobDetailSubmit =
      "/dashboard/celebrity/jobnetwork/detail_submit";
  static const String montoolsJobSubmit =
      "/dashboard/celebrity/jobnetwork/submit";
  static const String referral = "/referral";
  static const String referralCheck = "/referral/check";

  static const String taskDeals = "/brand-deals-task";
  static const String draftSubmit = "/brand-deals-task/submit";
  static const String draftUpload = "/brand-deals-task/upload";
  static const String campaignBrief = "/dashboard/celebrity/brand_deals/brief";

  static const String logout = "/logout";
  static const String metadata = '/metadata';
  static const String bannerHome = "/banner";
  static const String jobList = "/dashboard/celebrity/montools/jobs";
  static const String growthspaceBalances = "/dashboard/growthspace/balances";
  static const String growthspaceCreators = "/dashboard/growthspace/creators";
  static const String growthspaceVerify = "/dashboard/growthspace/follow";
  static const String growthspaceExchangeList =
      "/dashboard/growthspace/redeem_items";
  static const String growthspaceExchangeRedeem =
      "/dashboard/growthspace/redeem";
  static const String growthspaceHistory = "/dashboard/growthspace/histories";

  static const String userBalance = "/dashboard/celebrity/getBalance";
  static const String notifSettingList =
      "/notification/getNotificationConfiguration";
  static const String notifUnread = "/notification/getTotalUnreadByRole";
}
