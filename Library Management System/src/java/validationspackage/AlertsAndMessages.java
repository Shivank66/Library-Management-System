
package validationspackage;

public class AlertsAndMessages {
 public static String showSuccess(String heading,String message)
 {
     String output="<div class=\"alert alert-success  alert-dismissible fade show \">\n";
output+="<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+"<strong>"  + heading + "</strong>\n";
output+=message + "\n" + "  </div>";
return output;
 }
 public static String showDanger(String heading,String message)
 {
     String output="<div class=\"alert alert-danger alert-dismissible fade show \">\n";
    output+="<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+"<strong>"  + heading + "</strong>\n";
    output+=message + "\n" + "  </div>";
    return output;
 }
  public static String showWarning(String heading,String message)
 {
     String output="<div class=\"alert alert-warning alert-dismissible fade show \">\n";
    output+="<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+"<strong>"  + heading + "</strong>\n";
    output+=message + "\n" + "  </div>";
    return output;
 }

 
}
