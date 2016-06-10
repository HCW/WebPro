package servlet;

import com.tool.*;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DoMessageUpdate
 */
@WebServlet("/DoMessageUpdate")
//@WebServlet(name = "DoMessageUpdate", urlPatterns = { "/DoMessageUpdate" })
public class DoMessageUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoMessageUpdate() {
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
		/*String Name=new String(request.getParameter("mname").getBytes("ISO-8859-1"),"UTF-8");
		System.out.println("name:"+Name);
		String Date=new String(request.getParameter("date").getBytes("ISO-8859-1"),"UTF-8");
		String Content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");*/
		
		HttpSession session=request.getSession();
		String tid=(String)session.getAttribute("id");
		System.out.println("id:"+tid);
		/*String Name=new String(request.getParameter("mname").getBytes("ISO-8859-1"),"UTF-8");
		System.out.println("name:"+Name);
		String Date=new String(request.getParameter("date").getBytes("ISO-8859-1"),"UTF-8");
		System.out.println("date:"+Date);
		String Content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");*/
		
		
		String Name=request.getParameter("mname");
		System.out.println("name:"+Name);
		String Date=request.getParameter("date");
		System.out.println("date:"+Date);
		String Content=request.getParameter("content");
		System.out.println("Content:"+Content);
		//System.out.println("Content:"+Content);
		SelectSQL sql=new SelectSQL();
		if(!sql.MessageChenkMName(Name))
		{
			response.getWriter().print("namefailed");
			System.out.println("update name failed!");
		}
		else
		{
			if(sql.updateMessage(tid, Content, Date))
			{
				/*request.setAttribute("tip", "更新成功！");
				response.sendRedirect("partII/MessageUpdate.jsp?id="+tid);*/
				//request.getRequestDispatcher("/partII/MessageUpdate.jsp?id="+tid).forward(request, response);
				response.getWriter().print("success");
			}
			else
			{
				/*request.setAttribute("tip", "更新失败！");
				response.sendRedirect("MessageUpdate.jsp?id="+tid);*/
				
				response.getWriter().print("failed");
			}
			
		}
	}

}
