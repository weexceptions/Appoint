<%-- 
    Document   : left3
    Created on : May 31, 2017, 2:49:01 PM
    Author     : Priyanka WorkSpace
--%>


<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.pro.model.Appointment"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.pro.dao.DBconnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LEFT Page 3</title>
        
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

        <div  id="heading" class="container-fluid">
            <h1><center>
                    Doctor's appointment</center></h1>
        </div>
        <div class="container-fluid" >
            <marquee  direction="up" width="100%" height="800" scrollamount="5" loop="true" onmouseover="this.stop()" onmouseout="this.start()">
        <div class="col-lg-12 col-sm-12" >
         <table class="table-condensed table-hover" border="0">
            <th class="col-lg-1">P_ID</th>
            <th class="col-lg-1">DATE</th>
            <th class="col-lg-1">TIME</th>
            <%System.out.print("user is in left "+request.getAttribute("a"));%>
            
        <%
            Connection con = null;
            PreparedStatement ps = null;
            try
            {
            con = DBconnection.getConnection();
            String id=request.getAttribute("a").toString();//equest.getParameter("auser");
            System.out.println("User id in left viewappointment is "+id);
            String sql = "SELECT A_ID,P_ID,D_ID,DESCRIPTION,A_DATE,A_TIME,LOCATION,STATUS FROM APPOINTMENT WHERE D_ID = '"+id.toLowerCase()+"' ORDER BY A_DATE,A_TIME";
            
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery(); 
            String aid,pid,did,desc,adate,atime,loc,status;
            %>
            <tr>
            <%
            while(rs.next())
            {
                String dr=rs.getString(3);
                if (dr.equals(id)) {
             aid=rs.getString(1);
             pid=rs.getString(2);
             did=rs.getString(3);
             desc=rs.getString(4);
             adate=rs.getString(5);
             atime=rs.getString(6);
             loc=rs.getString(7);
             status=rs.getString(8);
            %>
            
            <td class="col-lg-1"><%out.println(pid);%> </td>
            <td class="col-lg-1"><%out.println(adate);%> </td>
            <td class="col-lg-1"><%out.println(atime);%> </td>
            
            <td class="col-lg-1"> <form action="viewuser.do" method="post" target="ContentFrame" class="form" id="fileForm" role="form">
                    <input type="hidden" value="<%out.println(pid);%>" name="txtuid" />  
                    <input type="hidden" value="noedit" name="edit" />
                    <button type="submit" class="btn btn-info">View</button>
                </form>
            </td>
            </tr>
            <%
            }
            }
            %>
        </table>
            <%
            }
            catch(SQLException sqe)
            { 
            out.println(sqe);
            }
            %>
        </div>
        
    </marquee>
            </div>
    </body>
</html>
