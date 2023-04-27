<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,molu.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String JUMIN = request.getParameter("JUMIN");//;lsdkfjgl;kjsdkflgjklsfdj
String NAME = request.getParameter("NAME");
String NUMBER = request.getParameter("NUMBER");
String TIME = request.getParameter("TIME");
String AREA = request.getParameter("AREA");
String CHECK = request.getParameter("CHECK");

boolean result= false;
			Connection con = null;
			PreparedStatement pstmt = null;
			//ResultSet rs = null;
					try {		
						Class.forName("oracle.jdbc.driver.OracleDriver");	
						 con = DriverManager.getConnection(	
							"jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
						String sql = "insert into tbl_vote_202005 values(?,?,?,?,?,?)";
						 pstmt = con.prepareStatement(sql);
						 pstmt.setString(1,request.getParameter("JUMIN"));
						 pstmt.setString(2,request.getParameter("NAME"));
						 pstmt.setString(3,request.getParameter("NUMBER"));
						 pstmt.setString(4,request.getParameter("TIME"));
						 pstmt.setString(5,request.getParameter("AREA"));
						 pstmt.setString(6,request.getParameter("CHECK"));
						 pstmt.executeUpdate();
						result = true;
					}catch(Exception e) {		
						e.printStackTrace();	
					}finally {		
						try {	
							con.close();
							pstmt.close();
							//rs.close();
						}catch(Exception e) {}	
					}		
					if(result){
						%>
						<script type="text/javascript">
							alert("투표하기 정보가 정상적으로 등록되었습니다!");
							location="index.jsp";						
						</script>
						<%
					}else{
						%>
						<script type="text/javascript">
							alert("투표실패!");
							location="index.jsp";
						</script>
						<%						
					}
			%>
</body>
</html>