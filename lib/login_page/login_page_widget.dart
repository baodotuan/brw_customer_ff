import '../activation_page/activation_page_widget.dart';
import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController textController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: '+84');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 50,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.grey1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.phone_rounded,
                                color: FlutterFlowTheme.grey3,
                                size: 24,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: textController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Type phone number',
                                    hintStyle: FlutterFlowTheme.subtitle1,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                  ),
                                  style: FlutterFlowTheme.subtitle1,
                                  keyboardType: TextInputType.phone,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Field is required';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        if (!formKey.currentState.validate()) {
                          return;
                        }
                        if (textController.text.isEmpty ||
                            !textController.text.startsWith('+')) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Phone Number is required and has to start with +.'),
                            ),
                          );
                          return;
                        }
                        await beginPhoneAuth(
                          context: context,
                          phoneNumber: textController.text,
                          onCodeSent: () async {
                            await Navigator.pushAndRemoveUntil(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                                reverseDuration: Duration(milliseconds: 0),
                                child: ActivationPageWidget(),
                              ),
                              (r) => false,
                            );
                          },
                        );
                      },
                      text: 'Get OTP',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: FlutterFlowTheme.primaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
