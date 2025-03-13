import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:daalu_pay/ui/screen/dashboard/home/exchange_rate_screen.dart';
import 'package:daalu_pay/ui/screen/dashboard/home/home_widget/deposit_screen.dart';
import 'package:daalu_pay/ui/screen/dashboard/home/swap/swap_screen.dart';
import 'package:daalu_pay/ui/screen/dashboard/transaction/transaction_screen.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../../core/core_folder/app/app.router.dart';
import '../../../../core/core_folder/manager/shared_preference.dart';
import '../../../../main.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/contant.dart';
import '../../profile_screen.dart';
import '../../support_screen.dart';
import '../wallet/send_money.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTapped = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      key: scaffoldKey,
      drawer: drawer(),
      body: ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => AuthViewModel(),
          onViewModelReady: (model) async {
            await model.getUser(context);
            await model.getStatistics(context);
            model.walletHome = model.getStatsResponseModel?.data?.wallets![0];
          },
          disposeViewModel: false,
          builder: (_, AuthViewModel model, __) {
            return RefreshIndicator(
              backgroundColor: AppColor.white,
              color: AppColor.primary,
              onRefresh: model.refreshHome,
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.0.w),
                child: Column(children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  paddedWing(
                    value: 8.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () =>
                                scaffoldKey.currentState?.openDrawer(),
                            icon: Icon(
                              Icons.menu,
                              color: AppColor.primary,
                            )),
                        TextView(
                          text:
                              'Welcome ${model.userResponseModel?.data?.firstName ?? ''}',
                          fontSize: 24.20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primary,
                        ),
                        model.userResponseModel == null
                            ? SizedBox.shrink()
                            : GestureDetector(
                                onTap: () {
                                  navigate.navigateTo(Routes.settingScreen);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(7.2.w),
                                  decoration: BoxDecoration(
                                    color: AppColor.inGrey.withOpacity(.22),
                                    border: Border.all(color: AppColor.primary),
                                    shape: BoxShape.circle,
                                  ),
                                  child: TextView(
                                    text: getInitials(
                                            '${model.userResponseModel?.data?.firstName} ${model.userResponseModel?.data?.lastName}')
                                        .toUpperCase(),
                                    fontSize: 20.sp,
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  if (model.getStatsResponseModel == null || model.isLoading)
                    Container(
                      height: 120.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColor.primary.withOpacity(.3)),
                    ),
                  if (model.getStatsResponseModel != null &&
                      model.getStatsResponseModel!.data!.wallets!.isEmpty)
                    Padding(
                      padding: EdgeInsets.all(20.0.w),
                      child: Center(
                        child: TextView(
                          text: 'No Wallet',
                          color: AppColor.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  if (!model.isLoading && model.getStatsResponseModel != null)
                    model.userResponseModel?.data?.kycStatus?.toLowerCase() ==
                            'pending'
                        ? paddedWing(
                            value: 8,
                            child: InkWell(
                              onTap: () => navigate
                                  .navigateTo(Routes.uploadDocumentsScreen),
                              highlightColor: AppColor.white,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                    top: 20.w,
                                    bottom: 20.w,
                                    right: 5.4.w,
                                    left: 20.w),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 37, 50, 77),
                                    borderRadius: BorderRadius.circular(14)),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          text: 'ID VERIFICATION',
                                          color: AppColor.white,
                                          fontSize: 12.2.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          height: 7.4.h,
                                        ),
                                        SizedBox(
                                          width: 210.w,
                                          child: TextView(
                                            text: SharedPreferencesService
                                                        .instance
                                                        .isKycVerified ==
                                                    false
                                                ? 'Verify your ID to\nfinish setting up your Account'
                                                : 'Your KYC has been uploaded,you will be verified once admin\napproves.',
                                            maxLines: 4,
                                            textStyle: GoogleFonts.lato(
                                              color: AppColor.white,
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.all(10.2.w),
                                        padding: EdgeInsets.all(4.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: AppColor.primary),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextView(
                                              text: 'Begin',
                                              color: AppColor.white,
                                              fontSize: 15.2.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: AppColor.white,
                                              size: 18.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  SizedBox(
                    height: model.userResponseModel == null ||
                            model.userResponseModel?.data?.kycStatus
                                    ?.toLowerCase() ==
                                'pending'
                        ? 20.h
                        : 0.h,
                  ),
                  if (model.getStatsResponseModel != null &&
                      model.getStatsResponseModel!.data!.wallets!.isNotEmpty)
                    Card(
                      elevation: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 29.8.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColor.white.withOpacity(.8),
                            gradient: LinearGradient(
                                colors: [
                                  AppColor.white,
                                  AppColor.light,
                                  AppColor.light,
                                  AppColor.primary.withOpacity(.32),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(14)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            paddedWing(
                              value: 16,
                              child: GestureDetector(
                                onTap: () =>
                                    model.modalBottomSheetMenuWallet(context),
                                child: Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: AppColor.inGrey.withOpacity(.22),
                                    border: Border.all(
                                        color:
                                            AppColor.primary.withOpacity(.24)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      model.walletHome?.currency == null
                                          ? SizedBox.shrink()
                                          : Padding(
                                              padding: EdgeInsets.only(
                                                  top: 4.w, bottom: 4.w),
                                              child: SvgPicture.asset(model
                                                  .getWalletCurrencyCode(model
                                                      .walletHome?.currency)),
                                            ),
                                      SizedBox(
                                        width: 16.w,
                                      ),
                                      TextView(
                                        text:
                                            model.walletHome?.currency ?? '...',
                                        color: AppColor.primary,
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: AppColor.primary,
                                        size: 32.sp,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            GestureDetector(
                              onTap: () => setState(() => isTapped = !isTapped),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextView(
                                    text: isTapped
                                        ? '${getAllCurrency(model.walletHome?.currency)}${oCcy.format(model.walletHome?.balance ?? 0)}'
                                        : '**********',
                                    textStyle: TextStyle(
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.primary,
                                        letterSpacing: isTapped ? 1 : 3),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.w),
                                    child: GestureDetector(
                                        onTap: () => setState(
                                            () => isTapped = !isTapped),
                                        child: SvgPicture.asset(
                                          isTapped
                                              ? AppImage.openEye
                                              : AppImage.eye,
                                          color: AppColor.primary,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            paddedWing(
                                value: 28.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    homePageTransFlowWidget(
                                        image: AppImage.homeSwap,
                                        text: 'Convert',
                                        onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SwapScreen()),
                                            )),
                                    homePageTransFlowWidget(
                                        image: AppImage.addCard,
                                        text: 'Deposit',
                                        onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const DepositScreen()),
                                            )),
                                    homePageTransFlowWidget(
                                      image: AppImage.send,
                                      text: 'Send',
                                      onTap: () => navigate.navigateTo(
                                          Routes.sendMoneyScreen,
                                          arguments: SendMoneyScreenArguments(
                                              wallet: model.walletHome)),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 30.h,
                            ),
                            paddedWing(
                              value: 28.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'RECENT TRANSACTIONS',
                                    color: AppColor.black,
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  InkWell(
                                    onTap: () => navigate.navigateTo(
                                        Routes.dashboard,
                                        arguments:
                                            DashboardArguments(index: 3)),
                                    child: TextView(
                                      text: 'View all',
                                      color: AppColor.primary,
                                      fontSize: 16.0.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(height: 40.h),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () =>
                          model.modalBottomSheetMenuCreateWallet(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.w, horizontal: 14.w),
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextView(
                          text: 'Create Wallet',
                          color: AppColor.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: AppColor.primary.withOpacity(.4),
                    thickness: 0.6,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  paddedWing(
                    value: 10.w,
                    child: Align(
                      alignment: Alignment.center,
                      child: TextView(
                        text: 'EXCHANGE HISTORY',
                        fontSize: 17.20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  model.getStatsResponseModel == null
                      ? SpinKitPouringHourGlassRefined(
                          color: AppColor.primary,
                          size: 43.0.sp,
                        )
                      : model.getStatsResponseModel!.data!.swaps!.isEmpty
                          ? Center(
                              child: TextView(
                                text: 'No Transations',
                                fontSize: 22.sp,
                              ),
                            )
                          : Column(
                              children: [
                                ...model.getStatsResponseModel!.data!.swaps!
                                    .reversed
                                    .map((e) => recentSwapTransWidget(
                                          context: context,
                                          e: e,
                                        ))
                              ],
                            ),
                  SizedBox(height: 46.h),
                  paddedWing(
                    value: 10.w,
                    child: TextView(
                      text: 'RECENT TRANSACTION',
                      fontSize: 17.20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.grey,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  model.getStatsResponseModel == null
                      ? SpinKitPouringHourGlassRefined(
                          color: AppColor.primary,
                          size: 43.0.sp,
                        )
                      : model.getStatsResponseModel!.data!.transactions!.isEmpty
                          ? Center(
                              child: TextView(
                                text: 'No Transations',
                                fontSize: 20.sp,
                              ),
                            )
                          : Column(
                              children: [
                                ...model.getStatsResponseModel!.data!
                                    .transactions!.reversed
                                    .map((e) => recentTransWidget(
                                          context: context,
                                          e: e,
                                        ))
                              ],
                            )
                ]),
              ),
            );
          }),
    );
  }

  drawer() => Drawer(
        backgroundColor: AppColor.light.withOpacity(.9),
        width: 280,
        child: ViewModelBuilder<AuthViewModel>.reactive(
            viewModelBuilder: () => locator<AuthViewModel>(),
            onViewModelReady: (model) async {
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                await model.getUser(context);
              });
            },
            disposeViewModel: false,
            builder: (_, AuthViewModel model, __) {
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 60.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          model.userResponseModel != null
                              ? Column(
                                  children: [
                                    model.userResponseModel != null &&
                                            model.userResponseModel?.data
                                                    ?.photo !=
                                                null
                                        ? ClipOval(
                                            child: SizedBox.fromSize(
                                              size: const Size.fromRadius(26),
                                              child: Image.network(
                                                'https://res.cloudinary.com/walexbiz/image/upload/f_auto,q_auto/${model.userResponseModel?.data?.photo}',
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: AppColor.greyKind
                                                        .withOpacity(.3),
                                                  ),
                                                  child: Center(
                                                    child: TextView(
                                                      text: '',
                                                      fontSize: 13.2.sp,
                                                      color: AppColor.black,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : model.userResponseModel == null
                                            ? SizedBox.shrink()
                                            : Container(
                                                padding: EdgeInsets.all(12.2.w),
                                                decoration: BoxDecoration(
                                                  color: AppColor.black,
                                                  border: Border.all(
                                                      color: AppColor.white),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: TextView(
                                                  text: getInitials(
                                                          '${model.userResponseModel?.data?.firstName ?? ''} ${model.userResponseModel?.data?.lastName ?? ''}')
                                                      .toUpperCase(),
                                                  fontSize: 20.sp,
                                                  color: AppColor.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                  ],
                                )
                              : SizedBox.shrink(),
                          SizedBox(
                            width: 6.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 100.w,
                                child: TextView(
                                  text:
                                      '${model.userResponseModel?.data?.firstName ?? ""} ${getInitials(model.userResponseModel?.data?.lastName ?? '').toUpperCase()}',
                                  color: AppColor.white,
                                  fontSize: 16.2.sp,
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              SizedBox(
                                width: 160.w,
                                child: TextView(
                                  text: model.userResponseModel?.data?.email ??
                                      "",
                                  color: AppColor.white,
                                  maxLines: 2,
                                  fontSize: 13.2.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Send & Transfer',
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contxt) => SendMoneyScreen()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10.w, right: 14.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 8.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.white),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppImage.send,
                                      color: AppColor.black,
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    TextView(
                                      text: 'Send Money',
                                      fontSize: 16.0.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        TextView(
                          text: 'Wallet & Payment Methods',
                          fontSize: 17.2.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contxt) => DepositScreen()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10.w, right: 14.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 6.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.white),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppImage.addCard,
                                      color: AppColor.black,
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    TextView(
                                      text: 'Fund Wallet',
                                      fontSize: 16.0.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        TextView(
                          text: 'Exchange & Rates',
                          fontSize: 17.8.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contxt) => ExchangeRateScreen()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10.w, right: 14.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 8.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.white),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.currency_exchange,
                                      color: AppColor.black,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    TextView(
                                      text: 'View Rates',
                                      fontSize: 15.60.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contxt) => TransactionScreen()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10.w, right: 14.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 8.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.white),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.monitor_heart_outlined,
                                  color: AppColor.black,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                TextView(
                                  text: 'Transaction History',
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                  fontSize: 15.60.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        TextView(
                          text: 'Profile & Support',
                          fontSize: 17.8.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contxt) => ProfileScreen()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10.w, right: 14.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 8.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.white),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_3_outlined,
                                  color: AppColor.black,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                TextView(
                                  text: 'Profile',
                                  fontSize: 15.60.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contxt) => SupportScreen()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10.w, right: 14.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 8.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.white),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.support,
                                  color: AppColor.black,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                TextView(
                                  text: 'Support',
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                  fontSize: 15.80.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        SharedPreferencesService.instance.logOut();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextView(
                            text: 'Logout',
                            fontSize: 17.4.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.red,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Icon(
                            Icons.logout_outlined,
                            size: 22.2.sp,
                            color: AppColor.red,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              );
            }),
      );
}
