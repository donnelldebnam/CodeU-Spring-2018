package codeu.model.store.basic;

import static codeu.model.data.ModelDataTestHelpers.assertMessageEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.time.Instant;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import codeu.model.data.Message;
import codeu.model.data.ModelDataTestHelpers.TestMessageBuilder;
import codeu.model.store.persistence.PersistentStorageAgent;

public class MessageStoreTest {

  private MessageStore messageStore;
  private PersistentStorageAgent mockPersistentStorageAgent;

  private final UUID CONVERSATION_ID_ONE = UUID.randomUUID();
  private final UUID USER_ONE = UUID.randomUUID();

  @Before
  public void setup() {
    mockPersistentStorageAgent = Mockito.mock(PersistentStorageAgent.class);
    messageStore = MessageStore.getTestInstance(mockPersistentStorageAgent);
  }

  @Test
  public void testGetMessagesInConversation() {
    Message message1 = new TestMessageBuilder().withConversationId(CONVERSATION_ID_ONE).build();
    Message message2 = new TestMessageBuilder().build();
    Message message3 = new TestMessageBuilder().withConversationId(CONVERSATION_ID_ONE).build();
    messageStore.setMessages(Arrays.asList(message1, message2, message3));

    List<Message> resultMessages = messageStore.getMessagesInConversation(CONVERSATION_ID_ONE);

    Assert.assertEquals(2, resultMessages.size());
    Map<UUID, Message> resultMessagesSet = new HashMap<>();
    for (Message resultMessage : resultMessages) {
      resultMessagesSet.put(resultMessage.getId(), resultMessage);
    }
    assertMessageEquals(message1, resultMessagesSet.get(message1.getId()));
    assertMessageEquals(message3, resultMessagesSet.get(message3.getId()));
  }

  @Test
  public void testGetMessagesInConversation_noMessagesFound() {
    Message message1 = new TestMessageBuilder().build();
    Message message2 = new TestMessageBuilder().build();
    Message message3 = new TestMessageBuilder().build();
    messageStore.setMessages(Arrays.asList(message1, message2, message3));

    UUID unusedId = UUID.randomUUID();
    List<Message> resultMessages = messageStore.getMessagesInConversation(unusedId);

    assertTrue(resultMessages.isEmpty());
  }

  @Test
  public void testgetMessageWithId() {
    UUID message1 = UUID.randomUUID();
    Message message_one =
            new Message(
                    message1,
                    UUID.randomUUID(),
                    UUID.randomUUID(),
                    "test message",
                    Instant.now());

    UUID message2 = UUID.randomUUID();
    Message message_two =
            new Message(
                    message2,
                    UUID.randomUUID(),
                    UUID.randomUUID(),
                    "Message two",
                    Instant.now());

    messageStore.addMessage(message_one, true);
    messageStore.addMessage(message_two, true);

    Message resultMessage = messageStore.getMessageWithId(message2);

    assertEquals(resultMessage.getId(), message2);
    assertEquals("Message two", resultMessage.getContent());
  }

  @Test
  public void testgetAllMessages() {
    Message message1 = new TestMessageBuilder().build();
    Message message2 = new TestMessageBuilder().build();
    Message message3 = new TestMessageBuilder().build();
    messageStore.setMessages(Arrays.asList(message1, message2, message3));
    assertEquals(3, messageStore.getAllMessages().size());
  }

  @Test
  public void testGetMessagesByUser() {
    final Message message1 = new TestMessageBuilder().build();
    final Message message2 = new TestMessageBuilder().withAuthorId(USER_ONE).build();
    final Message message3 = new TestMessageBuilder().withAuthorId(USER_ONE).build();
    messageStore.setMessages(Arrays.asList(message1, message2, message3));

    List<Message> resultMessages = messageStore.getMessagesByUser(USER_ONE);

    assertEquals(2, resultMessages.size());
    Map<UUID, Message> resultMessagesSet = new HashMap<>();
    for (Message resultMessage : resultMessages) {
      resultMessagesSet.put(resultMessage.getId(), resultMessage);
    }
    assertMessageEquals(message2, resultMessagesSet.get(message2.getId()));
    assertMessageEquals(message3, resultMessagesSet.get(message3.getId()));
  }

  @Test
  public void testAddMessage() {
    final List<Message> messageList = new ArrayList<>();
    messageList.add(new TestMessageBuilder().build());
    messageList.add(new TestMessageBuilder().build());
    messageStore.setMessages(messageList);

    Message message3 = new TestMessageBuilder().withConversationId(CONVERSATION_ID_ONE).build();
    messageStore.addMessage(message3, true);

    List<Message> resultMessages = messageStore.getMessagesInConversation(CONVERSATION_ID_ONE);
    assertEquals(1, resultMessages.size());
    Map<UUID, Message> resultMessagesSet = new HashMap<>();
    for (Message resultMessage : resultMessages) {
      resultMessagesSet.put(resultMessage.getId(), resultMessage);
    }
    assertMessageEquals(message3, resultMessagesSet.get(message3.getId()));
    Mockito.verify(mockPersistentStorageAgent).writeThrough(message3);
  }
}
