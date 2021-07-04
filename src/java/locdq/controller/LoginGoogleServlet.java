/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package locdq.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import locdq.daos.UserDAO;
import locdq.dtos.GooglePojo;
import locdq.dtos.GoogleUtils;
import locdq.dtos.UserDTO;

//import stackjava.com.accessgoogle.common.GooglePojo;
//import stackjava.com.accessgoogle.common.GoogleUtils;
/**
 *
 * @author test
 */
@WebServlet(name = "LoginGoogleServlet", urlPatterns = {"/loginGoogle"})
public class LoginGoogleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginGoogleServlet() {
        super();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            request.setAttribute("id", googlePojo.getId());
            request.setAttribute("name", googlePojo.getName());
            request.setAttribute("email", googlePojo.getEmail());
            System.out.println("easdasd"+googlePojo.getEmail());
            String[] words = googlePojo.getEmail().split("@");
            UserDAO dao=new UserDAO();
            try {
                HttpSession session=request.getSession();
                if (dao.checkDuplicate("se"+googlePojo.getId())){
                    List<UserDTO> list=dao.getlistuser(words[0]);
                    
                    for (UserDTO dto:list){
                        session.setAttribute("LOGIN_USER", dto);                        
                    }                    
                }else {       
                    String id=googlePojo.getId();
                     UserDTO user=new UserDTO("se"+id.substring(1, 5), googlePojo.getEmail().trim(), 0000, "HCM", "***", 1);
                     dao.insert(user);
                     session.setAttribute("LOGIN_USER", user);                    
                }
                
            } catch (SQLException ex) {
                Logger.getLogger(LoginGoogleServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            finally{
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }
           
//            RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
//            dis.forward(request, response);
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
