package codeu.model.store.basic;

import static codeu.model.data.ModelDataTestHelpers.assertConversationEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import codeu.model.data.Activity;
import codeu.model.data.Conversation;
import codeu.model.data.ModelDataTestHelpers.TestConversationBuilder;
import codeu.model.store.persistence.PersistentStorageAgent;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

public class ConversationStoreTest {

  private ConversationStore conversationStore;
  private PersistentStorageAgent mockPersistentStorageAgent;
  private ActivityStore activityStore;

  @Before
  public void setup() {
    mockPersistentStorageAgent = Mockito.mock(PersistentStorageAgent.class);
    conversationStore = ConversationStore.getTestInstance(mockPersistentStorageAgent);
    activityStore = ActivityStore.getTestInstance(mockPersistentStorageAgent);
    conversationStore.setActivityStore(activityStore);
  }

  @Test
  public void testGetConversationWithTitle_found() {
    final Conversation convo1 = new TestConversationBuilder().build();
    final Conversation convo2 = new TestConversationBuilder().withTitle("some title 1").build();
    final Conversation convo3 = new TestConversationBuilder().build();
    conversationStore.setConversations(Arrays.asList(convo1, convo2, convo3));

    Conversation resultConversation = conversationStore.getConversationWithTitle("some title 1");

    assertConversationEquals(convo2, resultConversation);
  }

  @Test
  public void testGetConversationWithTitle_notFound() {
    final Conversation convo1 = new TestConversationBuilder().build();
    final Conversation convo2 = new TestConversationBuilder().build();
    final Conversation convo3 = new TestConversationBuilder().build();
    conversationStore.setConversations(Arrays.asList(convo1, convo2, convo3));

    Conversation resultConversation = conversationStore.getConversationWithTitle("unfound_title");

    assertNull(resultConversation);
  }

  @Test
  public void testIsTitleTaken_true() {
    final Conversation convo1 = new TestConversationBuilder().build();
    final Conversation convo2 = new TestConversationBuilder().withTitle("some title 1").build();
    final Conversation convo3 = new TestConversationBuilder().build();
    conversationStore.setConversations(Arrays.asList(convo1, convo2, convo3));

    boolean isTitleTaken = conversationStore.isTitleTaken("some title 1");

    assertTrue(isTitleTaken);
  }

  @Test
  public void testIsTitleTaken_false() {
    final Conversation convo1 = new TestConversationBuilder().build();
    final Conversation convo2 = new TestConversationBuilder().build();
    final Conversation convo3 = new TestConversationBuilder().build();
    conversationStore.setConversations(Arrays.asList(convo1, convo2, convo3));

    boolean isTitleTaken = conversationStore.isTitleTaken("unfound_title");

    assertFalse(isTitleTaken);
  }

  @Test
  public void testAddConversation() {
    final List<Conversation> conversationList = new ArrayList<>();
    conversationList.add(new TestConversationBuilder().build());
    conversationList.add(new TestConversationBuilder().build());
    conversationStore.setConversations(conversationList);

    final Conversation inputConversation =
        new TestConversationBuilder().withTitle("test_conversation").build();
    conversationStore.addConversation(inputConversation);

    Conversation resultConversation =
        conversationStore.getConversationWithTitle("test_conversation");
    assertConversationEquals(inputConversation, resultConversation);
    Mockito.verify(mockPersistentStorageAgent).writeThrough(inputConversation);
    Activity activity1 = activityStore.getActivityWithId(inputConversation.getId());
    Mockito.verify(mockPersistentStorageAgent).writeThrough(activity1);
  }

  @Test
  public void testgetConversationWithId() {
    UUID conversation1 = UUID.randomUUID();
    Conversation conv_one =
        new Conversation(conversation1, UUID.randomUUID(), "test message", Instant.now());

    UUID conversation2 = UUID.randomUUID();
    Conversation conv_two =
        new Conversation(conversation2, UUID.randomUUID(), "Conversation two", Instant.now());

    conversationStore.addConversation(conv_one);
    conversationStore.addConversation(conv_two);

    Conversation resultConv = conversationStore.getConversationWithId(conversation2);

    assertEquals(resultConv, conv_two);
    Assert.assertEquals(resultConv.getId(), conversation2);
    Assert.assertEquals("Conversation two", resultConv.getTitle());
  }

  private void assertEquals(Conversation expectedConversation, Conversation actualConversation) {
    Assert.assertEquals(expectedConversation.getId(), actualConversation.getId());
    Assert.assertEquals(expectedConversation.getOwnerId(), actualConversation.getOwnerId());
    Assert.assertEquals(expectedConversation.getTitle(), actualConversation.getTitle());
    Assert.assertEquals(
        expectedConversation.getCreationTime(), actualConversation.getCreationTime());
  }
}
