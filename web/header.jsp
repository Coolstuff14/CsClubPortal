<%-- 
    Document   : header
    Created on : Nov 11, 2015, 6:42:08 PM
    Author     : jlee37
--%>




<%
    String uID = (String) session.getAttribute("uID");
    String name = (String) session.getAttribute("name");
   if (uID.equals("null")){
        session.setAttribute("error", "You need to login first silly!");
        response.sendRedirect("index.jsp");
    }
        
%>

<div id="header">
  <a href="home.jsp"><img src="img/logo.png"></a>
  <h3>Welcome <%=name%>!<a href="logout.jsp">Logout</a></h3>
</div>

