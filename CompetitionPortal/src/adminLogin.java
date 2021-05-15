

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginAdmin;

@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public adminLogin() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		
		
		LoginAdmin ad = new LoginAdmin();
		if(ad.check(uname, pass))
		{
			HttpSession session = request.getSession();
			session.setAttribute("username", uname);
			session.setAttribute("password", pass);
			response.sendRedirect("AdminModule1.jsp");
			
		}
		else
		{
			response.sendRedirect("AdminLogin.jsp");
		}
	}

}
