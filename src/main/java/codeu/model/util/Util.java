package codeu.model.util;

import java.time.Instant;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;

public class Util {

  /** Returns the date and time in the format: Thu, 14 Jun 2018 05:01:09 GMT */
  public static String FormatDateTime(Instant creationTime) {
    return DateTimeFormatter.RFC_1123_DATE_TIME.withZone(ZoneOffset.UTC).format(creationTime);
  }
  /** Checks for white spaces */
  public static boolean isWhiteSpace(String value) {
    return value.trim().isEmpty();
  }
  /** Checks for null values and white spaces */
  public static boolean isNullOrWhiteSpace(String value) {
    return value == null || value.trim().isEmpty();
  }
}
