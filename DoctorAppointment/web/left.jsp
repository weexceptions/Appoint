<%-- 
    Document   : left
    Created on : May 8, 2017, 12:59:25 PM
    Author     : Akshay
--%>

<%@page import="com.pro.model.DoctorInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.controller.*;"%>
<%@page import="com.pro.dao.*;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LEFT Page</title>
        
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/homestylesheet.css">
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/login.js"></script>
        <style>
            #heading
            {
                background-color: black;
                font-family:cursive;
                color: white;
                
            }
            
        </style>
    </head>
    <body  style="background-color:moccasin">
              <div class="container" >
            <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-4 well well-sm">
            <legend><i class="glyphicon glyphicon-user"></i>User Log In</legend>

<center> <a class="text-primary" href="signup.jsp"  target="ContentFrame" >Register</a>. <a href="forget.jsp"  target="ContentFrame">Forget Password</a></center>
        
<center><a target="ContentFrame" href="login.jsp"><button type="button"  class="btn btn-primary">LogIn</button></a></center>
        </div></div></div>
        <div  id="heading" class="container-fluid">
            <h1><center>
                    List of Doctors:</center>
        </h1></div>
        <div class="container-fluid" >
            <marquee  direction="up" width="100%" height="600" scrollamount="5" loop="true" onmouseover="this.stop()" onmouseout="this.start()">
        <div class="col-lg-12 col-sm-12" ><h4>
            
            <%
                UserDAO doctorDAO = new DaoImpl();
                List<DoctorInfo> doctorList = doctorDAO.getAllDrDetails();
                Iterator doctorItr = doctorList.iterator();
                while(doctorItr.hasNext())
                {
                    DoctorInfo product = (DoctorInfo)doctorItr.next();
            %>
            <div class="text-justify" >
                <center>
            <%out.print("Dr.");%>
            <%=product.getFname().toUpperCase()%> 
            <%=product.getLname().toUpperCase()%> <br/>
            <%out.print("From:");%>
            <%=product.getLocation().toUpperCase()%> <br/>
            <%out.print("Specialist:");%>
            <%=product.getSpecialist().toUpperCase()%> <br/><br/><br/>
            <%}%></center>
            </div></h4>
        </div>
    </marquee>
            </div>
    </body>
</html>
