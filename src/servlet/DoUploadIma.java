package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.BufferedInputStream;  
import java.io.BufferedOutputStream;  
import java.io.File;  
import java.io.FileOutputStream;   
import java.util.Date;  
import java.util.regex.Matcher;  
import java.util.regex.Pattern;  
  

  
import org.apache.commons.fileupload.FileItemIterator;  
import org.apache.commons.fileupload.FileItemStream;  
import org.apache.commons.fileupload.disk.DiskFileItemFactory;  
import org.apache.commons.fileupload.servlet.ServletFileUpload;  
import org.apache.commons.fileupload.util.Streams;  
/**
 * Servlet implementation class DoUploadIma
 */
@WebServlet("/DoUploadIma")
public class DoUploadIma extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoUploadIma() {
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
		response.setContentType("text/html");     
        response.setCharacterEncoding("UTF-8");  
        String realDir = request.getSession().getServletContext().getRealPath("");  
        System.out.println("realDir:"+realDir);
        String contextpath = request.getContextPath();  
        String basePath = request.getScheme() + "://"  
        + request.getServerName() + ":" + request.getServerPort()  
        + contextpath + "/";  
        System.out.println("basePath:"+basePath);
  
        try {  
        String filePath = "uploadfiles";  
        String realPath = realDir+"\\"+filePath; 
        //String realPath="\\NewEnterpriseProject\\uploadfiles\\"+filePath;
        //String realPath = basePath+"/"+filePath; 
        System.out.println("realpath:"+realPath);
        //判断路径是否存在，不存在则创建  
        File dir = new File(realPath);  
        if(!dir.isDirectory()) 
        {
        	 System.out.println("dir.isDirectory()");
            dir.mkdir();  
        }
  
        if(ServletFileUpload.isMultipartContent(request)){  
        	
        	System.out.println("ServletFileUpload.isMultipartContent(request)");
        	
            DiskFileItemFactory dff = new DiskFileItemFactory();  
            dff.setRepository(dir);  
            dff.setSizeThreshold(1024000);  
            ServletFileUpload sfu = new ServletFileUpload(dff);  
            FileItemIterator fii = null;  
            fii = sfu.getItemIterator(request);  
            String title = "";   //图片标题  
            String url = "";    //图片地址  
            String realurl="";
            String fileName = "";  
            String state="SUCCESS";  
            String realFileName="";  
            while(fii.hasNext()){  
            	
            	System.out.println("fii.hasNext()");
            	
                FileItemStream fis = fii.next();  
  
                try{  
                    if(!fis.isFormField() && fis.getName().length()>0){  
                    	System.out.println("!fis.isFormField() && fis.getName().length()>0");
                    	fileName = fis.getName();  
                    	System.out.println("fileName:"+fileName);
                        Pattern reg=Pattern.compile("[.]jpg|png|jpeg|gif$");  
                        Matcher matcher=reg.matcher(fileName);  
                        if(!matcher.find()) {  
                            state = "文件类型不允许！";  
                            break;  
                        }  
                        realFileName = new Date().getTime()+fileName.substring(fileName.lastIndexOf("."),fileName.length());  
                        url = realPath+"\\"+realFileName;  
  
                        System.out.println("realFileName:"+realFileName);
                        System.out.println("url:"+url);
                        BufferedInputStream in = new BufferedInputStream(fis.openStream());//获得文件输入流  
                        FileOutputStream a = new FileOutputStream(new File(url));  
                        BufferedOutputStream output = new BufferedOutputStream(a);  
                        Streams.copy(in, output, true);//开始把文件写到你指定的上传文件夹  
                        System.out.println("开始把文件写到你指定的上传文件夹");
                        realurl="\\\\NewEnterpriseProject\\\\uploadfiles\\\\"+realFileName;
                        System.out.println("realurl"+realurl);
                        
                    }else{  
                    	System.out.println("fname");
                        String fname = fis.getFieldName();  
  
                        if(fname.indexOf("pictitle")!=-1){  
                            BufferedInputStream in = new BufferedInputStream(fis.openStream());  
                            byte c [] = new byte[10];  
                            int n = 0;  
                            while((n=in.read(c))!=-1){  
                                title = new String(c,0,n);  
                                break;  
                            }  
                        }  
                    }  
                }catch(Exception e){  
                    e.printStackTrace();  
                }  
            }  
            response.setStatus(200);  
           // String retxt ="{src:'"+basePath+filePath+"/"+realFileName+"',status:success}"; 
            String retxt ="{src:'"+basePath+filePath+"/"+realFileName+"',status:success}"; 
            System.out.println("返回数据："+retxt);
           // response.getWriter().print(retxt);  
           response.getWriter().print(realurl);  
           // response.getWriter().print("doubleerror");
        }  
        }catch(Exception ee) {  
            ee.printStackTrace();  
        }  
          
    }  
    public void init() throws ServletException {  
        // Put your code here  
    }  

}
