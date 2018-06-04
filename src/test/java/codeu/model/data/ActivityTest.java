package codeu.model.data;

import static org.junit.Assert.assertEquals;
import org.junit.Test;
import java.time.Instant;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

public class ActivityTest {

  @Test
  public void testCreate1() {
    UUID id = UUID.randomUUID();
    Instant creation = Instant.now();

    User u = new User(id, "User1", "123", creation);
    Activity activity = new Activity(u);

    assertEquals(id, activity.getId());
    // By default, the user is his own owner
    assertEquals(id, activity.getOwnerId());
    assertEquals("RegisteringUser", activity.getAction().getContent());
    assertEquals(creation, activity.getCreationTime());
    String time = DateTimeFormatter.RFC_1123_DATE_TIME.withZone(ZoneOffset.UTC).format(u.getCreationTime());
    assertEquals( time + ": User1 joined CodeByters!", activity.getThumbnail());
  }

  @Test
  public void testCreate2() {
    UUID id = UUID.randomUUID();
    UUID owner = UUID.randomUUID();
    Instant creation = Instant.now();

    Conversation c = new Conversation(id, owner, "Title1", creation);

    Activity activity = new Activity(c);

    assertEquals(id, activity.getId());
    assertEquals(owner, activity.getOwnerId());
    assertEquals("CreatingConversation", activity.getAction().getContent());
    assertEquals(creation, activity.getCreationTime());
    String time = DateTimeFormatter.RFC_1123_DATE_TIME.withZone(ZoneOffset.UTC).format(c.getCreationTime());
    assertEquals( time + ": " + "[USER] created a new public conversation = \"Title1\".", activity.getThumbnail());
  }

  @Test
  public void testCreate3() {
    UUID id = UUID.randomUUID();
    UUID author = UUID.randomUUID();
    Instant creation = Instant.now();
    Instant creation2 = Instant.now();

    UUID IdConv = UUID.randomUUID();
    Conversation c = new Conversation(IdConv, UUID.randomUUID(), "Title1", creation);
    Message m = new Message(id, IdConv, author, "hello", creation2);

    Activity activity = new Activity(m);

    assertEquals(id, activity.getId());
    assertEquals(author, activity.getOwnerId());
    assertEquals("SendingMessage", activity.getAction().getContent());
    assertEquals(creation, activity.getCreationTime());
    String time = DateTimeFormatter.RFC_1123_DATE_TIME.withZone(ZoneOffset.UTC).format(c.getCreationTime());
    assertEquals( time + ": [USER] sent a message in [Conversation]: hello.", activity.getThumbnail());
  }
}
