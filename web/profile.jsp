<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
  <head>
    <title>Edit Profile</title>
    <meta charset="UTF-8">
  <%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.*"%>
    <link rel="stylesheet" type="text/css" href="homemain.css"/>
    <link rel="stylesheet" type="text/css" href="register.css"/>
    <script src="register.js" type="text/javascript" ></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>
  <body>
    
    <%
        String eboard = (String) session.getAttribute("eboard");
        String uID = (String) session.getAttribute("uID");
        String ebEdit = "0";
        String sel = "";
        
              if (eboard.equals("1")){
                  ebEdit = request.getParameter("ebEdit");
                  if (ebEdit==null){
                      ebEdit = "0";
                  }
                  else if (ebEdit.equals("1")){
                       uID = request.getParameter("memberList");
                  }
              }
                 
        String fname="",lname="",email="",phone="",username="",onecard="",ebval="";
        String sql = "select fName, lName, email, phone, username, onecard, eboard from member where memberID='"+uID+"'"; 
        DBConnect dbConnect = new DBConnect();

        String values[] = dbConnect.retrieveRow(sql);
        if (values[0].equals("error")) {
            out.print(values[1]);
            response.sendRedirect("home.jsp");

        } else {
            fname = values[0];
            lname = values[1];
            email = values[2];
            phone = values[3];
            username = values[4];
            onecard = values[5];
            ebval = values[6];
        }
        
        if (ebval.equals("1")){
            sel = "selected";
        }
        
    %>
    
     <script type="text/javascript">
        function eboardBit() {
            if (document.register.ebEdit.value === "1"){
                 document.getElementById("ebb").style.visibility = 'visible';
            }else{
                 document.getElementById("ebb").style.visibility = 'hidden';
            }   
        }
        window.onload = eboardBit;
        </script>
   
    <div id="header">
      <a href="home.jsp"><img src="img/logo.png"></a>
    </div>
    
    <div id="form">
      <form name="register" action="registerSubmit.jsp" onsubmit="return(validateForm());">
      <table>
        <tbody>
            <tr>
            <th colspan="2">Edit Account</th>
            </tr>
          <tr>
            <td>First Name</td>
            <td><input type="text" name="fName" value="<%=fname%>" /></td>
          </tr>
          <tr>
            <td>Last Name</td>
            <td><input type="text" name="lName" value="<%=lname%>" /></td>
          </tr>
          <tr>
            <td>Email</td>
            <td><input type="text" name="emailTxt" value="<%=email%>" /></td>
          </tr>
          <tr>
            <td>*Phone</td>
            <td><input type="text" name="phoneTxt" value="<%=phone%>" /></td>
          </tr>
          <tr>
            <td>Username</td>
            <td><input type="text" name="usernameTxt" value="<%=username%>" /></td>
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
            <td><input type="text" name="onecardTxt" value="<%=onecard%>" /></td>
          </tr>
            <tr id="ebb">
            <td>Eboard Bit</td>
            <td>
              <select name="eboardBit" size="1">
                <option>0</option>
                <option <%=sel%>>1</option>
              </select>
            </td>
          </tr>
          <tr>
            <td class="center"><input type="reset" value="Reset" name="resetBtn" /></td>
            <td class="center"><input type="submit" value="Submit" name="submitBtn" /></td>
          </tr>

        </tbody>
      </table>
                          <input type="hidden" name="ebEdit" value="<%=ebEdit%>">
            <input type="hidden" name="member" value="<%=uID%>">
  </form>
      <div id="errortxt"></div>
    </div>
    
    
   <%@include file="footer.html"%>
    
    
    
  </body>
</html>
