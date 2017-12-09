<%-- 
    Document   : admin
    Created on : Nov 11, 2015, 6:38:50 PM
    Author     : jlee37
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.*"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="homemenu.css"/>
    <link rel="stylesheet" type="text/css" href="homemain.css"/>
    <link rel="stylesheet" type="text/css" href="admin.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Page</title>
  </head>
  <body>

    <%@include file="header.jsp"%>

    <div id="cont_table">
      <form name="buttons" action="profile.jsp" >
        <table>
          <thead>
            <tr>
              <th colspan="2">Admin Settings</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <select name="memberList">
                  <%      
                    //memberID hidden value email visible 
                    String sql = "select memberID, email from member";
                    DBConnect dbConnect = new DBConnect();
                    String message = dbConnect.dropdown(sql);
                    out.println(message + "<br>");
                  %>
                </select>
              </td>
              <td>
                 <input type="hidden" name="ebEdit" value="1">
                <input type="submit" value="Edit Account" />
              </td>

            </tr>
            <tr>
              <td></td>
              <td></td>
            </tr>
          </tbody>
        </table>
      </form>

    </div>

    <%@include file="footer.html"%>

  </body>
</html>
