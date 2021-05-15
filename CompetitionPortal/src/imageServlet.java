import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/imageServlet")
@MultipartConfig(maxFileSize = 16177216)
public class imageServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String connectionURL = "jdbc:mysql://localhost:3306/competitionportal";
		String user = "root";
		String pass = "12345";
        
		String user_name=req.getParameter("user_name");
		String course=req.getParameter("course");
		String contest_type=req.getParameter("contest_type");
		String email=req.getParameter("email");
		
		int result = 0;
		Connection con = null;
		Part part = req.getPart("image");
 
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
	    	resp.sendRedirect("result.jsp?message=Image+Uploaded");
	    }
		else{
			resp.sendRedirect("result.jsp?message=Some+Error+Occurred");
		}
	}
}