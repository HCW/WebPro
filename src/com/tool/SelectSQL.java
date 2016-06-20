package com.tool;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;

import com.tool.Conndatabaseserver;
import com.tool.User;

//操作数据库类
public class SelectSQL {
	public static ResultSet rs;
	
	public boolean CheckLogin(String name,String pwd)
	{
		Conndatabaseserver connsqlserver = null;
		try{
		    connsqlserver=new Conndatabaseserver();
			String sql="select * from admintb where aname='"+name+"'and apwd='"+pwd+"'";
			System.out.println("SelectSQL.JAVA:");
			System.out.println(sql);
			rs=connsqlserver.executeQuery(sql);
			//System.out.println(rs.next());
			
			if(rs.next())
				return true;
			else
				return false;
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		connsqlserver.close();
		return true;
	}
	
	public  Collection<User> getRet(){
		Collection<User> ret=new ArrayList<User>();

		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="select * from admintb";
			rs=connsqlserver.executeQuery(sql);
			while(rs.next()){
				String names=rs.getString("aname");
				String passwords=rs.getString("apwd");
				User user=new User();
				user.setName(names);
				user.setPassword(passwords);
				ret.add(user);
			}
			connsqlserver.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return ret;
	}
	public	Collection<News> selectNewsFy(){
		Collection<News> ret=new ArrayList<News>();
		NewsPage down=new NewsPage();
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="select * from news order by nid desc";
			System.out.println(sql);
			//String sql="select * from (select top 20 * from (select top "+10*page+" * from tb_business order by id ASC)as aSysTable order by id desc) as bsystable order by id ASC";
			//System.out.println(sql);
			ResultSet rs=connsqlserver.executeQuery(sql);
			//System.out.println(rs.next());		
			while(rs.next()){
				News n=new News();
				n.setId(rs.getString(1));
				n.setTitle(rs.getString(2));
				n.setContent(rs.getString(4));
				n.setAuthor(rs.getString(3));
				//n.setSubmittime(rs.getString(4));
				ret.add(n);		
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return ret;	
	}
	
	public	Collection<News> selectNews(String tid){
		Collection<News> ret=new ArrayList<News>();
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="select * from news where nid='"+tid+"'";
			System.out.println(sql);
			ResultSet rs=connsqlserver.executeQuery(sql);
			//System.out.println("select:"+rs.next());
			while(rs.next()){
				String id=rs.getString(1);
				System.out.println(id);
				String title=rs.getString(2);
				String author=rs.getString(3);
				String news=rs.getString(4);
				News news1=new News();
				news1.setId(id);
				news1.setTitle(title);
				news1.setContent(news);
				news1.setAuthor(author);
				news1.setImg(rs.getString(5));
				ret.add(news1);		
			}
			connsqlserver.close();
		}catch(Exception e){
			e.printStackTrace();
		}	
		return ret;	
	}
	
	public int delNews(String id){
		int i=0;
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="delete from news where nid='"+id+"'";
			i=connsqlserver.executeUpdate(sql);
			connsqlserver.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return i;
	}
	
	public  int updateNews(String title,String content,String author,String id){
		int i=0;
		try{

			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="UPDATE news SET title = '"+title+"', content = '"+content+"', author = '"+author+"' WHERE (nid = '"+id+"')";
			System.out.println("update SQL:"+sql);
			i=connsqlserver.executeUpdate(sql);
			
			connsqlserver.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return i;
	}
	
	public boolean InsertNews(String title,String author,String content,String img){
		
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="insert into news(title,author,content,img) values('"+title+"','"+author+"','"+content+"','"+img+"')";
			System.out.println("insert sql:"+sql);
			if(connsqlserver.executeUpdate(sql)!=0)
				return true;
			else
				return false;
	
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return false;
	}
	
	public	Collection<adUser> selectadUser(){
		Collection<adUser> ret=new ArrayList<adUser>();
		//NewsPage down=new NewsPage();
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="SELECT * from admintb where aper != '1'";
			System.out.println(sql);
			ResultSet rs=connsqlserver.executeQuery(sql);
			//System.out.println(rs.next());		
			while(rs.next()){
				adUser user=new adUser();
				user.setID(rs.getString(1));
				user.setName(rs.getString(2));
				user.setPwd(rs.getString(3));
				user.setPer(rs.getString(4));
				ret.add(user);		
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return ret;	
	}
	public	Collection<adUser> selectadUserIN(String id){
		Collection<adUser> ret=new ArrayList<adUser>();
		//NewsPage down=new NewsPage();
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="SELECT * from admintb where aid = '"+id+"'";
			System.out.println(sql);
			ResultSet rs=connsqlserver.executeQuery(sql);
			//System.out.println(rs.next());		
			while(rs.next()){
				adUser user=new adUser();
				user.setID(rs.getString(1));
				user.setName(rs.getString(2));
				user.setPwd(rs.getString(3));
				user.setPer(rs.getString(4));
				ret.add(user);		
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return ret;	
	}
	
	public  boolean UpdateAdmin(String id,String name,String pwd,String per)
	{
		int temp=0;
		try{

			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			//"UPDATE tmessage SET content = '"+content+"', date = '"+date+"' WHERE (tid = '"+id+"')";
			String sql="UPDATE admintb SET aname ='"+name+"',apwd ='"+pwd+"',aper='"+per+"' where aid='"+id+"'";
			System.out.println("update SQL:"+sql);
			temp=connsqlserver.executeUpdate(sql);
			if(temp!=0)
				return true;
			else
				return false;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
	}
	public	Collection<mbUser> selectmbUser(){
		Collection<mbUser> ret=new ArrayList<mbUser>();
		//NewsPage down=new NewsPage();
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="SELECT * from member";
			System.out.println(sql);
			ResultSet rs=connsqlserver.executeQuery(sql);
			//System.out.println(rs.next());		
			while(rs.next()){
				mbUser user=new mbUser();
				user.setID(rs.getString(1));
				user.setName(rs.getString(2));
				user.setPwd(rs.getString(3));
				user.setAddr(rs.getString(4));
				user.setMail(rs.getString(5));
				user.setPhone(rs.getString(6));
				ret.add(user);		
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return ret;	
	}
	
	public	mbUser CheckMBLogin(String user,String pwd){
		//NewsPage down=new NewsPage();
		mbUser ret=new mbUser();
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="SELECT * FROM member where mname='"+user+"' and mpwd='"+pwd+"'";
			System.out.println(sql);
			ResultSet rs=connsqlserver.executeQuery(sql);
			//System.out.println(rs.next());		
			if(rs.next())
			{
				ret.setID(rs.getString(1));
				ret.setName(rs.getString(2));
				ret.setPwd(rs.getString(3));
				return ret;
			}
			else
				return ret;
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return ret;	
	}
	
	public	Collection<mbUser> selectmbUserIN(String id){
		Collection<mbUser> ret=new ArrayList<mbUser>();
		//NewsPage down=new NewsPage();
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="SELECT * from member where mid='"+id+"'";
			System.out.println(sql);
			ResultSet rs=connsqlserver.executeQuery(sql);
			//System.out.println(rs.next());		
			while(rs.next()){
				mbUser user=new mbUser();
				user.setID(rs.getString(1));
				user.setName(rs.getString(2));
				user.setPwd(rs.getString(3));
				user.setAddr(rs.getString(4));
				user.setMail(rs.getString(5));
				user.setPhone(rs.getString(6));
				ret.add(user);		
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return ret;	
	}
	
	public	Collection<Product> selectProductAll(){
		Collection<Product> ret=new ArrayList<Product>();
		//NewsPage down=new NewsPage();
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="SELECT * from product";
			System.out.println(sql);
			ResultSet rs=connsqlserver.executeQuery(sql);
			//System.out.println(rs.next());		
			while(rs.next()){
				Product product=new Product();
				product.setID(rs.getString(1));
				product.setName(rs.getString(2));
				product.setDec(rs.getString(3));
				product.setPrice(rs.getString(4));
				product.setCount(rs.getString(5));
				product.setImg(rs.getString(6));
				ret.add(product);		
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return ret;	
	}
	
	public	Collection<Message> selectMessage(){
		Collection<Message> ret=new ArrayList<Message>();
		//NewsPage down=new NewsPage();
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="select tid,mname,content,date from tmessage t,member m where t.mid=m.mid order by tid desc";
			System.out.println(sql);
			ResultSet rs=connsqlserver.executeQuery(sql);
			//System.out.println(rs.next());		
			while(rs.next()){
				Message message=new Message();
				message.setTID(rs.getString(1));
				message.setName(rs.getString(2));
				message.setContent(rs.getString(3));
				message.setDate(rs.getString(4));
				ret.add(message);		
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return ret;	
	}
	
	public	Collection<Message> selectMessageIN(String id){
		Collection<Message> ret=new ArrayList<Message>();
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="select tid,mname,content,date from tmessage t,member m where t.mid=m.mid and tid='"+id+"'";
			System.out.println(sql);
			ResultSet rs=connsqlserver.executeQuery(sql);
			//System.out.println("select:"+rs.next());
			while(rs.next()){
				Message message=new Message();
				message.setTID(rs.getString(1));
				message.setName(rs.getString(2));
				message.setContent(rs.getString(3));
				message.setDate(rs.getString(4));
				ret.add(message);		
			}
			connsqlserver.close();
		}catch(Exception e){
			e.printStackTrace();
		}	
		return ret;	
	}
	
	public boolean MessageChenkMName(String name)//验证信息修改是否存在该留言者
	{
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="SELECT * from member where mname='"+name+"'";
			System.out.println(sql);
			ResultSet rs=connsqlserver.executeQuery(sql);		
			if(rs.next())
				return true;
			else
				return false;
		}catch(Exception e){
			e.printStackTrace();
		}	
		return true;
	}
	
	public  boolean updateMessage(String id,String content,String date)
	{
		int temp=0;
		try{

			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			//"UPDATE tmessage SET content = '"+content+"', date = '"+date+"' WHERE (tid = '"+id+"')";
			String sql="UPDATE tmessage SET content = '"+content+"', date = '"+date+"' WHERE (tid = '"+id+"')";
			System.out.println("update SQL:"+sql);
			temp=connsqlserver.executeUpdate(sql);
			if(temp!=0)
				return true;
			else
				return false;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
	}
	
	public boolean delMessage(String id){
		int i=0;
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="delete from tmessage where tid='"+id+"'";
			System.out.println("delete SQL:"+sql);
			i=connsqlserver.executeUpdate(sql);
			System.out.println("i:"+i);
			if(i!=0)
				return true;
			else
				return false;
		}catch(Exception e){
			e.printStackTrace();
		}
		return true;
	}
	public boolean InsertMsg(String id,String date,String content){
		int i=0;
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="insert into tmessage(mid,content,date) values('"+id+"','"+content+"','"+date+"')";
			System.out.println("insert sql:"+sql);
			i=connsqlserver.executeUpdate(sql);
			if(i!=0)
				return true;
			else
				return false;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
	}
	
	public boolean InsertProduct(String id,String name,String dec,String price,String count){
		int i=0;
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="insert into product values('"+id+"','"+name+"','"+dec+"','"+price+"','"+count+"','')";
			System.out.println("insert sql:"+sql);
			i=connsqlserver.executeUpdate(sql);
			if(i!=0)
				return true;
			else
				return false;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
	}
	
	public	Collection<Product> selectProductIN(String id){
		Collection<Product> ret=new ArrayList<Product>();
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="select * from product where pid='"+id+"'";
			System.out.println(sql);
			ResultSet rs=connsqlserver.executeQuery(sql);
			//System.out.println("select:"+rs.next());
			while(rs.next()){
				Product message=new Product();
				message.setID(rs.getString(1));
				message.setName(rs.getString(2));
				message.setDec(rs.getString(3));
				message.setPrice(rs.getString(4));
				message.setCount(rs.getString(5));
				message.setImg(rs.getString(6));
				ret.add(message);		
			}
			connsqlserver.close();
		}catch(Exception e){
			e.printStackTrace();
		}	
		return ret;	
	}
	
	public  boolean UpdateProduct(String id,String name,String dec,String price,String count)
	{
		int temp=0;
		try{

			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			//"UPDATE tmessage SET content = '"+content+"', date = '"+date+"' WHERE (tid = '"+id+"')";
			String sql="UPDATE product SET pname ='"+name+"',pdec ='"+dec+"',pprice='"+price+"',pcount='"+count+"' where pid='"+id+"'";
			System.out.println("update SQL:"+sql);
			temp=connsqlserver.executeUpdate(sql);
			if(temp!=0)
				return true;
			else
				return false;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
	}
	
	public  boolean UpdateProductImg(String id,String img)
	{
		int temp=0;
		try{

			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			//"UPDATE tmessage SET content = '"+content+"', date = '"+date+"' WHERE (tid = '"+id+"')";
			String sql="UPDATE product SET img='"+img+"' where pid='"+id+"'";
			System.out.println("update SQL:"+sql);
			temp=connsqlserver.executeUpdate(sql);
			if(temp!=0)
				return true;
			else
				return false;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
	}
	
	public boolean DelPro(String id){
		int i=0;
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="delete from product where pid='"+id+"'";
			System.out.println("delete SQL:"+sql);
			i=connsqlserver.executeUpdate(sql);
			System.out.println("i:"+i);
			if(i!=0)
				return true;
			else
				return false;
		}catch(Exception e){
			e.printStackTrace();
		}
		return true;
	}
	
	public boolean InsertAdmin(String id,String name,String pwd,String per){
		int i=0;
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="insert into admintb values('"+id+"','"+name+"','"+pwd+"','"+per+"')";
			System.out.println("insert sql:"+sql);
			i=connsqlserver.executeUpdate(sql);
			if(i!=0)
				return true;
			else
				return false;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
	}
	public boolean DelAdmin(String id){
		int i=0;
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="delete from admintb where aid='"+id+"'";
			System.out.println("delete SQL:"+sql);
			i=connsqlserver.executeUpdate(sql);
			System.out.println("i:"+i);
			if(i!=0)
				return true;
			else
				return false;
		}catch(Exception e){
			e.printStackTrace();
		}
		return true;
	}
	
	public boolean InsertMember(String name,String pwd,String addr,String mail,String phone){
		int i=0;
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="insert into member(mname,mpwd,maddr,mmail,mphone) values('"+name+"','"+pwd+"','"+addr+"','"+mail+"','"+phone+"')";
			System.out.println("insert sql:"+sql);
			i=connsqlserver.executeUpdate(sql);
			if(i!=0)
				return true;
			else
				return false;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
	}

	public  boolean UpdateMember(String id,String name,String pwd,String addr,String mail,String phone)
	{
		int temp=0;
		try{

			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			//"UPDATE tmessage SET content = '"+content+"', date = '"+date+"' WHERE (tid = '"+id+"')";
			String sql="UPDATE member SET mname ='"+name+"',mpwd ='"+pwd+"',maddr='"+addr+"',mmail='"+mail+"',mphone='"+phone+"' where mid='"+id+"'";
			System.out.println("update SQL:"+sql);
			temp=connsqlserver.executeUpdate(sql);
			if(temp!=0)
				return true;
			else
				return false;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
	}
	
	public boolean DelMember(String id){
		int i=0;
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="delete from member where mid='"+id+"'";
			System.out.println("delete SQL:"+sql);
			i=connsqlserver.executeUpdate(sql);
			System.out.println("i:"+i);
			if(i!=0)
				return true;
			else
				return false;
		}catch(Exception e){
			e.printStackTrace();
		}
		return true;
	}
	

	public	Collection<Indent> selectIndent(){
		Collection<Indent> ret=new ArrayList<Indent>();
		//NewsPage down=new NewsPage();
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="SELECT id,mname,pname,count,sumprice,date from indent i,member m,product p where i.mid=m.mid and i.pid=p.pid";
			System.out.println(sql);
			ResultSet rs=connsqlserver.executeQuery(sql);
			//System.out.println(rs.next());		
			while(rs.next()){
				Indent message=new Indent();
				message.setID(rs.getString(1));
				message.setMName(rs.getString(2));
				message.setPName(rs.getString(3));
				message.setCount(rs.getString(4));
				message.setSumPrice(rs.getString(5));
				message.setDate(rs.getString(6));
				ret.add(message);		
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return ret;	
	}
	public	Collection<Indent> selectIndentIN(String id){
		Collection<Indent> ret=new ArrayList<Indent>();
		//NewsPage down=new NewsPage();
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="SELECT mname,pname,count,sumprice,date from indent i,member m,product p where i.mid=m.mid and i.pid=p.pid and id='"+id+"'";
			System.out.println(sql);
			ResultSet rs=connsqlserver.executeQuery(sql);
			//System.out.println(rs.next());		
			while(rs.next()){
				Indent message=new Indent();
				message.setID(id);
				message.setMName(rs.getString(1));
				message.setPName(rs.getString(2));
				message.setCount(rs.getString(3));
				message.setSumPrice(rs.getString(4));
				message.setDate(rs.getString(5));
				ret.add(message);		
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return ret;	
	}
	
	public boolean InsertIndent(String mid,String pid,String sumprice,String count,String date){
		int i=0;
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="insert into indent(mid,pid,sumprice,count,date) values('"+mid+"','"+pid+"','"+sumprice+"','"+count+"','"+date+"')";
			System.out.println("insert sql:"+sql);
			i=connsqlserver.executeUpdate(sql);
			if(i!=0)
				return true;
			else
				return false;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
	}
	
	public  boolean UpdateIndent(String id,String mid,String pid,String sumprice,String count,String date)
	{
		int temp=0;
		try{

			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			//"UPDATE tmessage SET content = '"+content+"', date = '"+date+"' WHERE (tid = '"+id+"')";
			String sql="UPDATE indent SET mid ='"+mid+"',pid ='"+pid+"',sumprice='"+sumprice+"',count='"+count+"',date='"+date+"' where id='"+id+"'";
			System.out.println("update SQL:"+sql);
			temp=connsqlserver.executeUpdate(sql);
			if(temp!=0)
				return true;
			else
				return false;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
	}
	
	public boolean DelIndent(String id){
		int i=0;
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="delete from indent where id='"+id+"'";
			System.out.println("delete SQL:"+sql);
			i=connsqlserver.executeUpdate(sql);
			System.out.println("i:"+i);
			if(i!=0)
				return true;
			else
				return false;
		}catch(Exception e){
			e.printStackTrace();
		}
		return true;
	}
	public boolean DelNews(String id){
		int i=0;
		try{
			Conndatabaseserver connsqlserver=new Conndatabaseserver();
			String sql="delete from news where nid='"+id+"'";
			System.out.println("delete SQL:"+sql);
			i=connsqlserver.executeUpdate(sql);
			System.out.println("i:"+i);
			if(i!=0)
				return true;
			else
				return false;
		}catch(Exception e){
			e.printStackTrace();
		}
		return true;
	}
}
