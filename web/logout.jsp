<%-- 
    Document   : logout
    Created on : Nov 11, 2015, 2:05:07 PM
    Author     : jlee37
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.*"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Logout</title>
  </head>
  <body>
    <%
        request.getSession().setAttribute("uID", "null");
        request.getSession().invalidate();
        response.sendRedirect("index.jsp");

        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    %>

  </body>
</html>
