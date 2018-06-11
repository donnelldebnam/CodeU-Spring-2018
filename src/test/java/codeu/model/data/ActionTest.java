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
            UUID.randomUUID(), UUID.randomUUID(), Action.JOIN, Instant.now(), "registering");
    Activity activity2 =
        new Activity(
            UUID.randomUUID(), UUID.randomUUID(), Action.CREATE, Instant.now(), "creating");
    Activity activity3 =
        new Activity(UUID.randomUUID(), UUID.randomUUID(), Action.SEND, Instant.now(), "sending");

    assertEquals(activity1.getAction().getAccess(), /*public*/ true);
    assertEquals("RegisteringUser", activity1.getAction().getContent());
    assertEquals(activity2.getAction().getAccess(), /*public*/ true);
    assertEquals("CreatingConversation", activity2.getAction().getContent());
    assertEquals(activity3.getAction().getAccess(), /*public*/ true);
    assertEquals("SendingMessage", activity3.getAction().getContent());
  }
}
