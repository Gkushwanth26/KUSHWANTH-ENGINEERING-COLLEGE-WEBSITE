<style>
	body{
		background-image: linear-gradient(lavender,blue);
	}
	h2{color:crimson}
</style>
<%@page import="java.sql.*"%>
<%
String name=request.getParameter("fname");
String id=request.getParameter("fid");
String fd=request.getParameter("fd");
String fs=request.getParameter("fs");
String fp=request.getParameter("fp");
String fe=request.getParameter("fe");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
	PreparedStatement ps=conn.prepareStatement("Insert into facul values(?,?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,id);
	ps.setString(3,fd);
	ps.setString(4,fs);
	ps.setString(5,fp);
	ps.setString(6,fe);

	int x=ps.executeUpdate();
	if(x!=0)
	{
		out.print("<center><h2>Registration done successfully</h2></center>");
	}else{
		out.print("<center><h2>No data exist</h2></center>");
	}
}catch(Exception e){
out.print(e);
}

%>