import 'package:azertexnolayn/core/enum/loading_enum.dart';
import 'package:azertexnolayn/screens/admin/pages/admin_page/companent/document_widget.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/new_discrepancy_controller.dart';
import 'package:azertexnolayn/screens/one_read_page/companent/empty_show.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProssesListPage extends GetView<NewDiscrepancyController> {
  const ProssesListPage( {Key? key})
      : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<NewDiscrepancyController>(
        builder: (controller) {
           if (controller.loadingProsses == Loading.LOADING) {
              return const Card(child: Center(child: CircularProgressIndicator()));
            } else if (controller.loadingProsses == Loading.DONE) {
              return GridView.builder(
                itemCount: controller.inconsistencyCreaterListProses.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: context.isPhone
                      ? 3
                      : context.isTablet
                          ? 4
                          : context.isLargeTablet
                              ? 5
                              : 6,
                ),
                itemBuilder: (context, index) {
                  return DocumentWidget(
                      controller.inconsistencyCreaterListProses[index]);
                },
              );
            } else {
              return const EmptyShow();
            }
        },
      ),
    );
  }}

/*
GridView.builder(
              itemCount: controller.inconsistencyCreaterListProses.length,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:context.isPhone ? 3:context.isTablet ?4:context.isLargeTablet?5:6,
              ),
              itemBuilder: (context, index) {
                return DocumentWidget(
                    controller.inconsistencyCreaterListProses[index]);
              },
            )


Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: controller.inconsistencyCreaterListProses
                  .map((e) => DocumentWidget(e))
                  .toList(),
            )
*/