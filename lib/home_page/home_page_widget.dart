import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../cart_page/cart_page_widget.dart';
import '../complete_customer_detail_page/complete_customer_detail_page_widget.dart';
import '../congrat_page/congrat_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../history_page/history_page_widget.dart';
import '../main.dart';
import '../processing_order_page/processing_order_page_widget.dart';
import '../setting_page/setting_page_widget.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
              reverseDuration: Duration(milliseconds: 0),
              child: CartPageWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        label: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0x00EEEEEE),
                shape: BoxShape.circle,
              ),
              alignment: AlignmentDirectional(0, 0),
              child: Icon(
                Icons.shopping_cart,
                color: FlutterFlowTheme.tertiaryColor,
                size: 25,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Welcome Back!',
                    style: FlutterFlowTheme.title1,
                  ),
                  custom_widgets.Fcm(
                    width: 10,
                    height: 10,
                    uid: currentUserUid,
                  ),
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                          reverseDuration: Duration(milliseconds: 0),
                          child: SettingPageWidget(),
                        ),
                      );
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0x00F6C149),
                        shape: BoxShape.circle,
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Icon(
                        Icons.account_circle,
                        color: FlutterFlowTheme.primaryColor,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<UsersRecord>(
                stream: UsersRecord.getDocument(currentUserReference),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: SpinKitRotatingPlain(
                          color: FlutterFlowTheme.primaryColor,
                          size: 20,
                        ),
                      ),
                    );
                  }
                  final fuctionListViewUsersRecord = snapshot.data;
                  return ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      if (functions.missingData(
                              fuctionListViewUsersRecord.firstName,
                              fuctionListViewUsersRecord.lastName) ??
                          true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 10, 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.grey1,
                                        borderRadius: BorderRadius.circular(10),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Complete your profile to start!',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.title3,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await Navigator
                                                      .pushAndRemoveUntil(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                      reverseDuration: Duration(
                                                          milliseconds: 0),
                                                      child:
                                                          CompleteCustomerDetailPageWidget(
                                                        newUser: true,
                                                      ),
                                                    ),
                                                    (r) => false,
                                                  );
                                                },
                                                text: 'Complete Now ',
                                                options: FFButtonOptions(
                                                  width: 150,
                                                  height: 40,
                                                  color: FlutterFlowTheme
                                                      .primaryColor,
                                                  textStyle: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Roboto',
                                                    color: Colors.white,
                                                  ),
                                                  elevation: 3,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 40,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (!(functions.missingData(
                              fuctionListViewUsersRecord.firstName,
                              fuctionListViewUsersRecord.lastName)) ??
                          true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 250,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 10),
                                          child: PageView(
                                            controller: pageViewController ??=
                                                PageController(initialPage: 0),
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 10, 10, 10),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 4,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                          .creditCardColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child: Image.asset(
                                                              'assets/images/creditcard.png',
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        10,
                                                                        10,
                                                                        10),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'full name',
                                                                      style: FlutterFlowTheme
                                                                          .bodyText2
                                                                          .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        color: FlutterFlowTheme
                                                                            .grey2,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    AuthUserStreamWidget(
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          currentUserDocument
                                                                              ?.lastName,
                                                                          'loading',
                                                                        ),
                                                                        style: FlutterFlowTheme
                                                                            .subtitle2,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          AuthUserStreamWidget(
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            currentUserDocument?.firstName,
                                                                            'loading',
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.subtitle2,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'phone number',
                                                                        style: FlutterFlowTheme
                                                                            .bodyText2
                                                                            .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          color:
                                                                              FlutterFlowTheme.grey2,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    AuthUserStreamWidget(
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          currentPhoneNumber,
                                                                          'loading',
                                                                        ),
                                                                        style: FlutterFlowTheme
                                                                            .subtitle2,
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        AuthUserStreamWidget(
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              formatNumber(
                                                                                currentUserDocument?.point,
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.commaDecimal,
                                                                              ),
                                                                              '0000',
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.subtitle1,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.stop_circle_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.primaryColor,
                                                                            size:
                                                                                24,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 10, 10, 10),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 4,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .creditCardColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          20,
                                                                          15,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0.7),
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          'assets/images/icon_dia.png',
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              30,
                                                                          fit: BoxFit
                                                                              .fitWidth,
                                                                        ),
                                                                        if ((currentUserDocument?.loyaltyCardPoint) >
                                                                            0)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.7, 0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              child: Image.asset(
                                                                                'assets/images/icon_coc.png',
                                                                                width: 40,
                                                                                height: 30,
                                                                                fit: BoxFit.fitWidth,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0.7),
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          'assets/images/icon_dia.png',
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              30,
                                                                          fit: BoxFit
                                                                              .fitWidth,
                                                                        ),
                                                                        if ((currentUserDocument?.loyaltyCardPoint) >
                                                                            1)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.7, 0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              child: Image.asset(
                                                                                'assets/images/icon_coc.png',
                                                                                width: 40,
                                                                                height: 30,
                                                                                fit: BoxFit.fitWidth,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0.7),
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          'assets/images/icon_dia.png',
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              30,
                                                                          fit: BoxFit
                                                                              .fitWidth,
                                                                        ),
                                                                        if ((currentUserDocument?.loyaltyCardPoint) >
                                                                            2)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.7, 0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              child: Image.asset(
                                                                                'assets/images/icon_coc.png',
                                                                                width: 40,
                                                                                height: 30,
                                                                                fit: BoxFit.fitWidth,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0.7),
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          'assets/images/icon_dia.png',
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              30,
                                                                          fit: BoxFit
                                                                              .fitWidth,
                                                                        ),
                                                                        if ((currentUserDocument?.loyaltyCardPoint) >
                                                                            3)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.7, 0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              child: Image.asset(
                                                                                'assets/images/icon_coc.png',
                                                                                width: 40,
                                                                                height: 30,
                                                                                fit: BoxFit.fitWidth,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0.7),
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          'assets/images/icon_dia.png',
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              30,
                                                                          fit: BoxFit
                                                                              .fitWidth,
                                                                        ),
                                                                        if ((currentUserDocument?.loyaltyCardPoint) >
                                                                            4)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.7, 0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              child: Image.asset(
                                                                                'assets/images/icon_coc.png',
                                                                                width: 40,
                                                                                height: 30,
                                                                                fit: BoxFit.fitWidth,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          0,
                                                                          15,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0.7),
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          'assets/images/icon_dia.png',
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              30,
                                                                          fit: BoxFit
                                                                              .fitWidth,
                                                                        ),
                                                                        if ((currentUserDocument?.loyaltyCardPoint) >
                                                                            5)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.7, 0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              child: Image.asset(
                                                                                'assets/images/icon_coc.png',
                                                                                width: 40,
                                                                                height: 30,
                                                                                fit: BoxFit.fitWidth,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0.7),
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          'assets/images/icon_dia.png',
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              30,
                                                                          fit: BoxFit
                                                                              .fitWidth,
                                                                        ),
                                                                        if ((currentUserDocument?.loyaltyCardPoint) >
                                                                            6)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.7, 0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              child: Image.asset(
                                                                                'assets/images/icon_coc.png',
                                                                                width: 40,
                                                                                height: 30,
                                                                                fit: BoxFit.fitWidth,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0.7),
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          'assets/images/icon_dia.png',
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              30,
                                                                          fit: BoxFit
                                                                              .fitWidth,
                                                                        ),
                                                                        if ((currentUserDocument?.loyaltyCardPoint) >
                                                                            7)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.7, 0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              child: Image.asset(
                                                                                'assets/images/icon_coc.png',
                                                                                width: 40,
                                                                                height: 30,
                                                                                fit: BoxFit.fitWidth,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0.7),
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          'assets/images/icon_dia.png',
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              30,
                                                                          fit: BoxFit
                                                                              .fitWidth,
                                                                        ),
                                                                        if ((currentUserDocument?.loyaltyCardPoint) >
                                                                            8)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.7, 0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              child: Image.asset(
                                                                                'assets/images/icon_coc.png',
                                                                                width: 40,
                                                                                height: 30,
                                                                                fit: BoxFit.fitWidth,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0.7),
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          'assets/images/icon_dia.png',
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              30,
                                                                          fit: BoxFit
                                                                              .fitWidth,
                                                                        ),
                                                                        if ((currentUserDocument?.loyaltyCardPoint) >
                                                                            9)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.7, 0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              child: Image.asset(
                                                                                'assets/images/icon_coc.png',
                                                                                width: 40,
                                                                                height: 30,
                                                                                fit: BoxFit.fitWidth,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if ((currentUserDocument
                                                                        ?.loyaltyCardPoint) >
                                                                    9)
                                                                  AuthUserStreamWidget(
                                                                    child:
                                                                        Container(
                                                                      width: 40,
                                                                      height:
                                                                          40,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme
                                                                            .creditCardColor,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              10,
                                                                              10),
                                                                      child:
                                                                          Text(
                                                                        'Keep',
                                                                        style: FlutterFlowTheme
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily:
                                                                              'Roboto Mono',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          Stack(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0.7),
                                                                        children: [
                                                                          Image
                                                                              .asset(
                                                                            'assets/images/icon_dia_cam.png',
                                                                            width:
                                                                                50,
                                                                            height:
                                                                                30,
                                                                            fit:
                                                                                BoxFit.fitWidth,
                                                                          ),
                                                                          if ((currentUserDocument?.loyaltyCardPoint) >
                                                                              9)
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.7, 0),
                                                                              child: AuthUserStreamWidget(
                                                                                child: Image.asset(
                                                                                  'assets/images/icon_coc_do.png',
                                                                                  width: 40,
                                                                                  height: 30,
                                                                                  fit: BoxFit.fitWidth,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              10),
                                                                      child:
                                                                          Text(
                                                                        'ing!',
                                                                        style: FlutterFlowTheme
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily:
                                                                              'Roboto Mono',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                if ((currentUserDocument
                                                                        ?.loyaltyCardPoint) >
                                                                    9)
                                                                  AuthUserStreamWidget(
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          PageTransition(
                                                                            type:
                                                                                PageTransitionType.fade,
                                                                            duration:
                                                                                Duration(milliseconds: 0),
                                                                            reverseDuration:
                                                                                Duration(milliseconds: 0),
                                                                            child:
                                                                                CongratPageWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            2,
                                                                        shape:
                                                                            const CircleBorder(),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              40,
                                                                          height:
                                                                              40,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.primaryColor,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.arrow_forward_ios,
                                                                            color:
                                                                                FlutterFlowTheme.creditCardColor,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 10, 10, 10),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 4,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .creditCardColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20,
                                                                    20, 20, 20),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text(
                                                              'Scan at the counter!',
                                                              style:
                                                                  FlutterFlowTheme
                                                                      .subtitle1,
                                                            ),
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    'https://api.qrserver.com/v1/create-qr-code/?size=180x180&data=${currentUserUid}',
                                                                width: 120,
                                                                height: 120,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(0, 1),
                                          child: SmoothPageIndicator(
                                            controller: pageViewController ??=
                                                PageController(initialPage: 0),
                                            count: 3,
                                            axisDirection: Axis.horizontal,
                                            onDotClicked: (i) {
                                              pageViewController.animateToPage(
                                                i,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                            },
                                            effect: ExpandingDotsEffect(
                                              expansionFactor: 2,
                                              spacing: 5,
                                              radius: 10,
                                              dotWidth: 10,
                                              dotHeight: 10,
                                              dotColor: FlutterFlowTheme.grey2,
                                              activeDotColor:
                                                  FlutterFlowTheme.primaryColor,
                                              paintStyle: PaintingStyle.fill,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (!(functions.missingData(
                              fuctionListViewUsersRecord.firstName,
                              fuctionListViewUsersRecord.lastName)) ??
                          true)
                        Align(
                          alignment: AlignmentDirectional(0, -13.15),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 5, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                  reverseDuration:
                                                      Duration(milliseconds: 0),
                                                  child: HistoryPageWidget(),
                                                ),
                                              );
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 4,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 120,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme
                                                      .primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 10, 10, 10),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .history_sharp,
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                              size: 30,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'TRANSACTION',
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'HISTORY',
                                                            style:
                                                                FlutterFlowTheme
                                                                    .title1
                                                                    .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            color: Color(
                                                                0x80FFFFFF),
                                                            size: 24,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                  reverseDuration:
                                                      Duration(milliseconds: 0),
                                                  child:
                                                      ProcessingOrderPageWidget(),
                                                ),
                                              );
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 4,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 120,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme
                                                      .secondaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 10, 10, 10),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons.layers,
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                              size: 30,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'PROCESSING',
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'ORDERS',
                                                            style:
                                                                FlutterFlowTheme
                                                                    .title1
                                                                    .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            color: Color(
                                                                0x80FFFFFF),
                                                            size: 24,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                                reverseDuration:
                                                    Duration(milliseconds: 0),
                                                child: NavBarPage(
                                                    initialPage: 'OrderPage'),
                                              ),
                                            );
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 4,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFE4A312),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 10, 10, 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 5),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.menu_book,
                                                            color: FlutterFlowTheme
                                                                .tertiaryColor,
                                                            size: 30,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'SEE OUR',
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: FlutterFlowTheme
                                                                .tertiaryColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'MENU',
                                                          style:
                                                              FlutterFlowTheme
                                                                  .title1
                                                                  .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: FlutterFlowTheme
                                                                .tertiaryColor,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color:
                                                              Color(0x80FFFFFF),
                                                          size: 24,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
