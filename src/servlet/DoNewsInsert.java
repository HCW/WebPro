package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tool.SelectSQL;

/**
 * Servlet implementation class DoNewsInsert
 */
@WebServlet("/DoNewsInsert")
public class DoNewsInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoNewsInsert() {
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
		        String Title=request.getParameter("title");
			//	System.out.println("name:"+ID);
				String Author=request.getParameter("author");
				//System.out.println("date:"+Date);
				String Img=request.getParameter("img");
				String Content=request.getParameter("content");
			
				System.out.println("Title:"+Title);
				System.out.println("author:"+Author);
				System.out.println("img:"+Img);
				System.out.println("Content:"+Content);
				//response.getWriter().print("success");
				//System.out.println("Content:"+Content);
				SelectSQL sql=new SelectSQL();
				if(sql.InsertNews(Title, Author, Content, Img))
				{
					response.getWriter().print("success");
				}
				else
				{
					response.getWriter().print("failed");
				}
	}

}
