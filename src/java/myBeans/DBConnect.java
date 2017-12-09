/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myBeans;

/**
 *
 * @author nmahadev
 */
import java.sql.*;
import java.util.ArrayList;


public class DBConnect {

    // Declare variables
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/csmain";
    String username = "Jake";
    String password = "password";
    Connection conn;
    Statement stm;
    ResultSet rst;

    // Connect to the database
    private boolean connectDB() {

        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, username, password);
            stm = conn.createStatement();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public String updateDB(String sql) {
        if (connectDB()) {
            try {
                stm.executeUpdate(sql);
                stm.close();
                conn.close();
                return "true";
            } catch (Exception e) {
                return e.getMessage();
            }
        } else {
            return "false";
        }
    }

    public String dropdown(String sql) {
        if (connectDB()) {
            try {
                rst = stm.executeQuery(sql);
                String html = "";
                while (rst.next()) {
                    html += "<option value = '" + rst.getString(1)
                            + "'>" + rst.getString(2) + "</option>/n";
                }
                stm.close();
                conn.close();
                return html;
            } catch (Exception e) {
                return "Error";
            }
        } else {
            return "Error";
        }
    }
    
     public String dropdown2(String sql, String name) {
        if (connectDB()) {
            try {
                rst = stm.executeQuery(sql);
                String html = "";
                while (rst.next()) {
                    if (rst.getString(1).equals(name)){
                        html += "<option selected>" + rst.getString(1) + "</option>/n";
                    }else{
                        html += "<option>" + rst.getString(1) + "</option>/n";
                    }
                }
                stm.close();
                conn.close();
                return html;
            } catch (Exception e) {
                return "Error";
            }
        } else {
            return "Error";
        }
    }
    


    public String[] validatePwd(String sql, String user, String pwd) {
        if (connectDB()) {
            try {
                rst = stm.executeQuery(sql);
                rst.next();
                if (rst.getString(4).equals(user) && rst.getString(5).equals(pwd)) {
                    String memID = rst.getString(1);
                    String name = rst.getString(2);
                    String eboard = rst.getString(3);
                    rst.close();
                    stm.close();
                    return new String[]{memID, name, eboard};
                } else {
                    rst.close();
                    stm.close();
                    return new String[]{"error", ""};
                }
            } catch (Exception e) {
                return new String[]{"error", ""};
            }
        }
        return new String[]{"error", ""};
    }

    public String[] retrieveRow(String sql) {
        if (connectDB()) {
            try {
                rst = stm.executeQuery(sql);
                rst.next();
                return new String[]{rst.getString(1), rst.getString(2), rst.getString(3), rst.getString(4), rst.getString(5), rst.getString(6),rst.getString(7)};

            } catch (Exception e) {
                return new String[]{e.getMessage()};
            }
        }

        return new String[]{"error"};
    }
    
    public String[] retrieveRowJob(String sql) {
        if (connectDB()) {
            try {
                rst = stm.executeQuery(sql);
                rst.next();
                return new String[]{rst.getString(1), rst.getString(2), rst.getString(3), rst.getString(4), rst.getString(5), rst.getString(6),rst.getString(7),rst.getString(8)};

            } catch (Exception e) {
                return new String[]{e.getMessage()};
            }
        }

        return new String[]{"error"};
    }
    
    public String getValue(String sql){
        if (connectDB()){
            try{
                rst = stm.executeQuery(sql);
                rst.next();
                String value = rst.getString(1);
                rst.close();
                stm.close();
                return value;
            }catch(Exception e){
                return e.getMessage();
            }
            
        }
        return "error";
    }
    
    public ArrayList<JobBean> getJobList() throws SQLException, ClassNotFoundException{
         ArrayList error = new ArrayList();
        if (connectDB()){   
         
                ArrayList<JobBean> jobList = new ArrayList<>();
                rst = stm.executeQuery("SELECT * FROM job");
                while(rst.next()){
                    JobBean jBean = new JobBean();
                    jBean.setJobID(rst.getString("jobID"));
                    jBean.setDate(rst.getString("dateCreated"));
                    jBean.setTitle(rst.getString("title"));
                    jBean.setUrgency(rst.getString("urgency"));
                    jBean.setStatus(rst.getString("status"));
                    jBean.setMemberName(rst.getString("memberName"));
                    
                    System.out.print(jobList.size());
                    jobList.add(jBean);
                }
                rst.close();
                stm.close();
                return jobList;
          
        }
        
      error.add(0,"error"); 
      return error;
    }
   
}

