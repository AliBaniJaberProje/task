package task1.model;

public class Task {

    String id ;
    String taskNmae;
    String createBy;
    int time;
    String employee_to_do;
    String status;

    public Task(String id, String taskNmae, String createBy, int time, String employee_to_do, String status) {

        this.id = id;
        this.taskNmae = taskNmae;
        this.createBy = createBy;
        this.time = time;
        this.employee_to_do = employee_to_do;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTaskNmae() {
        return taskNmae;
    }

    public void setTaskNmae(String taskNmae) {
        this.taskNmae = taskNmae;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public String getEmployee_to_do() {
        return employee_to_do;
    }

    public void setEmployee_to_do(String employee_to_do) {
        this.employee_to_do = employee_to_do;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
