/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myBeans;

/**
 *
 * @author jlee37
 */
public class JobBean {

    private String jobID;
    private String date;
    private String title;
    private String urgency;
    private String status;
    private String memberName;

    public String getJobID() {
        return jobID;
    }

    protected void setJobID(String jobID) {
        this.jobID = jobID;
    }

    public String getDate() {
        return date;
    }

    protected void setDate(String date) {
        this.date = date;
    }

    public String getTitle() {
        return title;
    }

    protected void setTitle(String title) {
        this.title = title;
    }

    public String getUrgency() {
        return urgency;
    }

    protected void setUrgency(String urgency) {
        this.urgency = urgency;
    }

    public String getStatus() {
        return status;
    }

    protected void setStatus(String status) {
        this.status = status;
    }

    public String getMemberName() {
        return memberName;
    }

    protected void setMemberName(String memberName) {
        this.memberName = memberName;
    }

}
