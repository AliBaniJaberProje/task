package task1.model;

public class Employee {

   private String email;
   private String username;
   private String imgURL;
   private String type;
    private  String id ;


    public Employee(String email, String username, String imgURL, String type, String id) {
        this.email = email;
        this.username = username;
        this.imgURL = imgURL;
        this.type = type;
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
