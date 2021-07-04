<%-- 
    Document   : index
    Created on : Apr 18, 2021, 2:55:40 PM
    Author     : test
--%>

<%@page import="locdq.daos.ProductDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="locdq.dtos.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="locdq.dtos.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="./index.css" />
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
        <!------------------------------------------------HEADER NAV-------------------------------------------------------------------->
        <nav class="navbar navbar-expand-lg navbar-light bg-dark">
            <img src="img/logo.jpg" alt="" srcset="" class="logo" />
            <button
                class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
                >
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"
                           >Home <span class="sr-only">(current)</span></a
                        >
                    </li>
                    <li class="nav-item">
                        <% UserDTO user = null;
                            user = (UserDTO) session.getAttribute("LOGIN_USER");
                            if (user != null && user.getRoleID() != 0) {
                        %>
                        <a
                            class="nav-link"
                            href="MainController?action=Logout"
                            >                          
                            Logout
                        </a>
                        <%
                        } else {
                        %>
                        <a
                            class="nav-link"
                            href="login.jsp"
                            >Login</a>
                        <%
                            }
                        %>
                    </li>
                    <li class="nav-item">
                        <%
                            if (user != null && user.getRoleID() != 0) {
                        %>
                        <a href="ViewProfileController">Welcome, <%= user.getFullName()%></a>                        
                        <%
                        } else {
                        %>
                        <a
                            class="nav-link"
                            href="signup.jsp"
                            >Sign Up</a>
                        <%
                            }
                        %>
                    </li>
                </ul>
                    <!----------------------SEARCH-------------------------------------->
                <form class="form-inline my-2 my-lg-0">
                    <input
                        class="form-control mr-sm-2"
                        type="search"
                        placeholder="Search"
                        aria-label="Search"
                        value=""
                        name="SearchHome"
                        />
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                        Search
                    </button>
                </form>
                    <!--------------------------BUTTON CARD--------------------------------->

                <div style="margin: 0px 50px">                    
                    <a href="MainController?action=cart">
                        <i class="fas fa-shopping-cart"> CART                          
                        </i>
                    </a>
                </div>
            </div>
        </nav>
        <!-----------------------------------CAROUSEL-------------------------------------------------------------------------------->

        <div id="carouselId" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselId" data-slide-to="0" class="active"></li>
                <li data-target="#carouselId" data-slide-to="1"></li>
                <li data-target="#carouselId" data-slide-to="2"></li>
            </ol>
            <!------------------------PICTURE------------------->
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active">
                    <div class="carousel-content1"></div>
                </div>
                <div class="carousel-item">
                    <div class="carousel-content2" >
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="carousel-content3" >
                    </div>
                </div>
            </div>
            <!--------------------------------------------------->
            <a
                class="carousel-control-prev"
                href="#carouselId"
                role="button"
                data-slide="prev"
                >
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a
                class="carousel-control-next"
                href="#carouselId"
                role="button"
                data-slide="next"
                >
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!---------------------------------------LIST PRODUCT-------------------------------------------------------------------------------------->  
        <%    
            String SearchHome=request.getParameter("SearchHome");
            String temp;
            if (SearchHome==null){
                temp="";
            }else{
                temp=SearchHome;
            }
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> listpro = dao.getlistproduct(temp);
            if (!listpro.isEmpty()) {
            
        %>
        <div class="container">
            <div class="row">
                <% for (ProductDTO pro : listpro) { %>
                <div class="col-3">
                    <div class="card">
                        <form action="MainController">                        
                        <img class="card-img-top" src="<%= pro.getImg()%>" alt="" style="width: 100%; height: 200px"/>
                        <input type="hidden" name="img" value="<%= pro.getImg()%>" />
                        <div class="card-body">
                            <h4 class="card-title">Description: <%= pro.getProductName()%></h4>
                            <input type="hidden" name="productName" value="<%= pro.getProductName()%>" />                            
                            <p class="card-text">Price: <%= pro.getPrice()%> $</p>
                            <input type="hidden" name="price" value="<%= pro.getPrice()%>" />
                            <button name="action" value="addCart" type="submit" class="btn btn-success"  ${item.quanlity le 0 ? "disabled" : "dsa"}>
                                Add To Cart
                            </button>
                                <input type="hidden" name="productID" value="<%= pro.getProductID() %>" />
                        </div>
                        </form>
                    </div>
                </div>
                                <% }%>
            </div>
        </div>
        <%
            }
        %>
        <!-------------------------------FOOTER------------------------------------------------------------------------------------------------>
        <footer class="bg-dark">
            <div class="container">
                <div class="row">
                    <div class="col-4">
                        <p class="title">CUSTOMER SERVICE</p>
                        <ul>
                            <li class="content">Help & Contact Us</li>
                            <li>Returns & Refunds</li>
                            <li>Online Stores</li>
                        </ul>
                    </div>
                    <div class="col-4">
                        <p class="title">COMPANY</p>
                        <ul>
                            <li>What We Do</li>
                            <li>Available Services</li>
                            <li>Latest Posts</li>
                        </ul>
                    </div>
                    <div class="col-4">
                        <p class="title">PROFILE</p>
                        <ul>
                            <li>Twitter</li>
                            <li>Instagram</li>
                            <li>Tumblr</li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
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
