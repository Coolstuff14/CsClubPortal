<%-- 
    Document   : loginAction
    Created on : Oct 29, 2015, 10:44:05 AM
    Author     : nmahadev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.*"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Action</title>
  </head>
  <body>
    <%
        String user = request.getParameter("username");
        String pwd = request.getParameter("password");
        /*      if (pwd.contains("'")) {
         response.sendRedirect("index.jsp");
         } else {*/
        String sql = "select memberID, fName, eboard, username, password from member where "
                + "username = '" + user + "' and password = '" + pwd + "'";
        DBConnect dbConnect = new DBConnect();
        //out.print(dbConnect.validatePwd(sql));
        String data[] = dbConnect.validatePwd(sql, user, pwd);
        if (data[0].equals("error")) {
            session.setAttribute("uID", "null");
            session.setAttribute("error", "Incorect Username or Password");
            response.sendRedirect("index.jsp");

        } else {
            session.setAttribute("uID", data[0]);
            session.setAttribute("name", data[1]);
           session.setAttribute("eboard", data[2]);
            response.sendRedirect("home.jsp");
        }
        //}
    %>

  </body>
</html>
