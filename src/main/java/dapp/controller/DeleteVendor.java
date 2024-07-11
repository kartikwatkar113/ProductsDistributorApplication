package dapp.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dapp.model.VenderModel;
import dapp.service.VenderService;
import dapp.service.VenderServiceImpl;

@WebServlet("/delete")
public class DeleteVendor extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int vid = Integer.parseInt(request.getParameter("vid"));
        VenderService vservice = new VenderServiceImpl();
        boolean b = vservice.isDeleteVenderById(vid);
		
        if(b)
        {
			 RequestDispatcher rd=request.getRequestDispatcher("SuperAdminDashBoard.jsp"); 
			 rd.include(request,response);
			 
        	
        }
        else
        {
        	RequestDispatcher rd=request.getRequestDispatcher("SuperAdminDashBoard.jsp"); 
			 rd.include(request,response);
        }
	}
}
