<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap2.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/button.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/header.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/feed.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/card.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/image.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/divider.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/list.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/icon.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/navbar.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/menu.css">
  
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/page.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css">
</head>
<body>
	<%@ include file="../topbar.jsp" %>
	<div class="container">
    <div class="row">  
          <div class="span8">    
				  <div class="tagheader">
				  	<div class="content">
				  		 标签
				  	</div>
				  	<div class="ui mini basic button">
				  		 已关注
				  	</div>
				  </div>              
                  <div class="ui feed">
                   <c:forEach items="${feeds }" var="feed"> 
                   <!-- new post -->
                    <c:if test="${feed.object_type == 0 }">
                    <div class="event">
                      <div class="label">
                      	<c:if test="${feed.user_avatar == 'default-avatar' }">
                        	<img src="${imgBaseUrl }/default-avatar.jpg">
                        </c:if>
                        <c:if test="${feed.user_avatar != 'default-avatar' }">
                        	<img src="${imgBaseUrl }/${feed.user_avatar }">
                        </c:if>
                      </div>
                      <div class="content">
                        <div class="summary">
                          <a>${feed.user_id }</a> 发表了日志
                          <div class="date">
                            ${feed.ts }
                          </div>
                        </div>
                        <div class="extra">
                          <div class="postheader">
                            <a href="<c:url value="/post/${feed.object_id }" />">${feed.title }</a>
                          </div>
                          ${feed.summary }
                        </div>
                        <div class="meta">
                          <div class="tags">
                        	<i class="tag icon"></i>
                        	<c:forEach items="${feed.tags }" var="tag">
                        		<a href="#">${tag }</a>
                        	</c:forEach>
						  </div>							                     	
                          <div class="actions">
							  <a class="comment">
	                            <i class="comment outline icon"></i> ${feed.comment_count }
	                          </a>                           
	                          <a class="like">
	                            <i class="like icon"></i> ${feed.like_count } 
	                          </a>                          
                          </div>

                        </div>                                               
                        <div class="ui divider"></div>
                      </div>
                    </div>                    	
                    </c:if>
                    
                    <!-- new album -->
                    <c:if test="${feed.object_type == 2 }">
                    <div class="event">
                      <div class="label">
                        <img src="img/avatar.png">
                      </div>
                      <div class="content">
                        <div class="summary">
                          <a>${feed.user_id }</a> added <a href="<c:url value="/album/${feed.object_id }" /> ">2 new illustrations</a>
	                      <div class="date">
	                        ${feed.ts }
	                      </div>                          
                        </div>
                        <div class="extra images">
                          <c:forTokens items="${feed.content }" delims=":" var="img">
                          	<a href="<c:url value="/album/${feed.object_id }/photos" />"><img alt="" src="${imgBaseUrl }${img }"></a>
                          </c:forTokens>
                        </div>
                        <div class="extra">${feed.summary }</div>
                        <div class="meta">
                          <c:if test="${not empty feed.tags }">	
	                          <div class="tags">
	                        	<i class="tag icon"></i>
	                        	<c:forEach items="${feed.tags }" var="tag">
	                        		<a href="#">${tag }</a>
	                        	</c:forEach>
							  </div> 
						  </c:if>                       
                          <div class="actions">
							  <a class="comment">
	                            <i class="comment outline icon"></i> ${feed.comment_count }
	                          </a>                           
	                          <a class="like">
	                            <i class="like icon"></i> ${feed.like_count } 
	                          </a>                          
                          </div>
                        </div>
                        <div class="ui divider"></div>
                      </div>
                    </div>                    
                    
                    
                    </c:if>
                                    
                  </c:forEach>                                       
                  </div>  <!--end feed -->
            </div> <!-- end span8  -->
          <div class="span4">
          	<div id="rightside">
				<div class="ui header">热门用户</div>
				<div class="ui divider"></div>
				<div class="ui divided list">
				     <div class="item">
				     <div class="right floated compact ui button">Add</div>
				      <img class="ui avatar image" src="../img/avatar.jpg">
				      <div class="content">
				      <a class="header">Daniel Louise</a>
				      <div class="description"><a>Arrested </a></div>
					    </div>
					  </div>
					  <div class="item">
					    <div class="right floated compact ui button">Add</div>
					    <img class="ui avatar image" src="/images/avatar/small/joe.jpg">
					    <div class="content">
					      <div class="header">Joe Henderson</div>
					    </div>
					  </div>
					</div>				
					
					<div class="ui header">热门标签</div>
					<div class="ui divider"></div>
					<div class="ui divided list">
					  <div class="item">
					    <div class="right floated compact ui button">Add</div>
					    <i class="tag icon"></i>
					    <div class="content">
					      <a class="header">Daniel Louise</a>
					      <div class="description"><a>Arrested </a></div>
						    </div>
						  </div>
						  <div class="item">
						    <div class="right floated compact ui  yellow button">Add</div>
						    <i class="tag icon"></i>
						    <div class="content">
						      <div>Joe Henderson</div>
						    </div>
						  </div>
						</div>		
				
				
	            

            </div>           
          </div>
        </div>
      </div>


    </div>

  </div>

</body>
</html>