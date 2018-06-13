package codeu.model.data;

import static org.junit.Assert.assertEquals;

import java.time.Instant;
import java.util.UUID;
import org.junit.Test;

public class ActionTest {
  @Test
  public void testCreate() {
    Activity activity1 =
        new Activity(
            UUID.randomUUID(),
            UUID.randomUUID(),
            Action.JOIN.getContent(),
            true,
            Instant.now(),
            "registering");
    Activity activity2 =
        new Activity(
            UUID.randomUUID(),
            UUID.randomUUID(),
            Action.CREATE.getContent(),
            true,
            Instant.now(),
            "creating");
    Activity activity3 =
        new Activity(
            UUID.randomUUID(),
            UUID.randomUUID(),
            Action.SEND.getContent(),
            true,
            Instant.now(),
            "sending");

    assertEquals(activity1.isPublic(), /*public*/ true);
    assertEquals("RegisteringUser", activity1.getAction());
    assertEquals(activity2.isPublic(), /*public*/ true);
    assertEquals("CreatingConversation", activity2.getAction());
    assertEquals(activity3.isPublic(), /*public*/ true);
    assertEquals("SendingMessage", activity3.getAction());
  }
}
