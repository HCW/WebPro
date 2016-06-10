package servlet;

import com.tool.*;
import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DoIndentInsert
 */
@WebServlet("/DoIndentInsert")
public class DoIndentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoIndentInsert() {
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
		String Mid=request.getParameter("mid");
		//System.out.println("name:"+ID);
		String Pid=request.getParameter("pid");
		String Count=request.getParameter("count");
		String Date=request.getParameter("date");
		String SumPrice="";
		//System.out.println("date:"+Date);
		
		//System.out.println("Content:"+Content);
		//System.out.println("Content:"+Content);
		int TempCount=Integer.parseInt(Count);
		SelectSQL sql=new SelectSQL();
		Collection<Product> pd=sql.selectProductIN(Pid);
		Iterator<Product> iter=pd.iterator();
		while(iter.hasNext())
		{
			Product newsl=(Product)iter.next();
			int temp=Integer.parseInt(newsl.getCount());
			if(TempCount>temp||TempCount<=0)
			{
				response.getWriter().print("count error");
			}
			else
			{
				int sp=Integer.parseInt(newsl.getPrice());
				SumPrice=String.valueOf(TempCount*sp);
				if(sql.InsertIndent(Mid, Pid, SumPrice, Count, Date))
				{
					response.getWriter().print("success");
				}
				else
				{
					response.getWriter().print("failed");
				}
			}
		}
		System.out.println("mid:"+Mid);
		System.out.println("pid:"+Pid);
		System.out.println("count:"+Count);
		System.out.println("date:"+Date);
		System.out.println("sumprice:"+SumPrice);
		
	}

}
