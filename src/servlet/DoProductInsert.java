package servlet;

import com.tool.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DoProductInsert
 */
@WebServlet("/DoProductInsert")
public class DoProductInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoProductInsert() {
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
		String ID=request.getParameter("pid");
	//	System.out.println("name:"+ID);
		String Name=request.getParameter("name");
		//System.out.println("date:"+Date);
		String Price=request.getParameter("price");
		String Count=request.getParameter("count");
		String Dec=request.getParameter("dec");
		//System.out.println("Content:"+Content);
		//System.out.println("Content:"+Content);
		SelectSQL sql=new SelectSQL();
		if(sql.InsertProduct(ID, Name, Dec, Price, Count))
		{
			response.getWriter().print("success");
		}
		else
		{
			response.getWriter().print("failed");
		}
	}

}
