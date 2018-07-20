package codeu.model.util;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.time.Instant;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Properties;

public class Util {

  /** Returns the date and time in the format: Thu, 14 Jun 2018 05:01:09 GMT */
  public static String FormatDateTime(Instant creationTime) {
    return DateTimeFormatter.RFC_1123_DATE_TIME.withZone(ZoneOffset.UTC).format(creationTime);
  }

  /**
   * Sends an email to the user in case they forget their password.
   */
  public static boolean sendEmail(String name, String to, String code, String url) {
    try {
      String host = "smtp.gmail.com";
      String from = "codebyterorg@gmail.com";
      String pass = "cornellUniversity";
      String user = "codebyterorg@gmail.com";
      String subject = "CodeByter password reset";
      String part1 = "Hi " + name + ",</br></br>To reset your password, Use " +
              "the following code as a password to login to your account: </br></br>";
      String link = "To log back in, use: <a>" + url + "</a></br></br>";
      String thank = "Thanks, <br/>The CodeByter Security Team";
      String messageText = part1 + code + "</br></br>"+ link + thank;
      boolean sessionDebug = false;


      Properties props = System.getProperties();

      // Setup mail server
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.port", "587");
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.required", "true");

      java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
      Session mailSession = Session.getDefaultInstance(props, null);

      mailSession.setDebug(sessionDebug);
      Message msg = new MimeMessage(mailSession);
      msg.setFrom(new InternetAddress(from));
      InternetAddress[] address = {new InternetAddress(to)};
      msg.setRecipients(Message.RecipientType.TO, address);
      msg.setSubject(subject); msg.setSentDate(new Date());
      msg.setContent(messageText, "text/html; charset=utf-8");

      Transport transport=mailSession.getTransport("smtp");
      transport.connect(host, user, pass);
      transport.sendMessage(msg, msg.getAllRecipients());
      transport.close();
    } catch (MessagingException mex) {
      return false;
    }
    return true;
  }

  /**
   * For security purpose:
   * Hides the email of the User to the public.
   * Ex: an474@cornell.edu
   * return: an**@c******.***
   * @return
   */
  public static String transform(String email){
    StringBuilder transform = new StringBuilder();
    int index = email.indexOf("@");
    String part1 = email.substring(index);
    int index2 = part1.indexOf(".") + email.substring(0, index).length();

    for(int i =0; i<index; i++){
      if(i == 0 || i == 1) transform.append(email.charAt(i));
      else transform.append("*");
    }
    transform.append("@" + part1.charAt(1));
    for(int i = index+2; i<index2; i++){
      transform.append("*");
    }
    transform.append(".");
    for(int i = index2+1; i<email.length(); i++){
      transform.append("*");
    }
    return transform.toString();
  }
}
