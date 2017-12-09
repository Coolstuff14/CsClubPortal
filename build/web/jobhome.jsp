
<html>
  <head>
    <%@page contentType="text/html;charset=UTF-8" language="java" import="myBeans.*" import="java.util.ArrayList" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="jobmenu.css">
    <link rel="stylesheet" href="newtable.css">
    <link rel="stylesheet" type="text/css" href="homemain.css">
    <title>CSC Job Portal</title>
  </head>
  <body>

    <script>
        jQuery(document).ready(function ($) {
          $(".clickable-row").click(function () {
              //var iBean = $(this).data("bean");
              //
              
        $('td', this).slice(0,1).each(function() {

                
                var id = $(this).text();
                //alert(id);
                $('input[name=jobID]').val(id);
               
                });


              $("#editForm").submit();
          });
        });
    </script>

    <%@include file="header.jsp"%>


    <div class="main_menu">
        <ul>
          <li><a href="home.jsp">Home</a></li>
          <li><a href="job.jsp">New Job</a></li>
        </ul>
    </div>

    <div id="cont">
      
      <form id="editForm" action="job.jsp" method="POST">
        <input type="hidden" name="jobID" value="">
        <input type="hidden" name="editFlag" value="1">
      </form>
      
      <table class="zui-table zui-table-highlight-all">
        <thead>
          <tr>
            <th>Job ID</th>
            <th>Date Created</th>
            <th>Title</th>
            <th>Urgency</th>
            <th>Status</th>
            <th>Responsible Member</th>
          </tr>
        </thead>
        <tbody>

          <%              
              
               DBConnect dbConnect = new DBConnect();
              ArrayList<JobBean> list = (ArrayList<JobBean>) dbConnect.getJobList();
              for (JobBean bean : list) { 
              
          %>
          <tr class="clickable-row" data-bean="<%=bean%>">
            <td><%=bean.getJobID()%></td>
            <td><%=bean.getDate()%></td>
            <td><%=bean.getTitle()%></td>
            <td><%=bean.getUrgency()%></td>
            <td><%=bean.getStatus()%></td>
            <td><%=bean.getMemberName()%></td>
          </tr>
          <%
              }
          %>

        </tbody>
      </table>
    
    </div>   


    <%@include file="footer.html"%>

  </body>
</html>