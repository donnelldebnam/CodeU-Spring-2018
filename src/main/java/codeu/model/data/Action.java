package codeu.model.data;

/** This a class of different actions that can be displayed as an activity. */
public enum Action {
  JOIN("RegisteringUser", true),
  SEND("SendingMessage", true),
  CREATE("CreatingConversation", true);

  /** More info about the action taken */
  private String content;
  /** Is the action public or private ? */
  private Boolean isPublic;

  private Action(String content, Boolean isPublic) {
    this.content = content;
    this.isPublic = isPublic;
  }

  public String getContent() {
    return content;
  }

  public Boolean isPublic() {
    return isPublic;
  }
}
