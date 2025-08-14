<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    session.invalidate(); // clear all session variables
    response.sendRedirect("admin_login.jsp");
%>
