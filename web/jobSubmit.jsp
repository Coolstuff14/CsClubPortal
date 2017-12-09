<%-- 
    Document   : ticketSubmit.jsp
    Created on : Oct 3, 2015, 4:57:12 PM
    Author     : jlee37
--%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.*"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Submitted!</title>
  </head>
  <body>
    <%
        String uID = (String) session.getAttribute("uID");
        String name = (String) session.getAttribute("name");

        String title, desc, prog, email = "", urgency, member, status, sql = "", date, editFlag="0",jobID="";
        
        title = request.getParameter("titleTxt");
        desc = request.getParameter("descTxt");
        prog = request.getParameter("progTxt");
        member = request.getParameter("membList");
        status = request.getParameter("statusList");
        editFlag = request.getParameter("editFlag");
        
        if (request.getParameter("urgencyRb").equals("Normal")) {
            urgency = "Normal";
        } else {
            urgency = "Urgent";
        }
        
        if (editFlag.equals("1")){
            jobID = request.getParameter("jobID");
            sql = "UPDATE job SET title='" + title + "', description='" + desc + "', progress='" + prog + "' , memberName='" + member + "', status='" + status + 
                    "', urgency='" + urgency + "' WHERE jobID='" + jobID + "'";
           
        }else{
            
            Date dNow = new Date( );
        SimpleDateFormat ft = 
        new SimpleDateFormat ("yyyy-MM-dd");
        date = ft.format(dNow);

        sql = "insert into job(dateCreated, submitBy, title, description, progress, memberName, status, urgency)"
                + "values("+"'"+ date +"','" + uID +"','"+ title +"','"+ desc +"','"+ prog +"','"+ member +"','"+ status +"','"+ urgency +"')";

        }
        
        
        
        out.print(sql);

        DBConnect dbConnect = new DBConnect();

        String message = dbConnect.updateDB(sql);

        if (message == "true") {
            //out.println(message);
            response.sendRedirect("jobhome.jsp");
        } else {
            out.println(message);
        }
       

    %>

    <table>
      <h1>Thanks for submitting a new ticket!</h1>
      <tbody>
        <tr>
          <td>Status</td>
          <td><%= status%></td>
        </tr>
        <tr>
          <td>Title</td>
          <td><%= title%></td>
        </tr>
        <tr>
          <td>Description</td>
          <td><%= desc%></td>
        </tr>
        <tr>
          <td>Progress</td>
          <td><%= prog%></td>
        </tr>
        <tr>
          <td>Email</td>
          <td><%= email%></td>
        </tr>
        <tr>
          <td>Responsible Member</td>
          <td><%= member%></td>
        </tr>
        <tr>
          <td>Urgency</td>
          <td><%= urgency%></td>
        </tr>
        <!--<tr>
          <td>Archive</td>
          <td></td>
        </tr>-->
      </tbody>
    </table>

  </body>
</html>
