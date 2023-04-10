package com.crud;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ListStudents
 */
@WebServlet("/liststudents")
public class ListStudents extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListStudents() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "123456789");
			
			String sql = "select * from student";
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			
			@SuppressWarnings("rawtypes")
			ArrayList<HashMap> arr = new ArrayList<>();
			
			while(rs.next()) {
				HashMap<String, String> hm = new HashMap<>();
				
				hm.put("id", rs.getString("sid"));
				hm.put("name", rs.getString("name"));
				hm.put("age", rs.getString("age"));
				hm.put("gender", rs.getString("gender"));
				hm.put("stream", rs.getString("stream"));
				hm.put("img", rs.getString("image"));
				
				arr.add(hm);
			}
			
			request.setAttribute("students", arr);
			request.getRequestDispatcher("list.jsp").forward(request, response);
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
