package com.crud;

import java.io.*;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.sql.*;

/**
 * Servlet implementation class InsertStudent
 */
@WebServlet("/insertstudent")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 1,  // 1 MB
		maxFileSize = 1024 * 1024 * 10,       // 10 MB
		maxRequestSize = 1024 * 1024 * 100    // 100 MB
		)
public class InsertStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String n = request.getParameter("name");
		int a = Integer.parseInt(request.getParameter("age"));
		String g = request.getParameter("gender");
		String s = request.getParameter("stream");
		
		Part pt = request.getPart("image");
		String fn = pt.getSubmittedFileName();
		
		for(Part fpart:request.getParts()) {
			fpart.write("C:\\Users\\Mainak\\Desktop\\CRUD\\CRUD\\src\\main\\webapp\\img\\" + fn);
		}
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "123456789");
			
			String sql = "insert into student set name='"+n+"', age="+a+", gender='"+g+"', stream='"+s+"', image='"+fn+"'";
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("Exception: " + e);
		}
		
		request.setAttribute("name", n);
		request.setAttribute("age", a);
		request.setAttribute("gender", g);
		request.setAttribute("stream", s);
		request.setAttribute("image", fn);
		
		request.getRequestDispatcher("show.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
