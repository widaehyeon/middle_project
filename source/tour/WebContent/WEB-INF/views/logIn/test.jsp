<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   String uId = request.getParameter("userId");
   String uPw = request.getParameter("userPw");
   // JDBC�� ����ؼ� DB���� ��������
   Class.forName("oracle.jdbc.driver.OracleDriver");
   String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
   Connection conn = DriverManager.getConnection(url, "team1_202208M", "java");
   Statement stmt = conn.createStatement();
   String sql = "SELECT MEM_ID FROM MEMBER WHERE MEM_ID = '" + uId + "' AND MEM_PW = '" + uPw + "'";
   
   stmt.executeQuery(sql);
   ResultSet rs = stmt.executeQuery(sql);
   
   //System.out.print(rs.next()); // boolean ������ ���� ������ Ȯ��
   
   if(rs.next()){
%>
      {"rst" : "ok"}
<%
   }else{
%>
      {"rst" : "fail"}      
<%
   }
%>