<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
  <head>
    <title>Home</title>
    <%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.*"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="homemenu.css"/>
    <link rel="stylesheet" type="text/css" href="homemain.css"/>
  </head>
  <body>

    <%@include file="header.jsp"%>

    <div id="menu_wraper">
      <div id="cssmenu">

        <ul>
          <li><a href="home.jsp">Home</a></li>
          <li><a href="profile.jsp">Profile</a></li>
          <li><a href="#">Files</a></li>
          <li><a href="#">Webpage</a></li>

          <%
              String eboard = (String) session.getAttribute("eboard");
              if (eboard.equals("1")) {
          %>
          <%@include file="eboardMenu.jsp"%>
          <%
              }
          %>



        </ul>
      </div>
    </div>

    <div id="cont">

      <p>Perpetual sincerity out suspected necessary one but provision satisfied. Respect nothing use set waiting pursuit nay you looking. If on prevailed concluded ye abilities. Address say you new but minuter greater. Do denied agreed in innate. Can and middletons thoroughly themselves him. Tolerably sportsmen belonging in september no am immediate newspaper. Theirs expect dinner it pretty indeed having no of. Principle september she conveying did eat may extensive. 

        Doubtful two bed way pleasure confined followed. Shew up ye away no eyes life or were this. Perfectly did suspicion daughters but his intention. Started on society an brought it explain. Position two saw greatest stronger old. Pianoforte if at simplicity do estimating. 

        Folly was these three and songs arose whose. Of in vicinity contempt together in possible branched. Assured company hastily looking garrets in oh. Most have love my gone to this so. Discovered interested prosperous the our affronting insipidity day. Missed lovers way one vanity wishes nay but. Use shy seemed within twenty wished old few regret passed. Absolute one hastened mrs any sensible. 

        Little afraid its eat looked now. Very ye lady girl them good me make. It hardly cousin me always. An shortly village is raising we shewing replied. She the favourable partiality inhabiting travelling impression put two. His six are entreaties instrument acceptance unsatiable her. Amongst as or on herself chapter entered carried no. Sold old ten are quit lose deal his sent. You correct how sex several far distant believe journey parties. We shyness enquire uncivil affixed it carried to. 

        Now for manners use has company believe parlors. Least nor party who wrote while did. Excuse formed as is agreed admire so on result parish. Put use set uncommonly announcing and travelling. Allowance sweetness direction to as necessary. Principle oh explained excellent do my suspected conveying in. Excellent you did therefore perfectly supposing described. 

        Cause dried no solid no an small so still widen. Ten weather evident smiling bed against she examine its. Rendered far opinions two yet moderate sex striking. Sufficient motionless compliment by stimulated assistance at. Convinced resolving extensive agreeable in it on as remainder. Cordially say affection met who propriety him. Are man she towards private weather pleased. In more part he lose need so want rank no. At bringing or he sensible pleasure. Prevent he parlors do waiting be females an message society. 

        Society excited by cottage private an it esteems. Fully begin on by wound an. Girl rich in do up or both. At declared in as rejoiced of together. He impression collecting delightful unpleasant by prosperous as on. End too talent she object mrs wanted remove giving. </p>

    </div>



     <%@include file="footer.html"%>


  </body>
</html>
