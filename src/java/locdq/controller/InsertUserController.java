/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package locdq.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import locdq.daos.UserDAO;
import locdq.dtos.UserDTO;
import locdq.dtos.UserErrorDTO;

/**
 *
 * @author test
 */
@WebServlet(name = "InsertUserController", urlPatterns = {"/InsertUserController"})
public class InsertUserController extends HttpServlet {

    private static final String ERROR = "signup.jsp";
    private static final String SUCCESS = "login.jsp";

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
        boolean check = false;
        UserErrorDTO userE = new UserErrorDTO("", "", "", "", "", "", "");
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            String roleID = request.getParameter("roleID");

            UserDAO dao = new UserDAO();
            List<Integer> list = dao.getroleID();
            if (!userID.matches("se[0-9]{1,9}")) {
                check = true;
                userE.setUserErrorID("UserID must se + number");
            }
            if (fullName.trim().length() < 5 || fullName.trim().length() > 50) {
                check = true;
                userE.setFullErrorName("fullName must be in [5,50]");
            }
            if (!phone.matches("^[0-9]{6}$")) {
                check = true;
                userE.setPhoneError("phone has 6 numbers");
            }
            if (address.trim().length() < 3 || address.trim().length() > 30) {
                check = true;
                userE.setAddressError("address has length [3,30]");
            }
            if (password.trim().length() < 3 || password.trim().length() > 10) {
                check = true;
                userE.setPasswordError("password has length [3,10]");
            }
            if (!password.equals(confirm)) {
                check = true;
                userE.setConfirm("Confirm not match");
            }
            if (!roleID.matches("^[0-9]{0,9}$")) {
                check = true;
                userE.setRoleIDError("RoleId can't be 0");
            }
            for (int id : list) {
                if (id != Integer.parseInt(roleID)) {
                    check = true;
                } else {
                    break;
                }
                userE.setRoleIDError("RoleID don't exist!!!");
            }
            if (check) {
                request.setAttribute("ERROR_USER", userE);
            } else {
                boolean checkdup = dao.checkDuplicate(userID.trim());
                if (checkdup) {
                    userE.setUserErrorID("UserID was exsited");
                    request.setAttribute("ERROR_USER", userE);
                } else {
                    UserDTO user = new UserDTO(userID, fullName, Integer.parseInt(phone), address, password, Integer.parseInt(roleID));
                    if (dao.insert(user)) {
                        url = SUCCESS;
                    }
                }
            }

        } catch (Exception e) {
            log("Error InsertUserController" + e.toString());
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
