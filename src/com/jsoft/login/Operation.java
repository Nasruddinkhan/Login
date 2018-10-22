package com.jsoft.login;
import java.util.*;
import java.sql.*;

public class Operation {

	private DBConnectionManager dbconnectionmanager;
	private ErrorHandlers  errorhandlers;
	String strSQL = "";
	public Operation() {
		// TODO Auto-generated constructor stub
		dbconnectionmanager	= DBConnectionManager.getInstance();
		errorhandlers = ErrorHandlers.getInstance();
	}
	private String replaceQuotes(String toReplace)
	{
		StringBuffer buff = new StringBuffer(toReplace);
		for(int i=0;i<buff.length();i++)
		{
			if(buff.charAt(i)=='\'')
			{
				buff.insert(i,'\'');
				i++;
			}
		}
		return buff.toString();
	}


	public ArrayList<LoginMaster> checkLogin(String username,String password)
	{
		ArrayList<LoginMaster> checklogin = new ArrayList<LoginMaster>();
		LoginMaster lm = null;
		Connection conn	= null;
		try
		{
			conn=dbconnectionmanager.getConnection("login");
			if(conn==null)
			{
				errorhandlers.log("Unable To Create Connection For checkLogin() method of operation class");
			}
			PreparedStatement ps;
			ResultSet ress;
			strSQL="select * from login_master where binary username=? AND binary password=?";
			ps=conn.prepareStatement(strSQL);
			ps.setString(1, username);
			ps.setString(2, password);
			ress=ps.executeQuery();
			if(ress.next())
			{
				lm = new LoginMaster();
				lm.setUid(ress.getInt("uid"));
				lm.setName(ress.getString("name"));
				lm.setUsername(ress.getString("username"));
				lm.setPassword(ress.getString("password"));
				checklogin.add(lm);
			}
			ress.close();
			ps.close();
			dbconnectionmanager.freeConnection("login", conn);
			return checklogin;
		}
		catch(Exception e)
		{
			dbconnectionmanager.freeConnection("login", conn);
			errorhandlers.log(e.getMessage()+
						" Class Name : Opertaion"+
						" Method Name: checkLogin()"+
						" 2 Parameters:");
			return checklogin;
		}
	}
}
