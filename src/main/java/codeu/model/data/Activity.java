
package codeu.model.data;

import codeu.model.store.basic.ConversationStore;
import codeu.model.store.basic.UserStore;

import java.time.Instant;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

/**
 * Class representing an activity (creating user, message, or conversation).
 * Any creation done by a user prompts the creation of
 * an activity object.
 */
public class Activity {
  public final UUID id;
  public final UUID owner;
  public final String type;
  public final Instant creation;
  public final String thumbnail;

  /**
   * Constructs a new activity.
   *
   * @param id the ID of this Conversation
   * @param type the Type of the activity (user, message, conversation)
   * @param creation the creation time of this Conversation
   */
  public Activity(UUID id, UUID owner, String type, Instant creation, String thumbnail) {
    this.id = id;
    this.type = type;
    this.owner = owner;
    this.creation = creation;
    this.thumbnail = thumbnail;
  }

  /** Returns the ID of this Conversation. */
  public UUID getId() {
    return id;
  }

  /** Returns the ID of the User who created this Conversation. */
  public UUID getOwnerId() {
    return owner;
  }

  /** Returns the title of this Conversation. */
  public String getType() {
    return type;
  }

  /** Returns the creation time of this Conversation. */
  public Instant getCreationTime() {
    return creation;
  }

  public String getThumbnail() {
    return thumbnail;
  }

  /** Returns a thumbnail for registering a new user. */
  public static Activity displayRegistering(User u){
    return new Activity(u.getId(), u.getId(), "Registering", u.getCreationTime(), DateTimeFormatter.RFC_1123_DATE_TIME.withZone(ZoneOffset.UTC).format(u.getCreationTime()) + " : " + u.getName() + " joined CodeByters.");
  }

  /** Returns a thumbnail for creating a public conversation. */
  public static Activity displayPublicConversation(Conversation c){
    String ownerName = UserStore.getInstance().getUser(c.getOwnerId()).getName();
    return new Activity(c.getId(), c.getOwnerId(), "CreatingPublicConversation", c.getCreationTime(), DateTimeFormatter.RFC_1123_DATE_TIME.withZone(ZoneOffset.UTC).format(c.getCreationTime()) + " : " + ownerName + " created " + "a new public conversation = \" " + c.getTitle() + "\".");
  }

  /** Returns a thumbnail for creating a public message inside a chat. */
  public static Activity displayPublicMessage(Message m){
    String ownerName = UserStore.getInstance().getUser(m.getAuthorId()).getName();
    String conversationTitle = (ConversationStore.getInstance().getConversationWithID(m.getConversationId())).getTitle();
    return new Activity(m.getId(), m.getAuthorId(), "CreatingPublicMessage", m.getCreationTime(), DateTimeFormatter.RFC_1123_DATE_TIME.withZone(ZoneOffset.UTC).format(m.getCreationTime()) + " : " + ownerName + " sent a message in " + conversationTitle + ".");
  }
}
