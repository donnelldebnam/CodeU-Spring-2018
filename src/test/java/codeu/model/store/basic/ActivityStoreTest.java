package codeu.model.store.basic;

import codeu.model.data.Activity;
import codeu.model.store.persistence.PersistentStorageAgent;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

public class ActivityStoreTest {

  private ActivityStore activityStore;
  private PersistentStorageAgent mockPersistentStorageAgent;

  private final Activity ACTIVITY_ONE = new Activity(UUID.randomUUID(), UUID.randomUUID(), "RegisteringUser", Instant.ofEpochMilli(1000), null);
  private final Activity ACTIVITY_TWO = new Activity(UUID.randomUUID(), UUID.randomUUID(), "SendingPublicMessage", Instant.ofEpochMilli(1000), null);
  private final Activity ACTIVITY_THREE = new Activity(UUID.randomUUID(), UUID.randomUUID(), "SendingPublicMessage", Instant.ofEpochMilli(1000), null);

  @Before
  public void setup() {
    mockPersistentStorageAgent = Mockito.mock(PersistentStorageAgent.class);
    activityStore = ActivityStore.getTestInstance(mockPersistentStorageAgent);

    final List<Activity> activityList = new ArrayList<>();
    activityList.add(ACTIVITY_ONE);
    activityList.add(ACTIVITY_TWO);
    activityList.add(ACTIVITY_THREE);
    activityStore.setActivities(activityList);
  }

  @Test
  public void testGetAllActivities() {
    List<Activity> activities = activityStore.getAllActivities();
    Assert.assertEquals(3, activities.size());
  }

  @Test
  public void testAddActivity() {
    UUID newAct = UUID.randomUUID();
    Activity inputActivity =
            new Activity(newAct, UUID.randomUUID(), "RegisteringUser", Instant.now(), null);

    activityStore.addActivity(inputActivity);
    Activity resultActivity =
            activityStore.getActivityWithId(newAct);

    assertEquals(inputActivity, resultActivity);
    Mockito.verify(mockPersistentStorageAgent).writeThrough(inputActivity);
  }

  @Test
  public void testGetActivitiesWithType() {
    List<Activity> resultActivity= activityStore.getActivitiesWithType("SendingPublicMessage");
    Assert.assertEquals(2, resultActivity.size());
  }

  @Test
  public void testGetActivitiesWithType_notFound() {
    List<Activity> resultActivity= activityStore.getActivitiesWithType("Saving");
    Assert.assertNull(resultActivity);
  }

  @Test
  public void testgetActivityWithId() {
    UUID activity1 = UUID.randomUUID();
    Activity activity_one =
            new Activity(
                    activity1,
                    UUID.randomUUID(),
                    "SendingPublicMessage",
                    Instant.now(), null);

    UUID activity2 = UUID.randomUUID();
    Activity activity_two =
            new Activity(
                    activity2,
                    UUID.randomUUID(),
                    "RegisteringUser",
                    Instant.now(), null);


    activityStore.addActivity(activity_one);
    activityStore.addActivity(activity_two);

    Activity resultAct = activityStore.getActivityWithId(activity2);

    assertEquals(resultAct, activity_two);
    Assert.assertEquals("RegisteringUser", resultAct.getType());
  }
  private void assertEquals(Activity expectedActivity, Activity actualActivity) {
    Assert.assertEquals(expectedActivity.getId(), actualActivity.getId());
    Assert.assertEquals(expectedActivity.getOwnerId(), actualActivity.getOwnerId());
    Assert.assertEquals(expectedActivity.getType(), actualActivity.getType());
    Assert.assertEquals(expectedActivity.getThumbnail(), actualActivity.getThumbnail());
    Assert.assertEquals(
            expectedActivity.getCreationTime(), expectedActivity.getCreationTime());
  }
}
