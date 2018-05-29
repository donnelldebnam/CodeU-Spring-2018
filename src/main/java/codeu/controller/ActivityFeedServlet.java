package codeu.controller;

import codeu.model.data.Activity;
import codeu.model.data.Conversation;
import codeu.model.data.Message;
import codeu.model.data.User;
import codeu.model.store.basic.ConversationStore;
import codeu.model.store.basic.MessageStore;
import codeu.model.store.basic.UserStore;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** Servlet responsible for the activity feed page. */
public class ActivityFeedServlet extends HttpServlet{

  /** Store class that gives access to Conversations. */
  private ConversationStore conversationStore;

  /** Store class that gives access to Messages. */
  private MessageStore messageStore;

  /** Store class that gives access to Users. */
  private UserStore userStore;

  /** Set up state for handling activityfeed requests. */
  @Override
  public void init() throws ServletException {
    super.init();
    setConversationStore(ConversationStore.getInstance());
    setMessageStore(MessageStore.getInstance());
    setUserStore(UserStore.getInstance());
  }

  /**
   * Sets the ConversationStore used by this servlet. This function provides a common setup method
   * for use by the test framework or the servlet's init() function.
   */
  void setConversationStore(ConversationStore conversationStore) {
    this.conversationStore = conversationStore;
  }

  /**
   * Sets the MessageStore used by this servlet. This function provides a common setup method for
   * use by the test framework or the servlet's init() function.
   */
  void setMessageStore(MessageStore messageStore) {
    this.messageStore = messageStore;
  }

  /**
   * Sets the UserStore used by this servlet. This function provides a common setup method for use
   * by the test framework or the servlet's init() function.
   */
  void setUserStore(UserStore userStore) {
    this.userStore = userStore;
  }

  /**
   * This function fires when a user navigates to the activityFeed page. It fetches all the data from the
   * database and displays it in order of the newest to oldest based on timestamp.
   */

  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
          throws IOException, ServletException {
    List<Activity> activities = new ArrayList<>();

    List<Conversation> conversations = conversationStore.getAllConversations();
    List<User> users = userStore.getAllUsers();
    List<Message> messages = messageStore.getAllMessages();

    for(User u: users){
      if(!u.isAdmin())
        activities.add(Activity.displayRegistering(u));
    }
    for(Conversation c: conversations){
      activities.add(Activity.displayPublicConversation(c));
    }
    for(Message m: messages){
      activities.add(Activity.displayPublicMessage(m));
    }

    // Sorts the activities in order to  display them chronologically.
    sort(activities);

    request.setAttribute("activities", activities);

    request.getRequestDispatcher("/WEB-INF/view/activityfeed.jsp").forward(request, response);
  }

  /**
   * This function sorts the activity lists from oldest to newest.
   */
  public void sort(List<Activity> activities) {
    if(activities.size() == 1) return;
    for (int i = 0; i<activities.size(); i++){
      int latest = latest(activities, i, activities.size());
      swap(activities, i, latest);
    }
  }

  /**
   * This helper functions returns the index of the oldest activity.
   */
  public int latest(List<Activity> activities, int start, int end){
    int lastIndex = start;
    for(int i = start; i< end; i++){
      if(activities.get(i).getCreationTime().isAfter(activities.get(lastIndex).getCreationTime())){
        lastIndex = i;
      }
    }
    return lastIndex;
  }

  /**
   * This helper functions help swap two activities based on their times.
   */
  public void swap(List<Activity> activities, int a, int b){
    Activity temp1 = activities.get(a);
    Activity temp2 = activities.get(b);
    activities.set(a, temp2);
    activities.set(b, temp1);

  }
}
