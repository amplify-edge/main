import 'package:data_tables/data_tables.dart';
import 'package:flutter/material.dart';
import 'package:mod_main/modules/org_manager/orgs/view_model/orgs_detail_page_view_model.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DataPane extends StatelessWidget {
  final OrgsViewModel model;
  final SizingInformation sizingInfo;

  const DataPane({Key key, this.model, this.sizingInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // (widget.model.buzy)
        //     ? Center(child: CircularProgressIndicator()):
        NativeDataTable.builder(
      rowsPerPage: model.rowsPerPage,
      firstRowIndex: model.firstRowIndex,
      itemCount: model.orgs.length ?? 0,
      header: Text("Organization Details"),
      handleNext: () {
        model.handleNextPage();
      },
      handlePrevious: () {
        model.handlePrevPage();
      },
      sortColumnIndex: model.sortColumnIndex,
      sortAscending: model.sortAscending,
      onRefresh: () async {
        await new Future.delayed(new Duration(seconds: 3));

        return null;
      },
      onRowsPerPageChanged: (int value) {
        model.setRowsPerPage(value);
      },
      noItems: Text("No Orgs"),
      // mobileItemBuilder: (BuildContext context, int index) {
      //   final org = model.orgs[index];
      //   return Text("${index} - ${org.organization}");

      // },
      onSelectAll: (bool value) {
        model.onSelectAll(value);
      },
      rowCountApproximate: true,
      actions: <Widget>[
        // IconButton(
        //   icon: Icon(Icons.info_outline),
        //   onPressed: () {},
        // ),
      ],
      selectedActions: <Widget>[
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {},
        ),
      ],

      itemBuilder: (int index) {
        final org = model.orgs[index];
        return DataRow.byIndex(
          index: index,
          onSelectChanged: (value) {
            model.changeSelection(value, index);
          },
          selected: model.selected[index],
          cells: [
            DataCell(Text(org.organization)),
            DataCell(Text(org.campaignName)),
            DataCell(Text(org.category)),
            DataCell(Text(org.actionType)),
            DataCell(Text(org.actionLocation)),
            DataCell(Text(org.actionLength)),
            DataCell(Text(org.actionTime.toString())),
            DataCell(Text(org.histPrecedents)),
            DataCell(Text(org.strategy)),
            DataCell(Text(org.goal)),
          ],
        );
      },
      columns: [
        DataColumn(
            label: Text("Organization"),
            onSort: (int columnIndex, bool ascending) =>
                model.sort((org) => org.organization, columnIndex, ascending)),
        DataColumn(
            label: Text("Campaign"),
            onSort: (int columnIndex, bool ascending) {
              model.sort((org) => org.campaignName, columnIndex, ascending);
            }),
        DataColumn(label: Text("Category")),
        DataColumn(label: Text("Action Type")),
        DataColumn(label: Text("Action Location")),
        DataColumn(label: Text("Action Length")),
        DataColumn(label: Text("Action Time")),
        DataColumn(label: Text("Historical Precedents")),
        DataColumn(label: Text("Strategy")),
        DataColumn(label: Text("Goal")),
      ],
    );
  }
}
