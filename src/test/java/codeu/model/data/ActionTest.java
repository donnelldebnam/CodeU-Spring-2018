package codeu.model.data;

import org.junit.Assert;
import org.junit.Test;

import java.time.Instant;
import java.util.UUID;

public class ActionTest {
  @Test
  public void testCreate() {
    Activity activity1 = new Activity(UUID.randomUUID(), UUID.randomUUID(), Action.JOIN, Instant.now(), "registering");
    Activity activity2 = new Activity(UUID.randomUUID(), UUID.randomUUID(), Action.CREATE, Instant.now(), "creating");
    Activity activity3 = new Activity(UUID.randomUUID(), UUID.randomUUID(), Action.SEND, Instant.now(), "sending");

    Assert.assertEquals(activity1.getAction().getAccess(), /*public*/ true);
    Assert.assertEquals("RegisteringUser", activity1.getAction().getContent());
    Assert.assertEquals(activity2.getAction().getAccess(), /*public*/ true);
    Assert.assertEquals("CreatingConversation", activity2.getAction().getContent());
    Assert.assertEquals(activity3.getAction().getAccess(), /*public*/ true);
    Assert.assertEquals("SendingMessage", activity3.getAction().getContent());
  }
}
