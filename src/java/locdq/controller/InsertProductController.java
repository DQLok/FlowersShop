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
import javax.servlet.http.HttpSession;
import locdq.daos.ProductDAO;
import locdq.dtos.ProductDTO;
import locdq.dtos.ProductErrorDTO;
import locdq.dtos.UserDTO;

/**
 *
 * @author test
 */
@WebServlet(name = "InsertProductController", urlPatterns = {"/InsertProductController"})
public class InsertProductController extends HttpServlet {
    private static final String ERROR="insertpro.jsp";
    private static final String SUCCESS="admin.jsp";
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
        String url=ERROR;
        boolean check=false;
        ProductErrorDTO productE=new ProductErrorDTO("", "", "", "", "", "");
        try  {
          String productID=request.getParameter("productID");
          String productName=request.getParameter("productName");
          String quantity=request.getParameter("quantity");
          String price =request.getParameter("price");
          String img=request.getParameter(price);
          String categoryID=request.getParameter("categoryID");
          
            ProductDAO dao=new ProductDAO();
            List<String> list=dao.getCategoryID();
            if (!productID.matches("p[0-9]{1,9}")){
                check=true;
                productE.setProductIDError("ProductID must p + number");
            }
            if (productName.trim().length()<5 || productName.trim().length()>50){
                check=true;
                productE.setProductNameError("Productname must be in [5,50]");
            }
            if (!quantity.matches("^[0-9]{1,9}")){
                check=true;
                productE.setQuantityError("Quantity is number");
            }
            if (!price.matches("^[0-9]{1,5}")){
                check=true;
                productE.setPriceError("Price must be < 600000 $ ");
            }
            if (!categoryID.matches("c[0-9]{1,9}$")){
                check=true;
                productE.setCategoryIDError("CategoryID must be c + number");
            }
            for(String ca:list){
                if (!ca.equals(categoryID)){
                    check=true;
                }else{
                    break;
                }
                productE.setCategoryIDError("CategoryID don't exist");
            }
            if (check){
                request.setAttribute("ERROR_PRODUCT", productE);
            }else{
                boolean checkp=dao.checkDuplicatePro(productID);
                                    System.out.println("check ID Pro" +checkp);
                if (checkp){
                    productE.setProductIDError("ProductID was existed");
                    request.setAttribute("ERROR_PRODUCT", productE);
                }else {
                    ProductDTO pro=new ProductDTO(productID, productName, Integer.parseInt(quantity), Float.parseFloat(price), img, categoryID, 0);
                    if(dao.insertPro(pro)){                        
                        HttpSession session=request.getSession();
                        UserDTO admin =(UserDTO)session.getAttribute("LOGIN_ADMIN");
                        session.setAttribute("LOGIN_ADMIN", admin);
                        url=SUCCESS+"?product=on";
                    }
                }
            }
        }catch(Exception e){
            
        }finally{
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
