<%-- 
    Document   : deleteJob
    Created on : Dec 16, 2015, 6:48:52 AM
    Author     : jlee37
--%>


<!DOCTYPE html>
<html>
  <head>
    <%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.*"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    
    <%
        
        String jobID = (String) session.getAttribute("jobID");
        
        String sql="DELETE FROM job WHERE jobID='"+jobID+"'";
        
        DBConnect dbConnect = new DBConnect();

        String message = dbConnect.updateDB(sql);

        if (message == "true") {
            //out.println(message);
            response.sendRedirect("jobhome.jsp");
        } else {
            out.println(message);
        }
        
        %>
    
    
  </body>
</html>
