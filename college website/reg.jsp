<style>
	body{background-image: linear-gradient(aquamarine,darkmagenta);}
	h2{color:crimson}

</style>
<%@page import="java.sql.*"%>
<%
String name=request.getParameter("name");
String sclass=request.getParameter("sclass");
String section=request.getParameter("section");
String roll=request.getParameter("roll");
String uname=request.getParameter("uname");
String password=request.getParameter("password");
String father=request.getParameter("father");
String mother=request.getParameter("mother");
String gender=request.getParameter("gender");
String dob=request.getParameter("dob");
String blood=request.getParameter("dropdown");
String phone=request.getParameter("phone");
String email=request.getParameter("email");
String address=request.getParameter("address");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
	PreparedStatement ps=conn.prepareStatement("Insert into studentreg values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,sclass);
	ps.setString(3,section);
	ps.setString(4,roll);
	ps.setString(5,uname);
	ps.setString(6,password);
	ps.setString(7,father);
	ps.setString(8,mother);
	ps.setString(9,gender);
	ps.setString(10,dob);
	ps.setString(11,blood);
	ps.setString(12,phone);
	ps.setString(13,email);
	ps.setString(14,address);
	
	int x=ps.executeUpdate();
	if(x!=0)
	{
		out.print("<center><h2>registration done successfully</h2></center>");
	}else{
		out.print("<center><h2>Something went wrong</h2></center>");
	}
}catch(Exception e){
out.print(e);
}

%>