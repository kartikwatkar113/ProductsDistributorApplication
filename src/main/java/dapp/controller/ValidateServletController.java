package dapp.controller;

import java.io.IOException;

import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dapp.model.LoginModel;
import dapp.repository.DBParent;
import dapp.service.ValidateUserService;
import dapp.service.ValidateUserServiceImpl;

@WebServlet("/valid")
public class ValidateServletController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
    	String filePath = this.getServletContext().getRealPath("/").concat("Resource//db.properties");
    	DBParent.path=filePath;
   
        String username = req.getParameter("uname");
        String password = req.getParameter("upass");

        LoginModel model = new LoginModel();
        model.setUsername(username);
        model.setPassword(password);
        
        ValidateUserService validService=new ValidateUserServiceImpl();
        
        try {
        	model=validService.isValidateUser(model);
        	if(model.getLoginType().equals("super admin")) {
            	RequestDispatcher disp=req.getRequestDispatcher("SuperAdminDashBoard.jsp");
            	disp.forward(req, res);
            	
            }
            
        }
        catch(Exception ex) {
        	
        	RequestDispatcher disp=req.getRequestDispatcher("errLogin.jsp");
        	disp.include(req, res);
     }
        
    }
}
