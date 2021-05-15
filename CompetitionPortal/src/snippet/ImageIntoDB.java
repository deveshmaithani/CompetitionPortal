package snippet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class ImageIntoDB
 */
@WebServlet("/ImageIntoDB")
public class ImageIntoDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageIntoDB() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String connectionURL = "jdbc:mysql://localhost:3306/competitionportal";
		String user = "root";
		String pass = "12345";
        
		String user_name=request.getParameter("user_name");
		String course=request.getParameter("course");
		String contest_type=request.getParameter("contest_type");
		String email=request.getParameter("email");
		
		int result = 0;
		Connection con = null;
		Part part = request.getPart("image");
 
		if(part != null){
			try{
				Class.forName("com.mysql.jdbc.Driver");
			    con = DriverManager.getConnection(connectionURL, user, pass);
			    
			    PreparedStatement ps = con.prepareStatement("insert into Image(user_name,course,contest_type,email,photo) values(?,?,?,?,?)");
			    ps.setString(1, user_name);
	            ps.setString(2, course);
	            ps.setString(3, contest_type);
	            ps.setString(4, email);
			    InputStream is = part.getInputStream();
			    ps.setBlob(5, is);
			    result = ps.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}	
			finally{
				if(con != null){
					try{
						con.close();
					}
					catch(Exception e){
						e.printStackTrace();
					}
				}
			}
		}
		
		if(result > 0){
	    	response.sendRedirect("result.jsp?message=Image+Uploaded");
	    }
		else{
			response.sendRedirect("result.jsp?message=Some+Error+Occurred");
		}
	}
}


