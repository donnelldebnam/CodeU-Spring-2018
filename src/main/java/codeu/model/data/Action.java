package codeu.model.data;

/** This a class of different actions that can be displayed as an activity. */
public enum Action {
  JOIN("RegisteringUser"),
  SEND("SendingMessage"),
  CREATE("CreatingConversation");

  /** More info about the action taken */
  private String content;

  private Action(String content) {
    this.content = content;
  }

  public String getContent() {
    return content;
  }
}
