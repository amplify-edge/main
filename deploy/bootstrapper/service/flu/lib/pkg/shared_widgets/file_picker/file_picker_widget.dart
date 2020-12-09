import 'package:bootstrapper/pkg/shared_widgets/file_picker/file_picker_view_model.dart';
import 'package:bootstrapper/pkg/shared_widgets/rounded_card/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class FilePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModelBuilder: () => FilePickerViewModel(['jpg', 'png']),
      onModelReady: (FilePickerViewModel model) async {},
      builder: (context, FilePickerViewModel model, child) => Column(
        children: [
          RoundedCard(
            onTap: model.pickFile,
            height: 200,
            width: 200,
            cardColor: Theme.of(context).copyWith().dialogBackgroundColor,
            circularRadius: 10000,
            content: model.fileBytes != null
                ? CircleAvatar(
                    backgroundColor: Theme.of(context)
                        .copyWith()
                        .scaffoldBackgroundColor
                        .withOpacity(0.2),
                    radius: 100,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 100,
                          backgroundImage: MemoryImage(model.fileBytes),
                        ),
                        Positioned(
                          bottom: 4,
                          right: 8,
                          child: IconButton(
                            icon: Icon(Icons.copy),
                            onPressed: model.copyFileBytes(context),
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Icon(
                    Icons.camera_alt_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 50,
                  )),
          ),
        ],
      ),
    );
  }
}
