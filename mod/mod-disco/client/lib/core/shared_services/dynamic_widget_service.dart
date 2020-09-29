import 'package:flutter/material.dart';

typedef void StandardCallbackInjection(String selected);
typedef void DropdownCallbackInjection(
    Map<String, String> data, String selected);

class DynamicWidgetService {
  Map<String, String> selectedDropdownOptions = {};
}

class DynamicDropdownButton extends StatelessWidget {
  final String _selected;
  final Map<String, String> _data;
  final DropdownCallbackInjection _callbackInjection;

  DynamicDropdownButton(
      {Map<String, String> data,
      String selectedOption,
      DropdownCallbackInjection callbackInjection})
      : this._data = data,
        this._selected = selectedOption,
        this._callbackInjection = callbackInjection;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> dropdownItems = _data.keys
        .map((question) =>
            DropdownMenuItem(child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(question),
            ), value: question))
        .toList();

    return Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 25, 0),
        child: DropdownButton(
          hint: Text('Please Select an option from the list'),
          items: dropdownItems,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 24,
          isExpanded: true,
          value: this._selected,
          onChanged: (String value) {
            if (this._callbackInjection != null) {
              this._callbackInjection(this._data, value);
            }
          },
        ));
  }
}

class DynamicMultilineTextFormField extends StatelessWidget {
  final StandardCallbackInjection _callbackInjection;
  final String _question;

  DynamicMultilineTextFormField(
      {String question, StandardCallbackInjection callbackInjection})
      : this._question = question,
        this._callbackInjection = callbackInjection;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this._question,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          TextFormField(
            initialValue: '',
            maxLines: 5,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              hintText: 'Type your answer here',
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              /*border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: const BorderSide(),
              ),*/
            ),
            onChanged: (String value) {
              if (this._callbackInjection != null) {
                this._callbackInjection(value);
              }
            },
            onSaved: (String value) {
              if (this._callbackInjection != null) {
                this._callbackInjection(value);
              }
            },
            keyboardType: TextInputType.multiline,
            style: const TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}

class DynamicSlider extends StatelessWidget {
  final StandardCallbackInjection _callbackInjection;
  final String _title, _question;
  final double _min, _max, _current;

  DynamicSlider(
      {String title,
      String question,
      double current,
      double min,
      double max,
      StandardCallbackInjection callbackInjection})
      : this._question = question,
        this._title = title,
        this._current = current,
        this._min = min,
        this._max = max,
        this._callbackInjection = callbackInjection;

  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               ListTile(
                title: Text(
                  this._title,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              ListTile(
                title: Text(
                  this._question,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              const SizedBox(height: 8.0),
              ListTile(
                title: Text(
                  'Minimum hours you can dedicate  : ',
                  style: Theme.of(context).textTheme.subtitle,
                ),
                trailing: Text(
                  '${this._current} hr',
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Slider(
                    label: this._current.toString(),
                    divisions: this._max.toInt(),
                    min: this._min,
                    max: this._max,
                    value: this._current,
                    onChanged: (double value) {
                      this._callbackInjection(value.toString());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
