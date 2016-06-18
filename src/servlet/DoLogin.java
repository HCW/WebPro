package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tool.SelectSQL;
import com.tool.mbUser;

/**
 * Servlet implementation class DoLogin
 */
@WebServlet("/DoLogin")
public class DoLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String pwd=request.getParameter("pwd");
		
		
		SelectSQL sql=new SelectSQL();
		mbUser User=sql.CheckMBLogin(username, pwd);
		System.out.println("name:"+User.getName());
		System.out.println("pwd:"+User.getPwd());
		System.out.println("uname:"+username);
		System.out.println("upwd:"+pwd);
		System.out.println("id:"+pwd);
		HttpSession session=request.getSession();
		boolean Flag=false;
		if(User.getName().equals(username)&&User.getPwd().equals(pwd))
		{
			Flag=true;
			session.setAttribute("flag", Flag);
			session.setAttribute("LoginSuccess", User);//设置session保存登录信息
			response.getWriter().print("success");	
		}
		else
		{
			Flag=false;
			session.setAttribute("flag", Flag);
			response.getWriter().print("failed");
		}
			
	}

}
