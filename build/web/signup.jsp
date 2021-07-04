<%-- 
    Document   : signup
    Created on : Apr 18, 2021, 3:17:01 PM
    Author     : test
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <!-- Bootstrap CSS -->
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="
              <link
              rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
              integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
              crossorigin="anonymous"
              />
    </head>
    <body>        
        <nav class="navbar navbar-expand-lg navbar-light bg-dark"> <h1 style="color: white">Sign Up</h1></nav>
        <c:set var="UserError" value="${ERROR_USER}" scope="request"/>
        <form action="MainController" method="POST">
            UserID:   <input type="text" name="userID" value="" required=""/><br/>
            ${UserError.userErrorID}<br/>
            Fullname: <input type="text" name="fullName" value="" required=""/><br/>
            ${UserError.fullErrorName}<br/>
            Phone:    <input type="text" name="phone" value="" required=""/><br/>
            ${UserError.phoneError}<br/>
            Address:  <input type="text" name="address" value="" required=""/><br/>
            ${UserError.addressError}<br/>
            Password: <input type="password" name="password" value="" required=""/><br/>
            ${UserError.passwordError}<br/>
            Confirm:  <input type="password" name="confirm" value="" required=""/><br/>
            ${UserError.confirm}<br/>
            RoleID:   <input type="text" name="roleID" value="" required=""/><br/>
            ${UserError.roleIDError}<br/>
            <input type="submit" value="Insert" name="action" />
            <input type="reset" value="Reset" />
            <a href="home.jsp">Again</a>
        </form>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script
            src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
