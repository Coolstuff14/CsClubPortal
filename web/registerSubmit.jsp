<%-- 
    Document   : register
    Created on : Nov 5, 2015, 10:38:40 AM
    Author     : jlee37
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.*"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Submitted!</title>
  </head>
  <body>

    <%
        String name, last, email, phone, pass, onecard, username, sql = "0", ebEdit="0", ebval="0";
        name = request.getParameter("fName");
        last = request.getParameter("lName");
        email = request.getParameter("emailTxt");
        phone = request.getParameter("phoneTxt");
        pass = request.getParameter("passTxt");
        username = request.getParameter("usernameTxt");
        onecard = request.getParameter("onecardTxt");
        ebEdit = request.getParameter("ebEdit");
        ebval = request.getParameter("eboardBit");
        String uID = (String) session.getAttribute("uID");
        
        if (uID==null) {
            sql = "insert into member(fName, lName, email, phone, username, password, onecard)"
                    + "values('" + name + "','" + last + "','" + email + "','" + phone + "','" + username + "','" + pass + "' ,'" + onecard + "')";
        } else {
            if (ebEdit.equals("1")) {
                uID = request.getParameter("member");
                if (pass.equals("")) {
                    sql = "UPDATE member SET fName='" + name + "', lName='" + last + "', email='" + email + "' , phone='" + phone + "', username='" + username + "', onecard='" + onecard + "', eboard='" + ebval + "' WHERE memberID='" + uID + "'";
                } else {
                    sql = "UPDATE member SET fName='" + name + "', lName='" + last + "', email='" + email + "' , phone='" + phone + "', username='" + username + "', password='" + pass + "', onecard='" + onecard + "' , eboard='" + ebval + "' WHERE memberID='" + uID + "'";
                }
            } else {
                sql = "UPDATE member SET fName='" + name + "', lName='" + last + "', email='" + email + "' , phone='" + phone + "', username='" + username + "', password='" + pass + "', onecard='" + onecard + "' , eboard='" + ebval + "' WHERE memberID='" + uID + "'";
            }
        }

        DBConnect dbConnect = new DBConnect();

        String message = dbConnect.updateDB(sql);

        if (message == "true") {
            if (ebEdit.equals("1")) {
                response.sendRedirect("admin.jsp");
            } else {
               response.sendRedirect("index.jsp");
            }
        } else {
            out.println(message);
        }

    %>


    <table>
      <h1>Thanks for registering!</h1>
      <tbody>
        <tr>
          <td>Name</td>
          <td><%= name%></td>
        </tr>
        <tr>
          <td>Last</td>
          <td><%= last%></td>
        </tr>
        <tr>
          <td>Email</td>
          <td><%= email%></td>
        </tr>
        <tr>
          <td>Password</td>
          <td><%= pass%></td>
        </tr>
        <tr>
          <td>Username</td>
          <td><%= username%></td>
        </tr>
        <tr>
          <td>Phone</td>
          <td><%= phone%></td>
        </tr>
        <tr>
          <td>One Card</td>
          <td><%= onecard%></td>
        </tr>
      </tbody>
    </table>
  </body>
</html>
