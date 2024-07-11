package dapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dapp.model.VenderModel;
import dapp.service.VenderService;
import dapp.service.VenderServiceImpl;

@WebServlet("/searchVender")
public class SearchVender extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String venderName = request.getParameter("vname");

		VenderService vservice = new VenderServiceImpl();

		List<VenderModel> vlist = vservice.getVenderListByName(venderName);

		int count = 0;
		
		out.println("<div id='showGrid'>");
		out.println("<table class='table table-striped table-hover mt-3' style='border: 1px solid black; width: 70%;'>");
		out.println("<thead>");
		out.println("<tr>");
		out.println("<th scope='col'>Sr. No</th>");
		out.println("<th scope='col'>Vendor ID</th>");
		out.println("<th scope='col'>Vendor Name</th>");
		out.println("<th scope='col'>Delete</th>");
		out.println("<th scope='col'>Update</th>");
		out.println("</tr>");
		out.println("</thead>");
		out.println("<tbody>");
		for (VenderModel vmodel : vlist) {
			out.println("<tr>");
			out.println("<td scope='col'>"+(++count)+"</th>");
			out.println("<td>"+vmodel.getV_id()+"</td>");
			out.println("<td>"+vmodel.getV_name()+"</td>");
			out.println(
					"<td style='color: blue;'><a href='dltVender?vid="+vmodel.getV_id()+"' style='text-decoration: none'>DELETE</a></td>");
			out.println("<td style='color: blue;'><a href='' style='text-decoration: none'>UPDATE</a></td>");
			out.println("</tr>");
		}
		out.println("<tbody>");
		out.println("</table>");
		out.println("</div>");
	}

}
