<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><decorator:title default="sky"/></title>
    <decorator:head />
    <!-- header -->
    <!-- //header -->
</head>
<body>
    <!-- UI Object -->
            <jsp:include page="/WEB-INF/jsp/decorators/header.jsp" />
            <decorator:body/>
        <div id="footer">
        	<jsp:include page="/WEB-INF/jsp/decorators/footer.jsp" />
        </div>
    <!-- //UI Object -->
</body>
</html>
