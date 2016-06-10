package com.tool;

public class Message {

	String tid;
	String mid;
	String content;
	String date;
	String mname;
	
	public String getName()
	{
		return mname;
	}
	
	public void setName(String name)
	{
		mname=name;
	}
	public String getTID()
	{
		return tid;
	}
	
	public void setTID(String id)
	{
		tid=id;
	}
	
	public String getMID()
	{
		return mid;
	}
	
	public void setMID(String id)
	{
		mid=id;
	}
	
	public String getContent()
	{
		return content;
	}
	
	public void setContent(String con)
	{
		content=con;
	}
	
	public String getDate()
	{
		return date;
	}
	
	public void setDate(String Date)
	{
		date=Date;
	}
}
