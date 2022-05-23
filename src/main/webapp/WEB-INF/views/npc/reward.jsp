<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<table class="table table-hover table-striped table-bordered table-responsive" >
	<tr>
		<th width="100px" class="text-center">보통</th>
		<td width="400px">${dto.reward1 }</td>
	</tr>
	<tr>
		<th width="100px" class="text-center">관심</th>
		<td width="400px">${dto.reward2 }</td>
	</tr>
	<tr>
		<th width="100px" class="text-center">우호</th>
		<td width="400px">${dto.reward3 }</td>
	</tr>
	<tr>
		<th width="100px" class="text-center">신뢰</th>
		<td width="400px">${dto.reward4 }</td>
	</tr>
	<c:if test="${dto.reward5 != '-'}">
		<tr>
			<th width="100px" class="text-center">애정</th>
			<td width="400px">${dto.reward5 }</td>
		</tr>
	</c:if>
</table>