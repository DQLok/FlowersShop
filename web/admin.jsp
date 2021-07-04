<%-- 
    Document   : admin
    Created on : Apr 18, 2021, 2:20:07 PM
    Author     : test
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="locdq.dtos.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="locdq.dtos.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <!-- Bootstrap CSS -->
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
        <% UserDTO user = (UserDTO) session.getAttribute("LOGIN_ADMIN");
            if (user != null) {
        %>
        <h1>Welcome Admin, <%= user.getFullName()%></h1>
        <a href="MainController?action=Logout">Logout</a>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="SearchUserController">Admin</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="SearchUserController?product=on">Product <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-4">
                    <div class="card">
                        <img class="card-img-top" src="https://st.quantrimang.com/photos/image/2017/04/08/anh-dai-dien-FB-200.jpg" alt="">
                        <div class="card-body">
                            <h4 class="card-title">Name:<%= user.getFullName()%> </h4>
                            <p class="card-text">Phone: <%= user.getPhone()%></p>
                            <p class="card-text">Address: <%= user.getAddress()%> </p>
                            <p class="card-text">RoleID: <%= user.getRoleID()%> </p>
                        </div>
                    </div>
                </div>                        
                <div class="col-8">
                    <!------------------------------Search Products------------------>
                    <%
                        String product = request.getParameter("product");
                        if (product != null && product.equals("on")) {
                    %>
                    <h1>List Product</h1>
                    <form action="MainController">
                        Search Product: <input type="text" name="SearchProducts" value="<%= request.getParameter("SearchProducts") != null ? request.getParameter("SearchProducts") : ""%>" />
                        <input type="submit" value="SearchProduct" name="action" />
                    </form>
                        <a href="insertpro.jsp">Insert Product</a>
                    <%
                        List<ProductDTO> listpr = (List<ProductDTO>) session.getAttribute("LIST_PRODUCT");
                        if (listpr != null) {
                    %>
                    <table class="table" >
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>ProductID</th>
                                <th>ProductName</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Img</th>
                                <th>CategoryID</th>
                                <th>Delete</th>
                                <th>Update</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% int countpr = 0;
                                for (ProductDTO p : listpr) {
                            %>
                            <tr>
                        <form action="MainController">
                            <td><%= countpr++%></td>
                            <td>
                                <%= p.getProductID()%>
                                <input type="hidden" name="productID" value="<%= p.getProductID()%>" />
                            </td>
                            <td><%= p.getProductName()%></td>
                            <td>
                                <input type="text" name="quantity" value="<%= p.getQuantity()%>" />
                            </td>
                            <td>
                                <input type="text" name="price" value="<%= p.getPrice()%>" />
                            </td>
                            <td>
                                <input type="text" name="img" value="<%= p.getImg()%>" />
                            </td>
                            <td><%= p.getCategoryID()%></td>
                            <td>
                                <a href="MainController?action=DeleteProduct&SearchProducts=<%= request.getParameter("SearchProducts")%>&productID=<%= p.getProductID()%>">delete</a>
                            </td>
                            <td>
                                <input type="hidden" name="SearchProducts" value="<%= request.getParameter("SearchProducts")%>" />
                                <input type="submit" value="Edit" name="action" />
                            </td>
                        </form>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                    <%
                        }

                    } else {
                    %>
                    <!----------------------Search USers---------------------->
                    <h1>List User</h1>
                    <form action="MainController">
                        Search User: <input type="text" name="SearchUsers" value="<%= request.getParameter("SearchUsers") != null ? request.getParameter("SearchUsers") : ""%>" />
                        <input type="submit" value="SearchUser" name="action" />
                    </form>
                    <h4>${sessionScope.REPORT}</h4>
                    <%
                        List<UserDTO> list = (List<UserDTO>) session.getAttribute("LIST_USER");
                        if (list != null) {
                    %> 
                    <table class="table">              
                        <thead>               
                            <tr>
                                <th>No.</th>
                                <th>UserID</th>
                                <th>Fullname</th>
                                <th>Password</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>RoleID</th>
                                <th>Delete</th>
                                <th>Update</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  int count = 0;
                                for (UserDTO u : list) {
                            %>

                            <tr>
                        <form action="MainController">

                            <td><%= count++%></td>
                            <td><%= u.getUserID()%> 
                                <input type="hidden" name="userID" value="<%= u.getUserID()%>" />
                            </td>
                            <td>                                
                                <input type="text" name="fullName" value="<%= u.getFullName()%>" />
                            </td>       
                            <td>
                                <input type="text" name="password" value="<%= u.getPassword()%>" />
                            </td>
                            <td>
                                <input type="text" name="phone" value="<%= u.getPhone()%>" />
                            </td>
                            <td>
                                <input type="text" name="address" value="<%= u.getAddress()%>" />
                            </td>
                            <td>
                                <input type="text" name="roleID" value="<%= u.getRoleID()%>" />
                            </td>
                            <td>
                                <a href="MainController?action=Delete&SearchUsers=<%= request.getParameter("SearchUsers")%>&userID=<%= u.getUserID()%>">delete</a>
                            </td>
                            <td>
                                <input type="submit" value="Update" name="action" />
                                <input type="hidden" name="SearchUsers" value="<%= request.getParameter("SearchUsers")%>" />
                            </td>
                        </form>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>            
                    </table>
                    <%
                            }

                        }
                    %> 
                </div>
            </div>
        </div>
        <%}%>
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
