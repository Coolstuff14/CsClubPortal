<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
  <head>
    <title>Register Account</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="homemain.css"/>
    <link rel="stylesheet" type="text/css" href="register.css"/>
    <script src="register.js" type="text/javascript" ></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>
  <body>
   
    <div id="header">
      <a href="home.jsp"><img src="img/logo.png"></a>
    </div>
    
    <div id="form">
      <form method="POST"  accept-charset="UTF-8" name="register" action="registerSubmit.jsp" onsubmit="return(validateForm());">
      <table>
        <tbody>
            <tr>
            <th colspan="2">Register Account</th>
            </tr>
          <tr>
            <td>First Name</td>
            <td><input type="text" name="fName" value="" /></td>
          </tr>
          <tr>
            <td>Last Name</td>
            <td><input type="text" name="lName" value="" /></td>
          </tr>
          <tr>
            <td>Email</td>
            <td><input type="text" name="emailTxt" value="" /></td>
          </tr>
          <tr>
            <td>*Phone</td>
            <td><input type="text" name="phoneTxt" value="" /></td>
          </tr>
          <tr>
            <td>Username</td>
            <td><input type="text" name="usernameTxt" value="" /></td>
          </tr>
          <tr>
            <td>Password</td>
            <td><input type="password" name="passTxt" value="" /></td>
          </tr>
          <tr>
            <td>Confirm Password</td>
            <td><input type="password" name="confpassTxt" value="" /></td>
          </tr>
          <tr>
            <td>*One Card Unique ID</td>
            <td><input type="text" name="onecardTxt" value="" /></td>
          </tr>
          <tr>
            <td class="center"><input type="reset" value="Reset" name="resetBtn" /></td>
            <td class="center"><input type="submit" value="Submit" name="submitBtn" /></td>
          </tr>

        </tbody>
      </table>
        <input type="hidden" name="ebEdit" value="0">
            <input type="hidden" name="eboardBit" value="0">
  </form>
      <div id="errortxt"></div>
    </div>
    
    
    <%@include file="footer.html"%>
    
    
    
  </body>
</html>
