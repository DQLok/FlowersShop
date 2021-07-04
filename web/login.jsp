<%-- 
    Document   : login
    Created on : Apr 18, 2021, 1:43:31 PM
    Author     : test
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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
        <nav class="navbar navbar-expand-lg navbar-light bg-dark"><h1 style="color: white">Welcome Page</h1></nav>
            <form action="MainController" method="POST">
                UserID: <input type="text" name="userID" value="" required=""/>
                Password: <input type="password" name="password" value="" required=""/>
                <input type="submit" value="Login" name="action" />
                <input type="reset" value="Reset" />
                <a href="home.jsp">Again</a>
            </form>
                <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/FlowersShopAss/loginGoogle&response_type=code
                &client_id=490105296697-m7tkamevm7sk0g2hvu78j6oc4eampiv0.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>  
    </body>
</html>
