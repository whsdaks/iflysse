<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<nav aria-label="Page navigation">
  <ul class="pagination">
    <li ${page.pageNum == 1 ? 'class="disabled"' : '' }>
      <a href="courselist?page=${page.pageNum-1 < 1 ? 1 : page.pageNum -1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <c:forEach begin="${page.pageNum - 2 < 1 ? 1 : page.pageNum - 2 }" 
    	end="${page.pageNum + 2 > page.pages ? page.pages : page.pageNum + 2 }" var="num">
    	<li ${page.pageNum == num ? 'class="active"' : '' }>
    		<a href="/courselist?page=${num }">${num }</a>
    	</li>
    </c:forEach>
    <li ${page.pageNum == page.pages ? 'class="disabled"' : '' }>
      <a href="courselist?page=${page.pageNum + 1 > page.pages ? page.pages : page.pageNum + 1 }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
  <p>总条数：${page.total } 
	总页数：${page.pages } 
	当前页 ：${page.pageNum } 
	每页大小：${page.pageSize }
  </p>
</nav>