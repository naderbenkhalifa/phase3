<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="com.sportyshoes.utils.Constants"%>
<%@page import="com.sportyshoes.model.Category"%>
<%@page import="com.sportyshoes.model.Purchase"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="com.sportyshoes.model.User"%>
<%@page import="com.sportyshoes.utils.Factory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%!
     Date toDate(String dateStr){
		Date date=null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			sdf.setLenient(false);
			date=sdf.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
      long getDiffDays(Date startDate,Date endDate) {
		long CONST_DURATION_OF_DAY = 1000l * 60 * 60 * 24;
		if (startDate != null && endDate != null) {
			long timeDiff = endDate.getTime() - startDate.getTime();
			long numberOfDay = ((long) timeDiff / CONST_DURATION_OF_DAY);
			return numberOfDay;
		} else
			return 0;
	}
    boolean isEqualDate(Date date1,Date date2){
    	long diffOfDay =getDiffDays(date1,date2);
    	System.out.println("diffOfDay -> "+diffOfDay);
    	return diffOfDay==0;
    }
    
    %>
    <%
    // purchase bloc
    List<Purchase> purchases=Factory.getPurchaseDao().getAll();
    if(request.getParameter("action")!=null){
    	String action=(String)request.getParameter("action");
    	System.out.println("action -> "+action);
    	if(action.equals("search"))
        {
        	
        	final Integer categoryId=Integer.parseInt(request.getParameter("category").trim());
        	System.out.println("categoryId -> "+categoryId);
        	String strDate=request.getParameter("searchByDate");
        	final Date searchByDate=toDate(strDate);
        	System.out.println("searchByDate -> "+strDate);
        	
        	if((categoryId!=null) && (!categoryId.equals(0)))
        	{
        		purchases=purchases.stream()
        			.filter(u -> {return	u.getProduct().getCategory().getId().equals(categoryId);})
        			.collect(Collectors.toList());
        	}
        	if(searchByDate!=null){
        		purchases=purchases.stream()
            			.filter(p -> {return	isEqualDate(p.getPurchaseDate(),searchByDate);})
            			.collect(Collectors.toList());
        	}
        }
    }
    // category bloc
    List<Category> categoryList=null;    
    if(session.getAttribute(Constants.CATEGORY_LIST)!=null){
    	categoryList=(List<Category>)session.getAttribute(Constants.CATEGORY_LIST);
    }
    else{
    	categoryList=Factory.getCategoryDao().getAll();
    	session.setAttribute(Constants.CATEGORY_LIST,categoryList);
    }
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>purchase reports </title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div id="page">
		<jsp:include page="/pages/Menu.jsp" />

<br/>
		<div id="wrapper">

			<div id="header" class="m-3">
				<h3>purchase reports</h3>
			</div>
			
			<form action="<%=request.getContextPath( )%>/pages/purchase.jsp?action=search" method="POST">  
			<div class="row m-3">
			<div class="col-md-3 ">
			<input type="date" class="form-control" placeholder="Choose date" name="searchByDate" pattern="dd/MM/yyyy">
			</div>
			
			<div class="col-md-3 ">
 	<select class="custom-select" name="category">
 		<option value="0"> Choose category</option>
 		<%
		for(Category item :categoryList){
		%>
		 	<option value="<%= item.getId()%>"> <%=item.getName() %></option>
		<%
		}
		%>
 	</select>
 
 
  </div>
			<div class="col-md-4 text-left">
			<button type="submit" class="btn"> Search</button>			
			</div>			
			</div>
			</form>
			
			
			
			
			
		</div>


		<div id="container">

			<div id="content">

				<table class="table table-hover m-3">
               
					<tr>

						<th scope="col">Id</th>
						<th scope="col">Date</th>
						<th scope="col">Category name</th>
						<th scope="col">product name</th>

					</tr>
<tbody>
					<%
for(Purchase item :purchases){
%>
<tr>
<td> <%=item.getId() %></td>
<td> <fmt:formatDate value="<%=item.getPurchaseDate() %>" type="date" pattern="dd-MM-yyyy"/></td>
<td> <%=item.getProduct().getCategory().getName() %> </td>
<td> <%=item.getProduct().getName() %> </td>

</tr>
<%
}
%>
</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>