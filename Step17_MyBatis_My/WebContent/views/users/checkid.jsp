<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
{"canUse":${requestScope.canUse}}

<%
	// canUse라는 키값으로 사용할 수 있으면 true, 없으면 false
%>