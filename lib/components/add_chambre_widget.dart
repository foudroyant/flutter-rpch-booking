import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_chambre_model.dart';
export 'add_chambre_model.dart';

class AddChambreWidget extends StatefulWidget {
  const AddChambreWidget({
    super.key,
    required this.work,
    required this.hotel,
  });

  final String? work;
  final String? hotel;

  @override
  State<AddChambreWidget> createState() => _AddChambreWidgetState();
}

class _AddChambreWidgetState extends State<AddChambreWidget> {
  late AddChambreModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddChambreModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textController6 ??= TextEditingController();
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
            'Ajouter une chambre',
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
                  labelText: 'Chambre',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                  hintText: 'Ajouter une chambre',
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
                  labelText: 'Capacité',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                  hintText: 'Ajouter une capacité',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                keyboardType: TextInputType.number,
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
                  hintText: 'Ajouter un prix',
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
                    labelText: 'Type',
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintText: 'Type de chambre',
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  maxLines: 5,
                  minLines: 3,
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
              final selectedMedia = await selectMedia(
                imageQuality: 100,
                mediaSource: MediaSource.photoGallery,
                multiImage: true,
              );
              if (selectedMedia != null &&
                  selectedMedia.every(
                      (m) => validateFileFormat(m.storagePath, context))) {
                setState(() => _model.isDataUploading1 = true);
                var selectedUploadedFiles = <FFUploadedFile>[];

                try {
                  showUploadMessage(
                    context,
                    'Uploading file...',
                    showLoading: true,
                  );
                  selectedUploadedFiles = selectedMedia
                      .map((m) => FFUploadedFile(
                            name: m.storagePath.split('/').last,
                            bytes: m.bytes,
                            height: m.dimensions?.height,
                            width: m.dimensions?.width,
                            blurHash: m.blurHash,
                          ))
                      .toList();
                } finally {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  _model.isDataUploading1 = false;
                }
                if (selectedUploadedFiles.length == selectedMedia.length) {
                  setState(() {
                    _model.uploadedLocalFiles1 = selectedUploadedFiles;
                  });
                  showUploadMessage(context, 'Success!');
                } else {
                  setState(() {});
                  showUploadMessage(context, 'Failed to upload data');
                  return;
                }
              }
            },
            text: 'Selectionner des images',
            options: FFButtonOptions(
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
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
          FFButtonWidget(
            onPressed: () async {
              {
                setState(() => _model.isDataUploading2 = true);
                var selectedUploadedFiles = <FFUploadedFile>[];
                var selectedMedia = <SelectedFile>[];
                var downloadUrls = <String>[];
                try {
                  showUploadMessage(
                    context,
                    'Uploading file...',
                    showLoading: true,
                  );
                  selectedUploadedFiles = _model.uploadedLocalFiles1;
                  selectedMedia = selectedFilesFromUploadedFiles(
                    selectedUploadedFiles,
                    isMultiData: true,
                  );
                  downloadUrls = (await Future.wait(
                    selectedMedia.map(
                      (m) async => await uploadData(m.storagePath, m.bytes),
                    ),
                  ))
                      .where((u) => u != null)
                      .map((u) => u!)
                      .toList();
                } finally {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  _model.isDataUploading2 = false;
                }
                if (selectedUploadedFiles.length == selectedMedia.length &&
                    downloadUrls.length == selectedMedia.length) {
                  setState(() {
                    _model.uploadedLocalFiles2 = selectedUploadedFiles;
                    _model.uploadedFileUrls2 = downloadUrls;
                  });
                  showUploadMessage(context, 'Success!');
                } else {
                  setState(() {});
                  showUploadMessage(context, 'Failed to upload data');
                  return;
                }
              }

              await ChambresRecord.collection.doc().set({
                ...createChambresRecordData(
                  type: _model.textController4.text,
                  prix: double.tryParse(_model.textController3.text),
                  image: _model.uploadedFileUrls2.first,
                  capacite: int.tryParse(_model.textController2.text),
                  disponible: true,
                  hotel: widget.hotel,
                ),
                ...mapToFirestore(
                  {
                    'images': _model.uploadedFileUrls2,
                    'services':
                        functions.retourneTableau(_model.textController5.text),
                    'equipements':
                        functions.retourneTableau(_model.textController6.text),
                  },
                ),
              });
              Navigator.pop(context);
            },
            text: 'Ajouter la chambre',
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
