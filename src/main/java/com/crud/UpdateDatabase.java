package com.crud;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UpdateDatabase
 */
@WebServlet("/updatedatabase")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 1,  // 1 MB
		maxFileSize = 1024 * 1024 * 10,       // 10 MB
		maxRequestSize = 1024 * 1024 * 100    // 100 MB
		)
public class UpdateDatabase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDatabase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String n = request.getParameter("name");
		int a = Integer.parseInt(request.getParameter("age"));
		String g = request.getParameter("gender");
		String s = request.getParameter("stream");
		
		Part pt = request.getPart("image");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "123456789");
			
			if(request.getPart("image").getSize()>0) {
				String fn = pt.getSubmittedFileName();
				
				for(Part fpart:request.getParts()) {
					fpart.write("C:\\Users\\Mainak\\Desktop\\CRUD\\CRUD\\src\\main\\webapp\\img\\" + fn);
				}
				
				String sql = "update student set name='"+n+"', age="+a+", gender='"+g+"', stream='"+s+"', image='"+fn+"' where sid='"+id+"'";
				PreparedStatement pstm = con.prepareStatement(sql);
				pstm.executeUpdate();
			}
			else {
				String sql = "update student set name='"+n+"', age="+a+", gender='"+g+"', stream='"+s+"' where sid='"+id+"'";
				PreparedStatement pstm = con.prepareStatement(sql);
				pstm.executeUpdate();
			}
			
			response.sendRedirect("liststudents");
		}
		catch(Exception e) {
			System.out.println("Exception: " + e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
