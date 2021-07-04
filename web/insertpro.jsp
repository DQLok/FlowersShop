<%-- 
    Document   : insertpro
    Created on : Apr 26, 2021, 9:04:16 AM
    Author     : test
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Product Page</title>
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
            />
    </head>
    <body>
         <c:if test="${ sessionScope.LOGIN_ADMIN.getRoleID() ne '0'}">
            <c:redirect url="home.jsp"></c:redirect>
        </c:if>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <h1 style="color: while "> Welcome Admin,${sessionScope.LOGIN_ADMIN.fullName}</h1>            
        </nav>
            <c:set var="proE" value="${requestScope.ERROR_PRODUCT}"/>
        <form action="MainController">
            ProductID:   <input type="text" name="productID" value="" required=""/><br/>
            ${proE.productIDError}<br/>
            ProductName: <input type="text" name="productName" value="" required=""/><br/>
            ${proE.productNameError}<br/>
            Quantity: <input type="text" name="quantity" value="" required=""/><br/>
            ${proE.quantityError}<br/>
            Price: <input type="text" name="price" value="" required=""/><br/>
            ${proE.priceError}<br/>
            Img: <input type="text" name="img" value="" /><br/>
            Img is link image!!! you can insert or don't insert<br/>
            CategoryID:  <input type="text" name="categoryID" value="" required=""/><br/>
            ${proE.categoryIDError}<br/>
            <input type="submit" value="InsertProduct" name="action" />
            <input type="reset" value="Reset" />
            <a href="admin.jsp?product=on">Again Admin Page</a>
        </form>
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
