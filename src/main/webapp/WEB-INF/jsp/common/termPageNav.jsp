<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 

<nav aria-label="Page navigation">
			  <ul class="pagination">
			    <li ${page.pageNum ==1 ? 'class="disabled"' : ''}>
			      <a href="/term_all?page=${page.pageNum -1 < 1 ? 1:page.pageNum-1 }" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			      <c:forEach begin="${page.pageNum-2 < 1 ? 1:page.pageNum - 2 }"
			      		end="${page.pageNum+2 > page.pages ? page.pages : page.pageNum+2 }" var="num"> 
			      	<li ${page.pageNum == num ? 'class="active"' : '' }>
			      		<a href="/term_all?page=${num }">${num }</a>
			      	</li>
			      </c:forEach>
			    <li ${page.pageNum == page.pages ? 'class="disabled"' : '' }>
			    	<a href="/term_all?page=${page.pageNum+1 > page.pages ? page.pages : page.pageNum+1 }" aria-label="Next">
			    	<span aria-hidden="true">&raquo;</span>
			    	</a>
			    	</li>
			  </ul>
			
			<p>总条数：${page.total } 》
			       总页数：${page.pages } 》
			    当前页：${page.pageNum }			   
			 </p>
</nav>