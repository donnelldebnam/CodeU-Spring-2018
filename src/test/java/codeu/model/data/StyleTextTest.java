package codeu.model.data;

import org.junit.Assert;
import org.junit.Test;

public class StyleTextTest {

  @Test
  public void testStyleText() {
    String message = "this is a [b]test[/b] message";

    String result = StyleText.style(message);

    String expectedOutput = "this is a <b>test</b> message";
    Assert.assertEquals(expectedOutput, result);
  }
}
