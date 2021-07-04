/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package locdq.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author test
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String HOME = "home.jsp";

    private static final String LOGIN = "LoginController";
    private static final String LOGOUT = "LogoutController";
    private static final String SEARCHUSER = "SearchUserController";
    private static final String DELETE = "DeleteUserController";
    private static final String UPDATE = "UpdateUserController";
    private static final String INSERT = "InsertUserController";

    private static final String SEARCHPRODUCT = "SearchProductController";
    private static final String DELETEPRODUCT = "DeleteProductController";
    private static final String EDIT = "EditProductController";
    private static final String INSERTPRO = "InsertProductController";

    private static final String ADDTOCART = "AddToCartController";
    private static final String CART = "cart.jsp";
    private static final String REMOVE = "RemoveController";
    private static final String EDITCART = "EditCartController";

    private static final String CHECKOUT = "CheckoutController";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = HOME;
            } else if ("Login".equals(action)) {
                url = LOGIN;
            } else if ("Logout".equals(action)) {
                url = LOGOUT;
            } else if ("SearchUser".equals(action)) {
                url = SEARCHUSER;
            } else if ("Delete".equals(action)) {
                url = DELETE;
            } else if ("Update".equals(action)) {
                url = UPDATE;
            } else if ("SearchProduct".equals(action)) {
                url = SEARCHPRODUCT;
            } else if ("DeleteProduct".equals(action)) {
                url = DELETEPRODUCT;
            } else if ("Edit".equals(action)) {
                url = EDIT;
            } else if ("InsertProduct".equals(action)) {
                url=INSERTPRO;
            } else if ("Insert".equals(action)) {
                url = INSERT;
            } else if ("addCart".equals(action)) {
                url = ADDTOCART;
            } else if ("cart".equals(action)) {
                url = CART;
            } else if ("Remove".equals(action)) {
                url = REMOVE;
            } else if ("Change".equals(action)) {
                url = EDITCART;
            } else if ("Checkout".equals(action) || "Pay".equals(action)) {
                url = CHECKOUT;
            }
        } catch (Exception e) {
            log("Error MainController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
