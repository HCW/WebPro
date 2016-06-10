package com.tool;

public class User {
	String name;
	String password;
	public User(){
		name="";
		password="";
	}
	public String getName(){
		return this.name;
	}
	public String getPassword(){
		return this.password;
	}
	public void setName(String name){
		this.name=name;
		
	}
	public void setPassword(String password){
		this.password=password;
	}
	
}

