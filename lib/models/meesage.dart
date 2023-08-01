class messagesmodel {
  final String message;
  final String email;
  messagesmodel(this.message, this.email);
  factory messagesmodel.fromjsio(jsiodata) {
    return messagesmodel(jsiodata['message'], jsiodata['email']);
  }
}
