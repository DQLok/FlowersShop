<%-- 
    Document   : cart.jsp
    Created on : Apr 22, 2021, 2:10:20 PM
    Author     : test
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="locdq.dtos.ProductDTO"%>
<%@page import="java.util.Map"%>
<%@page import="locdq.dtos.CartDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER eq null}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <div class="container">
            <form action="MainController">
                <div class="row">
                    <div class="col-8">
                        <%
                            CartDTO cart = (CartDTO) session.getAttribute("CART");
                            if (cart != null) {
                        %>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Name</th>
                                    <th>Img</th>
                                    <th>Price</th>
                                    <th>Number</th>
                                    <th>Total</th>
                                    <th>Delete</th>
                                    <th>Edit</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int count = 0;
                                    float total = 0;
                                    for (ProductDTO pro : cart.getCart().values()) {
                                        total += pro.getNumber() * pro.getPrice();
                                %>
                            <form action="MainController">                        
                                <tr>                                
                                    <td><%= ++count%></td>
                                    <td><%= pro.getProductName()%></td>
                                    <td>
                                        <img src="<%= pro.getImg()%>" style="width: 50%; height: 200px"/>
                                    </td>
                                    <td><%= pro.getPrice()%></td>
                                    <td>
                                        <input type="number" name="numbers" value="<%= pro.getNumber()%>" />
                                    </td>
                                    <td><%= pro.getPrice() * pro.getNumber()%></td> 
                                    <td>
                                        <a href="MainController?action=Remove&productID=<%= pro.getProductID()%>">remove</a>
                                    </td>
                                    <td>
                                        <input type="submit" value="Change" name="action" />
                                        <input type="hidden" name="productID" value="<%= pro.getProductID()%>" />
                                    </td>
                                </tr>
                            </form>
                            <%
                                }
                            %>
                            </tbody>
                        </table>                   
                    </div>

                    <div class="col-4">
                        <h3>Cart Summary</h3>
                        <p>Total Sum: <%= total%> </p>
                        <%
                            session.setAttribute("TOTAL", total);
                        %>
                        <button type="submit" class="btn btn-primary px-4" name="action" value="Checkout">Checkout</button><br/>
                        <a href="home.jsp">Add more</a>
                    </div>
            </form>


        </div>
        <%
        } else {
        %>
        <h3>Your Cart is empty!!! please choose product!!! <a href="home.jsp">Again Home</a></h3>
        <%
            }
        %>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
