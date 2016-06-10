package servlet;

import com.tool.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DoMemberUpdate
 */
@WebServlet("/DoMemberUpdate")
public class DoMemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoMemberUpdate() {
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
		String ID=request.getParameter("mid");	
		String Name=request.getParameter("name");				
		//System.out.println("date:"+Date);
		String Pwd=request.getParameter("pwd");
		String Addr=request.getParameter("addr");
		String Mail=request.getParameter("mail");
		String Phone=request.getParameter("phone");
	
		//System.out.println("Content:"+Content);
		//System.out.println("Content:"+Content);
		SelectSQL sql=new SelectSQL();
		if(sql.UpdateMember(ID,Name, Pwd, Addr, Mail, Phone))
		{
			response.getWriter().print("success");
		}
		else
		{
			response.getWriter().print("failed");
		}
	}

}
