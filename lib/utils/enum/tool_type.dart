enum ToolsType {
  image,
  chat,
  video;

  String get name =>
      switch (this) { image => 'image', video => 'video', chat => 'chat' };
  int get id => switch (this) { image => 1, video => 2, chat => 3 };
}

enum ToolsFunction {
  textToImage,
  imageToImage,
  upscaling,
  multiPrompting,
  assitance;

  int get id => switch (this) {
        textToImage => 1,
        imageToImage => 2,
        upscaling => 3,
        multiPrompting => 4,
        assitance => 5,
      };
  String get title => switch (this) {
        assitance => 'Assitance',
        textToImage => 'Text to Image',
        imageToImage => 'Image to Image',
        upscaling => 'Upscaling',
        multiPrompting => 'Multi - Prompting',
      };
  String get type => switch (this) {
        textToImage => ToolsType.image.name,
        imageToImage => ToolsType.image.name,
        upscaling => ToolsType.image.name,
        multiPrompting => ToolsType.image.name,
        assitance => ToolsType.chat.name,
      };
}
