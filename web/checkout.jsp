<%-- 
    Document   : checkout
    Created on : Apr 24, 2021, 5:58:51 PM
    Author     : test
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER eq null}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <form action="MainController">
            <div class="container">
                <div class="row">
                    <div class="col-8">
                        <div class="card" style="width: 18rem;">
                            <img src="https://st.quantrimang.com/photos/image/2017/04/08/anh-dai-dien-FB-200.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title" >Total:${sessionScope.TOTAL}</h5>
                                    <input type="date" name="dateship" min="${requestScope.DATEODER}" value=""/>
                                    <p style="color: red">${requestScope.REPORTDATE}</p>
                                    <a href="home.jsp" class="btn btn-primary">Again Cart</a>
                                </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <h1>Thank You</h1>
                        <input type="submit" value="Pay" name="action" />
                    </div>

                </div>
            </div>
        </form>  
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
