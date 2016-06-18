package com.tool;

public class Product {
	String pid;
	String pname;
	String pdec;
	String pprice;
	String pcount;
	String img;
	
	public String getImgPath()
	{
		return img;
	}
	
	public void setImg(String Img)
	{
		
		img=Img;
	}
	public String getID()
	{
		return pid;
	}
	
	public void setID(String id)
	{
		pid=id;
	}
	
	public String getName()
	{
		return pname;
	}
	
	public void setName(String name)
	{
		pname=name;
	}
	
	public String getDec()
	{
		return pdec;
	}
	
	public void setDec(String dec)
	{
		pdec=dec;
	}
	
	public String getPrice()
	{
		return pprice;
	}
	
	public void setPrice(String price)
	{
		pprice=price;
	}
	
	public String getCount()
	{
		return pcount;
	}
	
	public void setCount(String count)
	{
		pcount=count;
	}
}
