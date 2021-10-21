
package validationspackage;

public class AlertsAndMessages {
 public static String showSuccess(String heading,String message)
 {
     String output="<div class=\"alert alert-success\">\n";
output+="<strong>"  + heading + "</strong>\n";
output+=message + "\n" + "  </div>";
return output;
 }
}
