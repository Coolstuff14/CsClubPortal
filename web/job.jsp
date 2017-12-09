
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
  <head>
    <title>CSC Job</title>
    <%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.*"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="jobmain.css"/>
    <link rel="stylesheet" type="text/css" href="jobmenu.css"/>
    <link rel="stylesheet" type="text/css" href="homemain.css"/>
    <script src="jobmain.js" type="text/javascript" ></script>
  </head>
  <body>

    <%@include file="header.jsp"%>

    <%        
        String sql = "", email = "", dateC = "", jobID = "", editFlag = "0", title = "", desc = "", prog = "", member = "", status = "", urgency = "", submitBy = "";
        String newSt = "", progSt = "", cloSt = "", edt = "", normChk = "", urgChk = "", allOpt="";
        DBConnect dbConnect = new DBConnect();

        editFlag = request.getParameter("editFlag");

        if (editFlag == null) {
            editFlag = "0";
            sql = "SELECT email FROM member WHERE memberID='" + uID + "'";
            email = dbConnect.getValue(sql);
            edt = "none";
        } else {
            if (editFlag.equals("1")) {
                edt = "table-row";
                jobID = request.getParameter("jobID");
                session.setAttribute("jobID", jobID);
                sql = "SELECT dateCreated, submitBy, title, description, progress, memberName, status, urgency FROM job where jobID='" + jobID + "'";

                String values[] = dbConnect.retrieveRowJob(sql);
                if (values[0].equals("error")) {
                    out.print(values[1]);
                    response.sendRedirect("jobhome.jsp");

                } else {
                    dateC = values[0];
                    submitBy = values[1];
                    title = values[2];
                    desc = values[3];
                    prog = values[4];
                    member = values[5];
                    status = values[6];
                    urgency = values[7];

                    if (status.equals("New")) {
                        newSt = "selected";
                    } else if (status.equals("In Progress")) {
                        progSt = "selected";
                    } else if (status.equals("Closed")) {
                        cloSt = "selected";
                    }

                    email = dbConnect.getValue("SELECT email FROM member WHERE memberID='" + submitBy + "'");
                    submitBy = dbConnect.getValue("SELECT fName FROM member WHERE memberID='" + submitBy + "'");

                    if (urgency.equals("Normal")) {
                        normChk = "checked";
                    } else if (urgency.equals("Urgent")) {
                        urgChk = "checked";
                    }
                    
                    if (member.equals("All")){
                        allOpt = "selected";
                    }
                            
                }
            }
        }


    %>


    <div class="main_menu">
      <nav class="menu_cont">
        <ul>
          <li><a href="jobhome.jsp">Home</a></li>
          <li style="display:<%=edt%>;"><a href="deleteJob.jsp">Delete</a></li>
        </ul>
      </nav>
    </div>

    <div class="cont">
      <form method="POST" name="job" action="jobSubmit.jsp" onsubmit="return(validateForm());" >
        <table>
          <tbody>
            <tr style="display:<%=edt%>;">
              <td>Date Created: <%=dateC%></td>
              <td>Job <%=jobID%></td>
            </tr>
            <tr>
              <td>Status</td>
              <td><select name="statusList">
                  <option <%=newSt%>>New</option>
                  <option <%=progSt%>>In Progress</option>
                  <option <%=cloSt%>>Closed</option>
                </select></td>
            </tr>
            <tr>
              <td>Title</td>
              <td><input type="text" name="titleTxt" value="<%=title%>" size="50"/></td>
            </tr>
            <tr style="display:<%=edt%>;">
              <td>Submitted By: </td>
              <td><%=submitBy%></td>
            </tr>
            <tr>
              <td>Description</td>
              <td><textarea name="descTxt" rows="10" cols="75"><%=desc%></textarea></td>
            </tr>
            <tr>
              <td>Progress</td>
              <td><textarea name="progTxt" rows="10" cols="75" ><%=prog%></textarea></td>
            </tr>
            <tr>
              <td>Email</td>
              <td><input type="text" name="emailTxt" value="<%=email%>" size="50" /></td>
            </tr>
            <tr>
              <td>Responsible Member</td>
              <td><select name="membList" >
                  <option <%=allOpt%>>All</option> 
                  <% 
                    sql = "SELECT fName FROM member WHERE eboard=1";
                     String message = dbConnect.dropdown2(sql,member);
                     out.println(message + "<br>");
                  %>
                </select></td>
            </tr>
            <tr>
              <td>Normal&nbsp<input type="radio" name="urgencyRb" value="Normal" <%=normChk%>/>&nbspUrgent&nbsp<input type="radio" name="urgencyRb" value="Urgent" <%=urgChk%> />&nbsp</td>
              <!--<td>Archive <input type="checkbox" name="archiveChk" value="ON" /></td>-->
            </tr>
            <tr>
              <td><input type="submit" value="Submit" name="submitBtn" /></td>
              <td><input type="reset" value="Reset" name="resetBtn" /></td>
            </tr>
          </tbody>
        </table>
              <input type="hidden" name="editFlag" value="<%=editFlag%>">
              <input type="hidden" name="jobID" value="<%=jobID%>">
      </form>
      <div id="errortxt"></div>
    </div>


    <%@include file="footer.html"%>
  </body>
</html>
