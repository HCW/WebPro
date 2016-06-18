package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tool.SelectSQL;

/**
 * Servlet implementation class DoProductImgAdd
 */
@WebServlet("/DoProductImgAdd")
public class DoProductImgAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoProductImgAdd() {
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
				String Img=request.getParameter("img");
				//System.out.println("Content:"+Content);
				//System.out.println("Content:"+Content);
				SelectSQL sql=new SelectSQL();
				if(sql.UpdateProductImg(ID, Img))
				{
					response.getWriter().print("success");
				}
				else
				{
					response.getWriter().print("failed");
				}
	}

}
