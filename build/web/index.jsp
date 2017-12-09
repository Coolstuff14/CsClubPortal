<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
  <head>
    <title>Login</title>

    <link rel="stylesheet" type="text/css" href="login.css"/>
    <link rel="stylesheet" type="text/css" href="homemain.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>
  <body>
    
 
    <%
        String error="";
        error = (String) session.getAttribute("error");
        if (error==null || error=="null"){
            error = "";
        }
        %>
    
          <div id="cont">
            <table id="inside-table">
              <thead>
                <tr>
                  <th><img src="img/logo.png"></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><div id="errortxt"><%=error%></div></td>
                </tr>
                <tr>
                  <td><div class="login">
      <form method="POST" name="login" action="loginAction.jsp">
        <input type="text" placeholder="Username" id="username" name="username">  
        <input type="password" placeholder="Password" id="password" name="password">  
        <a href="#" class="forgot">forgot password?</a>
        <input type="submit" value="Sign In" >
      </form>  
    </div></td>
                </tr>
                <tr>
                  <td><a href="register.jsp">Register</a></td>
                </tr>
              </tbody>
            </table>

             

    
    
                
        </div>
   
   
<%@include file="footer.html"%>

  </body>
</html>
