<style>
    table
    {
                background-color: aqua;
                background-image: linear-gradient(white,aqua);
                border-radius: 2ch;
    }
    body
            {
                background-color: red; 
                background-image: linear-gradient(red, blue);
            }

    table
           {
                padding-top: 40px;
                padding-bottom: 50px;
                padding-left: 60px;
                padding-right: 70px;
            }
     tr,td,th
            {
                 border-color:black;
                 border-radius: 2ch;
                 background-color: yellow;
                 background-image: linear-gradient(white,yellow);
                 padding-left: 10px;
                 padding-right: 10px;
            }
    
    
</style>

<%@ page import="java.sql.*"%>
<%
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","root");
	String piid=request.getParameter("roll");
    
    Statement stmt = con.createStatement();
    ResultSet flag=stmt.executeQuery(" select * from studentreg where r_no='"+piid+"'    ");

    if(flag.next())
    {
        ResultSet rs=stmt.executeQuery(" select * from studentreg where r_no='"+piid+"'  ");
        ResultSetMetaData rsmd=rs.getMetaData();
        int colCount=rsmd.getColumnCount();
        out.print("<center><table><tr>");
        for(int i=1;i<=colCount;i++)
        out.print("<td><b>"+rsmd.getColumnLabel(i)+"</b></td>");
        out.print("</tr>");
        while(rs.next())
        {
            out.print("<tr>");
            for(int i=1;i<=colCount;i++)
            out.print("<td>"+rs.getString(i)+"</td>");
            out.print("</tr>");
        }
        out.print("</table></center>");
        rs.close();
    }
    else
    {
        out.print("<center><h2>No data exist</h2></center>");
    }
    flag.close();
    con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>