package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.DbConnection;


@MultipartConfig
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		
		
		
		// Getting all the request
		
		String name=request.getParameter("user_name");
		String email=request.getParameter("user_email");
		String password=request.getParameter("user_password");
		Part part = request.getPart("image");
		String fileName=part.getSubmittedFileName();
//		
	
		
		Connection con = DbConnection.getConnection();
		
		String q="insert into user(name,email,password,imageName) values(?,?,?,?)";
		try {
			Thread.sleep(2000);
			PreparedStatement ps = con.prepareStatement(q);
			ps.setString(1,name);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4, fileName);
			ps.execute();
			out.print("done");
			// file upload
			InputStream is = part.getInputStream();
			byte[] data=new byte[is.available()];

			is.read(data);
			String path=request.getServletContext().getRealPath("/")+"image"+File.separator+fileName;	
			
			FileOutputStream fos=new FileOutputStream(path);
			fos.write(data);
			fos.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.print("error");
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	}

}
