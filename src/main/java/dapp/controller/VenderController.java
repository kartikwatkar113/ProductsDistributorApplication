package dapp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dapp.model.VenderModel;
import dapp.service.VenderService;
import dapp.service.VenderServiceImpl;

@WebServlet("/VenderCon")
public class VenderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String vname=request.getParameter("vname");
		
		VenderModel vmodel=new VenderModel();
		vmodel.setV_name(vname);
		VenderService vservice=new VenderServiceImpl();
		boolean b=vservice.isAddNewVender(vmodel);
		if(b) {
			RequestDispatcher r=request.getRequestDispatcher("SuperAdminDashBoard.jsp");
			r.include(request, response);
		}
		else {
			out.println("not added");
		}
	}

}
