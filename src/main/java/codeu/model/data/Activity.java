
package codeu.model.data;

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
  public final Action action;
  public final Instant creation;
  public final String thumbnail;

  /**
   * Constructs a new activity.
   * @param id       the ID of this Activity
   * @param owner    the ID of the owner of this activity
   * @param action   the action of the activity (join, send, create)
   * @param creation the creation time of this Conversation
   * @param thumbnail a short summary about the activity
   */
  public Activity(UUID id, UUID owner, Action action, Instant creation, String thumbnail) {
    this.id = id;
    this.action = action;
    this.owner = owner;
    this.creation = creation;
    this.thumbnail = thumbnail;
  }

  public Activity(User u) {
    this(u.getId(), u.getId(), Action.JOIN, u.getCreationTime(), DateTimeFormatter.RFC_1123_DATE_TIME.withZone(ZoneOffset.UTC).format(u.getCreationTime()) + ": " + u.getName() + " joined CodeByters!");
  }

  public Activity(Conversation c) {
    this(c.getId(), c.getOwnerId(), Action.CREATE, c.getCreationTime(), DateTimeFormatter.RFC_1123_DATE_TIME.withZone(ZoneOffset.UTC).format(c.getCreationTime()) + ": [USER] created a new public conversation = \"" + c.getTitle() + "\".");
  }

  public Activity(Message m) {
    this(m.getId(), m.getAuthorId(), Action.SEND, m.getCreationTime(), DateTimeFormatter.RFC_1123_DATE_TIME.withZone(ZoneOffset.UTC).format(m.getCreationTime()) + ": [USER] sent a message in [Conversation]: "+m.getContent()+".");
  }

  /**
   * Returns the ID of this activity.
   */
  public UUID getId() {
    return id;
  }

  /**
   * Returns the ID of the User who created this activity.
   */
  public UUID getOwnerId() {
    return owner;
  }

  /**
   * Returns the action of this activity.
   */
  public Action getAction() {
    return action;
  }

  /**
   * Returns the creation time of this activity.
   */
  public Instant getCreationTime() {
    return creation;
  }

  /**
   * Returns a small summary of the activity
   * @return
   */
  public String getThumbnail() {
    return thumbnail;
  }

}
