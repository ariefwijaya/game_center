import 'dart:convert';

import 'package:game_center/main.import.dart';
import 'package:game_center/main.library.dart';

import '../models/errlytics_log_model.dart';

class ErrlyticsScreen extends StatelessWidget {
  const ErrlyticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: AutoLeadingButton(
              color: Theme.of(context).scaffoldBackgroundColor),
          backgroundColor: Theme.of(context).primaryColorLight,
          title: Text(
            LocaleKeys.errlytics_title.tr(),
            style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
          ),
          actions: [
            IconButton(
                color: Theme.of(context).error,
                onPressed: () {
                  context.read<ErrlyticsBloc>().add(ErrlyticsClearAll());
                },
                icon: const Icon(
                  Icons.delete_forever,
                ))
          ],
        ),
        body: BlocBuilder<ErrlyticsBloc, ErrlyticsState>(
          buildWhen: (previous, current) =>
              current is ErrlyticsLoading || current is ErrlyticsLogList,
          builder: (context, state) {
            if (state is ErrlyticsLogList) {
              return RefreshIndicator(
                onRefresh: () => Future.sync(() {
                  context.read<ErrlyticsBloc>().add(ErrlyticsGetList());
                }),
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => Divider(
                      thickness: 2,
                      color: Theme.of(context).shadowColor.withOpacity(0.1)),
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    final data = state.list[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return _buildDetail(context, data);
                          },
                        ));
                      },
                      child: ListTile(
                        title: Text(data.error.toString(),
                            maxLines: 3, overflow: TextOverflow.ellipsis),
                        subtitle: Text(DateFormat().format(data.dateTime),
                            textAlign: TextAlign.right),
                      ),
                    );
                  },
                ),
              );
            }

            if (state is ErrlyticsErrorException) {
              return _buildError(context);
            }

            return const Center(child: CircularProgressIndicator());
          },
        ));
  }

  Widget _buildDetail(BuildContext context, ErrylticsLogModel report) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text(
          report.error.toString(),
          style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            _buildTileDetail(name: "Time :", value: report.dateTime.toString()),
            _buildTileDetail(name: "Error :", value: report.error.toString()),
            _buildTileDetail(
                name: "Trace :", value: report.stackTrace.toString()),
            _buildTileDetail(
                name: "Platform :", value: report.platformType.toString()),
            _buildTileDetail(
                name: "App :",
                value: const JsonEncoder.withIndent('  ')
                    .convert(report.applicationParameters)),
            _buildTileDetail(
                name: "Device :",
                value: const JsonEncoder.withIndent('  ')
                    .convert(report.deviceParameters)),
            _buildTileDetail(
                name: "Custom :", value: report.customParameters.toString())
          ],
        ),
      ),
    );
  }

  Widget _buildTileDetail({required String name, String? value}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,
              style:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
          const SizedBox(width: 8),
          Flexible(child: Text(value.toString()))
        ],
      ),
    );
  }

  Widget _buildError(BuildContext context) {
    return Center(
        child: SectionPlaceholder.medium(
      title: LocaleKeys.errlytics_failed_title.tr(),
      description: LocaleKeys.errlytics_failed_subtitle.tr(),
      primaryButtonText: LocaleKeys.errlytics_failed_retry.tr(),
      onPrimaryButtonTapped: () {
        context.read<ErrlyticsBloc>().add(ErrlyticsGetList());
      },
    ));
  }
}
