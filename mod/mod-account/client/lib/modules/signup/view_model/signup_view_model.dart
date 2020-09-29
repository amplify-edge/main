

import 'package:mod_account/core/core.dart';

class SignUpViewModel extends BaseModel{
   bool _emailEnabled = false;
   bool _messagesEnabled = false;
   bool _meetOthers = false;
   bool _haveTraining = false;

   bool get emailEnabled => _emailEnabled;
   bool get messagesEnabled => _messagesEnabled;
   bool get meetOthers => _meetOthers;
   bool get haveTraining => _haveTraining;

   void enableEmail(value){
     _emailEnabled = value;
     notifyListeners();
   }

   void enableMessages(value){
     _messagesEnabled = value;
     notifyListeners();
   }

   void selectMeetOthers(value){
     _meetOthers = value;
     notifyListeners();
   }

   void selectTraining(value){
     _haveTraining = value;
     notifyListeners();
   }


}