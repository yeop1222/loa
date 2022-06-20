<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${error }">
	<script>
		alert("캐릭터당 군단장 주 3회 제한\n리허설 데자뷰는 원정대당 주 1회 제한");
		window.location = "/?charOpt=${charOpt}&charOpt2=${charOpt2}&wonOpt=${wonOpt}";
	</script>
</c:if>
<c:if test="${!error }">
	<c:redirect url="/?charOpt=${charOpt}&charOpt2=${charOpt2}&wonOpt=${wonOpt}"/>
</c:if>