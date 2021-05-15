package image.upload;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.FileInputStream;
import java.io.File;

@WebServlet({ "/SaveImageIntoDB"})
@MultipartConfig(maxFileSize=16177216)
public class SaveImageIntoDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       String user_name = null;
       String course = null;
       String contest_type = null;
       String email = null;
       FileInputStream image = null;
	protected void doPost(RequestContext request, HttpServletResponse response) throws ServletException, IOException{
	
	boolean isMutiPartData = ServletFileUpload.isMultipartContent(request);
	if(isMutiPartData){
		
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		File tempFile= new File("D:\\eclips_project\\CompetitionPortal\\WebContent\\temp");
		factory.setRepository(tempFile);
		
		
	   ServletFileUpload fileUpload = new ServletFileUpload(factory);
	   try{
	  List<FileItem> items = fileUpload.parseRequest(request);
	  for(FileItem item : items)
	  {
		 if(item.isFormField())
		 {
			 String feildName = item.getFieldName();
			 if(feildName.equals("user_name"))
			 {
				 user_name = item.getString();
			 }else if(feildName.equals("course"))
			 {
				 course = item.getString();
			 }else if(feildName.equals("contest_type"))
			 {
				 contest_type = item.getString();
			 }else if(feildName.equals("email"))
			 {
				 email = item.getString();
			 }
			 
		 }else
		 {
			 image = (FileInputStream) item.getInputStream();
		 }
	  }
	   }
	   catch(FileUploadException e){
		   
	   }
		
	}else {
		System.out.println("it is not a multiPart Data");
	}
		

		
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/competitionPortal", "root", "12345");
		
		PreparedStatement ps = conn.prepareStatement("insert into image (user_name,course,contest_type,email,photo) values (?,?,?,?,?)");
		ps.setString(1, user_name);
		ps.setString(2, course);
		ps.setString(3, contest_type);
		ps.setString(4, email);
		ps.setBinaryStream(5, image);
		
		int n=ps.executeUpdate();
		if(n>0)
		{
			response.getWriter().println("done upload");
			
		}
		
		}catch(Exception e)
		{
			
		}
		
		

	}
	}

