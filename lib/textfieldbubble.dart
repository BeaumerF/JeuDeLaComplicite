import 'package:flutter/material.dart';

///[TagsStyler] allows you to design the exact style you want for your tag by using its properties. It must not be [null]

class TagsStyler {
  ///[tagPadding] allows you to apply padding inside tag
  final EdgeInsets tagPadding;

  ///[tagMargin] allows you to apply padding inside tag
  final EdgeInsets tagMargin;

  ///[tagMargin] apply decoration to the container containing the tag. Should specify the color to set tag color, otherwise its white by default
  final BoxDecoration tagDecoration;

  ///[tagTextStyle] style the text inside tag
  final TextStyle tagTextStyle;

  /// Styles the padding of the tag text
  final EdgeInsets tagTextPadding;

  /// Styles the padding of the tag cancel icon
  final EdgeInsets tagCancelIconPadding;

  ///[tagCancelIcon] apply your own icon, if you want, to delete the icon
  final Widget tagCancelIcon;

  ///Enable or disable the # prefix icon
  final bool showHashtag;

  TagsStyler({
    this.tagTextPadding = const EdgeInsets.all(0.0),
    this.tagCancelIconPadding = const EdgeInsets.only(left: 1.0),
    this.tagPadding = const EdgeInsets.all(4.0),
    this.tagMargin =
        const EdgeInsets.only(left: 4, right: 4, top: 15, bottom: 15),
    this.tagDecoration =
        const BoxDecoration(color: Color.fromARGB(255, 74, 137, 92)),
    this.tagTextStyle,
    this.showHashtag = false,
    this.tagCancelIcon = const Icon(
      Icons.cancel,
      size: 18.0,
      color: Colors.green,
    ),
  });
}

///[TextFieldStyler] allows you to design the exact style you want for your textfield by using its properties. It must not be [null]
class TextFieldStyler {
  final String label;

  final TextStyle labelStyle;

  /// The color of the decoration inside the textfield
  final Color textFieldFilledColor;

  ///[textFieldFilled] If true the decoration's container is filled with [textFieldFilledColor].
  final bool textFieldFilled;

  ///The padding for the input decoration's container. Adjust this to using EdgeInsets if you make textFieldBorder [null] or borderless to have the right customized style
  final EdgeInsets contentPadding;

  /// The text style of the text input
  final TextStyle textStyle;

  ///The color of the cursor blinking
  final Color cursorColor;

  ///Whether the input [child] is part of a dense form (i.e., uses less vertical space).
  final bool isDense;

  ///Text that provides context about the input [child]'s value, such as how the value will be used.
  final String helperText;

  ///Style helperText
  final TextStyle helperStyle;

  ///Text that suggests what sort of input the field accepts.
  final String hintText;

  ///Styles hint text
  final TextStyle hintStyle;

  ///Enable or disable the textfield
  final bool textFieldEnabled;

  final InputBorder textFieldBorder;
  final InputBorder textFieldFocusedBorder;
  final InputBorder textFieldDisabledBorder;
  final InputBorder textFieldEnabledBorder;

  TextFieldStyler({
    this.label,
    this.labelStyle,
    this.textFieldFilled = false,
    this.helperText = 'Enter tags',
    this.helperStyle,
    this.textStyle,
    this.cursorColor,
    this.hintText = 'Got tags?',
    this.hintStyle,
    this.contentPadding,
    this.textFieldFilledColor,
    this.isDense = true,
    this.textFieldEnabled = true,
    this.textFieldBorder = const OutlineInputBorder(),
    this.textFieldFocusedBorder,
    this.textFieldDisabledBorder,
    this.textFieldEnabledBorder,
  });
}

class Textfieldbubble extends StatefulWidget {
  ///[tagsStyler] must not be [null]
  final TagsStyler tagsStyler;

  ///[textFieldStyler] must not be [null]
  final TextFieldStyler textFieldStyler;

  ///[onTag] must not be [null] and should be implemented
  final void Function(String tag) onTag;

  ///[onDelete] must not be [null]
  final void Function(String tag) onDelete;

  ///[initialTags] are optional initial tags you can enter
  final List<String> initialTags;

  const Textfieldbubble({
    Key key,
    @required this.tagsStyler,
    @required this.textFieldStyler,
    @required this.onTag,
    @required this.onDelete,
    this.initialTags,
  })  : assert(tagsStyler != null && textFieldStyler != null,
            'tagsStyler and textFieldStyler should not be null'),
        assert(onDelete != null && onTag != null,
            'onDelete and onTag should not be null'),
        super(key: key);
  @override
  _TextFieldTagsState createState() => _TextFieldTagsState();
}

class _TextFieldTagsState extends State<Textfieldbubble> {
  List<String> _tagsStringContent = [];
  TextEditingController _textEditingController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  bool _showPrefixIcon = false;
  double _deviceWidth;
  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
    if (widget.initialTags != null && widget.initialTags.isNotEmpty) {
      _showPrefixIcon = true;
      _tagsStringContent = widget.initialTags;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _deviceWidth = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _scrollController.dispose();
  }

  List<Widget> get _getTags {
    List<Widget> _tags = [];
    for (var i = 0; i < _tagsStringContent.length; i++) {
      String tagText = widget.tagsStyler.showHashtag
          ? "#${_tagsStringContent[i]}"
          : _tagsStringContent[i];
      var tag = GestureDetector(
          onTap: () {
            if (widget.onDelete != null) widget.onDelete(_tagsStringContent[i]);

            if (_tagsStringContent.length == 1 && _showPrefixIcon) {
              setState(() {
                _tagsStringContent.remove(_tagsStringContent[i]);
                _showPrefixIcon = false;
              });
            } else {
              setState(() {
                _tagsStringContent.remove(_tagsStringContent[i]);
              });
            }
          },
          child: Container(
            padding: widget.tagsStyler.tagPadding,
            decoration: widget.tagsStyler.tagDecoration,
            margin: widget.tagsStyler.tagMargin,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: widget.tagsStyler.tagTextPadding,
                  child: Text(
                    tagText,
                    style: widget.tagsStyler.tagTextStyle,
                  ),
                ),
                Padding(
                  padding: widget.tagsStyler.tagCancelIconPadding,
                  child: widget.tagsStyler.tagCancelIcon,
                ),
              ],
            ),
          ));
      _tags.add(tag);
    }
    return _tags;
  }

  void _animateTransition() {
    var _pw = _deviceWidth;
    _scrollController.animateTo(
      _pw + _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 3),
      curve: Curves.easeOut,
    );
  }

  FocusNode myFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 25,
      controller: _textEditingController,
      autocorrect: false,
      cursorColor: widget.textFieldStyler.cursorColor,
      style: widget.textFieldStyler.textStyle,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counterText: "",
        labelText: widget.textFieldStyler.label,
        labelStyle: widget.textFieldStyler.labelStyle,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: widget.textFieldStyler.contentPadding,
        isDense: widget.textFieldStyler.isDense,
        helperText: widget.textFieldStyler.helperText,
        helperStyle: widget.textFieldStyler.helperStyle,
        hintText: !_showPrefixIcon ? widget.textFieldStyler.hintText : null,
        hintStyle: !_showPrefixIcon ? widget.textFieldStyler.hintStyle : null,
        filled: widget.textFieldStyler.textFieldFilled,
        fillColor: widget.textFieldStyler.textFieldFilledColor,
        enabled: widget.textFieldStyler.textFieldEnabled,
        border: widget.textFieldStyler.textFieldBorder,
        focusedBorder: widget.textFieldStyler.textFieldFocusedBorder,
        disabledBorder: widget.textFieldStyler.textFieldDisabledBorder,
        enabledBorder: widget.textFieldStyler.textFieldEnabledBorder,
        suffixIcon: IconButton(
            onPressed: () {
              var val = _textEditingController.text.trim(); //.toLowerCase();
              if (val.length > 0) {
                _textEditingController.clear();
                if (!_tagsStringContent.contains(val)) {
                  widget.onTag(val);
                  if (!_showPrefixIcon) {
                    setState(() {
                      _tagsStringContent.add(val);
                      _showPrefixIcon = true;
                    });
                  } else {
                    setState(() {
                      _tagsStringContent.add(val);
                    });
                  }

                  myFocusNode.requestFocus();
                  this._animateTransition();
                }
              }
            },
            icon: Icon(
              Icons.add_circle,
              color: Colors.white,
            )),
        prefixIcon: _showPrefixIcon
            ? ConstrainedBox(
                constraints: BoxConstraints(maxWidth: _deviceWidth * 0.5),
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 4),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _getTags,
                    ),
                  ),
                ),
              )
            : null,
      ),
      focusNode: myFocusNode,
      onSubmitted: (value) {
        var val = value.trim(); //.toLowerCase();
        if (value.length > 0) {
          _textEditingController.clear();
          if (!_tagsStringContent.contains(val)) {
            widget.onTag(val);
            if (!_showPrefixIcon) {
              setState(() {
                _tagsStringContent.add(val);
                _showPrefixIcon = true;
              });
            } else {
              setState(() {
                _tagsStringContent.add(val);
              });
            }

            myFocusNode.requestFocus();
            this._animateTransition();
          }
        }
      },
      onChanged: (value) {
        var splitedTagsList = value.trim(); //.split(" ");
        // var lastLastTag = splitedTagsList[splitedTagsList.length - 1]
        //     .trim(); //.toLowerCase();

        // if (value.contains(" ")) {
        //   if (lastLastTag.length > 0) {
        //     _textEditingController.clear();

        //     if (!_tagsStringContent.contains(lastLastTag)) {
        //       widget.onTag(lastLastTag);

        //       if (!_showPrefixIcon) {
        //         setState(() {
        //           _tagsStringContent.add(lastLastTag);
        //           _showPrefixIcon = true;
        //         });
        //       } else {
        //         setState(() {
        //           _tagsStringContent.add(lastLastTag);
        //         });
        //       }
        //       this._animateTransition();
        //     }
        //   }
        // }
      },
    );
  }
}
