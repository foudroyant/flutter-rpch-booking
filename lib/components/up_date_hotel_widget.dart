import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'up_date_hotel_model.dart';
export 'up_date_hotel_model.dart';

class UpDateHotelWidget extends StatefulWidget {
  const UpDateHotelWidget({
    super.key,
    required this.hotel,
  });

  final HotelsRecord? hotel;

  @override
  State<UpDateHotelWidget> createState() => _UpDateHotelWidgetState();
}

class _UpDateHotelWidgetState extends State<UpDateHotelWidget> {
  late UpDateHotelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpDateHotelModel());

    _model.textController1 ??= TextEditingController(text: widget.hotel?.nom);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.hotel?.localisation);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??=
        TextEditingController(text: widget.hotel?.prixMoyen.toString());
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??=
        TextEditingController(text: widget.hotel?.description);
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController(
        text: functions.retourneChaine(widget.hotel?.services.toList()));
    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textController6 ??= TextEditingController(
        text: functions.retourneChaine(widget.hotel?.equipements.toList()));
    _model.textFieldFocusNode6 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        children: [
          Text(
            'Mise à jour de l\'hotel',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).titleLarge,
          ),
          Container(
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: TextFormField(
                controller: _model.textController1,
                focusNode: _model.textFieldFocusNode1,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Hotel',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                  hintText: 'Mise à jour de l\'hotel',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                validator: _model.textController1Validator.asValidator(context),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: TextFormField(
                controller: _model.textController2,
                focusNode: _model.textFieldFocusNode2,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Localisation',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                  hintText: 'Localisation',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                validator: _model.textController2Validator.asValidator(context),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: TextFormField(
                controller: _model.textController3,
                focusNode: _model.textFieldFocusNode3,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Prix',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                  hintText: 'Prix',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                keyboardType: TextInputType.number,
                validator: _model.textController3Validator.asValidator(context),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.textController4,
                  focusNode: _model.textFieldFocusNode4,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintText: 'Description',
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  maxLines: 5,
                  minLines: 3,
                  keyboardType: TextInputType.multiline,
                  validator:
                      _model.textController4Validator.asValidator(context),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.textController5,
                  focusNode: _model.textFieldFocusNode5,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Services',
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintText: 'Ajouter des services séparés par des ;',
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  maxLines: 5,
                  minLines: 3,
                  keyboardType: TextInputType.multiline,
                  validator:
                      _model.textController5Validator.asValidator(context),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.textController6,
                  focusNode: _model.textFieldFocusNode6,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Equipements',
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintText: 'Ajouter des équipements séparés par des ;',
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  maxLines: 5,
                  minLines: 3,
                  keyboardType: TextInputType.multiline,
                  validator:
                      _model.textController6Validator.asValidator(context),
                ),
              ),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              await widget.hotel!.reference.update({
                ...createHotelsRecordData(
                  nom: _model.textController1.text,
                  localisation: _model.textController2.text,
                  description: _model.textController4.text,
                  prixMoyen: double.tryParse(_model.textController3.text),
                ),
                ...mapToFirestore(
                  {
                    'services':
                        functions.retourneTableau(_model.textController5.text),
                    'equipements':
                        functions.retourneTableau(_model.textController6.text),
                  },
                ),
              });
              Navigator.pop(context);
            },
            text: 'Mettre à jour',
            options: FFButtonOptions(
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).secondary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                  ),
              elevation: 3.0,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ].divide(const SizedBox(height: 10.0)),
      ),
    );
  }
}
