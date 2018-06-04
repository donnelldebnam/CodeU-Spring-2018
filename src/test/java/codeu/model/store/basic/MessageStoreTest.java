package codeu.model.store.basic;

import codeu.model.data.Message;
import codeu.model.store.persistence.PersistentStorageAgent;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;


public class MessageStoreTest {

  private MessageStore messageStore;
  private PersistentStorageAgent mockPersistentStorageAgent;

  private final UUID CONVERSATION_ID_ONE = UUID.randomUUID();
  private final Message MESSAGE_ONE =
      new Message(
          UUID.randomUUID(),
          CONVERSATION_ID_ONE,
          UUID.randomUUID(),
          "message one",
          Instant.ofEpochMilli(1000));
  private final Message MESSAGE_TWO =
      new Message(
          UUID.randomUUID(),
          CONVERSATION_ID_ONE,
          UUID.randomUUID(),
          "message two",
          Instant.ofEpochMilli(2000));
  private final Message MESSAGE_THREE =
      new Message(
          UUID.randomUUID(),
          UUID.randomUUID(),
          UUID.randomUUID(),
          "message three",
          Instant.ofEpochMilli(3000));

  @Before
  public void setup() {
    mockPersistentStorageAgent = Mockito.mock(PersistentStorageAgent.class);
    messageStore = MessageStore.getTestInstance(mockPersistentStorageAgent);

    final List<Message> messageList = new ArrayList<>();
    messageList.add(MESSAGE_ONE);
    messageList.add(MESSAGE_TWO);
    messageList.add(MESSAGE_THREE);
    messageStore.setMessages(messageList);
  }

  @Test
  public void testGetMessagesInConversation() {
    List<Message> resultMessages = messageStore.getMessagesInConversation(CONVERSATION_ID_ONE);

    Assert.assertEquals(2, resultMessages.size());
    assertEquals(MESSAGE_ONE, resultMessages.get(0));
    assertEquals(MESSAGE_TWO, resultMessages.get(1));
  }

  @Test
  public void testAddMessage() {
    UUID inputConversationId = UUID.randomUUID();
    Message inputMessage =
        new Message(
            UUID.randomUUID(),
            inputConversationId,
            UUID.randomUUID(),
            "test message",
            Instant.now());

    messageStore.addMessage(inputMessage, true);
    Message resultMessage = messageStore.getMessagesInConversation(inputConversationId).get(0);

    assertEquals(inputMessage, resultMessage);
    Mockito.verify(mockPersistentStorageAgent).writeThrough(inputMessage);
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

    Assert.assertEquals(resultMessage.getId(), message2);
    Assert.assertEquals("Message two", resultMessage.getContent());

  }

  @Test
  public void testgetAllMessages() {
    List<Message> messages = messageStore.getAllMessages();
    Assert.assertEquals(3, messages.size());
  }

  private void assertEquals(Message expectedMessage, Message actualMessage) {
    Assert.assertEquals(expectedMessage.getId(), actualMessage.getId());
    Assert.assertEquals(expectedMessage.getConversationId(), actualMessage.getConversationId());
    Assert.assertEquals(expectedMessage.getAuthorId(), actualMessage.getAuthorId());
    Assert.assertEquals(expectedMessage.getContent(), actualMessage.getContent());
    Assert.assertEquals(expectedMessage.getCreationTime(), actualMessage.getCreationTime());
  }
}
