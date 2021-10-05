
<%@page import="java.util.Optional"%>
<%@page import="com.sportyshoes.model.Category"%>
<%@page import="com.sportyshoes.utils.Constants"%>
<%@page import="com.sportyshoes.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.sportyshoes.dao.ProductDao"%>
<%@page import="com.sportyshoes.utils.Factory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%!
    Product getProductOfList(List<Product> productList,Integer id){
    	Product result=null;
    	Optional<Product> foudItem=productList.stream().filter(c -> c.getId()==id).findFirst();
    	if(foudItem.isPresent()) result=foudItem.get();	
    	return result;
    }
    Category getCategoryOfList(List<Category> categoryList,Integer id){
    	Category result=null;
    	Optional<Category> foudItem=categoryList.stream().filter(c -> c.getId()==id).findFirst();
    	if(foudItem.isPresent()) result=foudItem.get();	
    	return result;
    }
    %>
<%

String contextPath=request.getContextPath();

ProductDao dao=Factory.getProductDao();
List<Product> products=null;
List<Category> categoryList=null;

if(session.getAttribute(Constants.PRODUCT_LIST)!=null){
	products=(List<Product>)session.getAttribute(Constants.PRODUCT_LIST);
}
if(session.getAttribute(Constants.CATEGORY_LIST)!=null){
	categoryList=(List<Category>)session.getAttribute(Constants.CATEGORY_LIST);
}


if(request.getParameter("action")==null){

}
String action=(String)request.getParameter("action");
System.out.println("Action -> "+action);
switch(action){
case "load":
	products=dao.getAll();
	session.setAttribute(Constants.PRODUCT_LIST, products);
	categoryList=Factory.getCategoryDao().getAll();
	session.setAttribute(Constants.CATEGORY_LIST, categoryList);
	break;
case "add":
	
	Product newItem=new Product();
	newItem.setName(request.getParameter("name"));
	newItem.setDescription(request.getParameter("description"));
	newItem.setPrice(Double.valueOf(request.getParameter("price")));
	
	final Integer categoryId=Integer.parseInt(request.getParameter("category").trim());
	Category selectedCategory=getCategoryOfList(categoryList, categoryId);
// 	Optional<Category> selectedCategory=categoryList.stream().filter(c -> c.getId()==categoryId).findFirst();
// 	if(selectedCategory.isPresent()) 
	newItem.setCategory(selectedCategory);	
	dao.add(newItem);
	products.add(newItem);
	
	break;
case "delete":
	if(request.getParameter("id")!=null){
		String idStr=request.getParameter("id");
		
		Integer id=Integer.parseInt(idStr.trim());
		
		dao.delete(id);
		Product item=getProductOfList(products, id);
		products.remove(item);
	}
	
	break;
case "update":
	
	if(request.getParameter("id")!=null){
		String idStr=request.getParameter("id");	
		Integer id=Integer.parseInt(idStr.trim());
		
		
		Product item=getProductOfList(products, id);
// 		item.setId(id);
		item.setName(request.getParameter("name"));
		item.setDescription(request.getParameter("description"));
		item.setPrice(Double.valueOf(request.getParameter("price")));
		dao.update(item);
// 		products.remove(item);
// 		products.add(item);
	}
	break;

}
String url=String.format("/pages/products.jsp");
System.out.println("productController: url: "+url);
%>
<jsp:forward page="<%=url%>"></jsp:forward>
