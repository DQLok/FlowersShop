/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package locdq.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import locdq.daos.OrderDAO;
import locdq.daos.ProductDAO;
import locdq.dtos.CartDTO;
import locdq.dtos.OrderDTO;
import locdq.dtos.ProductDTO;
import locdq.dtos.UserDTO;

/**
 *
 * @author test
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    private static final String ERROR = "checkout.jsp";
    private static final String SUCCESS = "ViewProfileController";

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
            //-------------
            String dateship = request.getParameter("dateship");
            //--------SetMindate
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            request.setAttribute("DATEODER", dtf.format(now));

            HttpSession session = request.getSession();
            //-------------
            if (dateship == null || dateship.isEmpty()) {
                //-------dateship don't exsit
                request.setAttribute("REPORTDATE", "We need date ship for you");
                url = ERROR;
            } else {//-------dataship added
                
                //----------insertOrder ----------------------------------               
                OrderDAO dao = new OrderDAO();
                UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
                Date dateSQL = Date.valueOf(dateship);// chuyen dateship sang SQL
                boolean isPay = true;
                float total = (float) session.getAttribute("TOTAL");
                //-------Add SQL
                boolean check = dao.addorder(dateSQL, total, isPay, user.getUserID());

                //-----insertOderDetails-----------------------------
                int orderID = dao.getorderid(dateSQL, total, isPay, user.getUserID());

                CartDTO cart = (CartDTO) session.getAttribute("CART");
                for (ProductDTO pro : cart.getCart().values()) {// lay product in Cart
                    int number = pro.getNumber();
                    String productID = pro.getProductID();
                    if (dao.getproidOD(productID)) {
                        //update quanOD in OD
                        int up = dao.getquantityOD(productID) + number;
                        dao.updateOD(up, productID);

                        //dow quan in PRO
                        ProductDAO daopro = new ProductDAO();
                        int dow = daopro.getquantity(productID) - number;
                        if (dow < 0) {//quan <0 delete pro
                            daopro.delete(productID);
                        } else {// set quan in pro
                            daopro.updatequantity(dow, productID);
                        }
                    } else {
                        //add vao OD
                        dao.addOD(number, productID, orderID);

                        //dow quan in PRO
                        ProductDAO daopro = new ProductDAO();
                        int dow = daopro.getquantity(productID) - number;
                        if (dow < 0) {//quan <0 delete pro
                            daopro.delete(productID);
                        } else {// set quan in pro
                            daopro.updatequantity(dow, productID);
                        }
                    }
                }

                //----------------------PAY SUCCESS------------
                if (check) {
                    List<OrderDTO> list = dao.getOrder(user.getUserID());
                    session.setAttribute("ORDER_USER", list);
                    url = SUCCESS;
                }

            }

        } catch (Exception e) {

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
