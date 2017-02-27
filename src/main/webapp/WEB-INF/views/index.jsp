<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@ include file="../templates/head-meta.jsp"%>


</head>
<style>
.nav{
background-color:#cc0000;
}

hr {
    top:40px;
    height: 10px;
    color: #123455;
    background-color: #cc0000;
     border: none;
}
body {
    background-color: 
    background-repeat: repeat-x;
}


.53jh {
    background-color:#b30000;
    border-bottom: 1px solid #133783;
    min-height: 42px;
}


.back{
    height: 95px;
    min-width: 980px;
    background-color:#b30000;
}


label {
    color: #fff;
    font-weight: normal;
    padding-left: 1px;
}

table {
    display: table;
    border-collapse: separate;
    border-spacing: 5px;
    border-color: grey;
}
div{
display:block;}

}

</style>
 
 
<body style="background-color:  ;" >


<div class="53jh">
 <div class="back">
   <div class="inline back">

       <div class="left" style="float:left; margin:10px;">
            <h1 STYLE="COLOR:WHITE;"><img
				src="${pageContext.request.contextPath}/resources/images/22.png"
				alt="logo" width="50" height="50">AMIGOS</span></h1>
                
       </div>

       <div class="right">
              <form action="login" method="post">
                 <div class="input-group" style="float:right;padding:10px;">
                   <table>
                     <tbody>
                         <tr>
                           <td class="email">
                             <label style="color:white;">Email</label>
                           </td>
                           <td class="password">
                             <label style="color:white;">Password</label>
                          </td>

                         </tr>
                         <tr>
                            <td>
                              <input id="msg" type="text" class="form-control" name="username" placeholder="Enter email">
                            </td>
                            <td>
                               <input type="password" class="form-control" name="password" placeholder="Enter password">
                            </td>
                            <td class="button">
                               <input type="submit" value="Login" class="btn btn-danger" style="width:100%;"/></td>
                         </tr>
                    </tbody>
                   </table>
               </div>
             </form>
       </div>
  </div>
</div>
</div>


		<div class="col-md-12">
			<div class="col-md-6">

				<c:if test="${param.error != null}">
					<p class="alert alert-danger">
						<span><b>TRY AGAIN!</b> Invalid Email or password.</span>
					</p>
				</c:if>
				<c:if test="${param.logout != null}">
					<p class="alert alert-success">
						<span>You have been logged out successfully.</span>
					</p>
				</c:if>

			</div></div>
 			<div class="col-md-6" >
			</div>
	



	<div class="container">
	<div class="col-md-8">
	<br>
	<br><br><br><br>
			 <center><img src="${pageContext.request.contextPath}/resources/images/4.jpg" class="img-rectangle"
				alt="image" style="height:100%;width:100%;" /><center>
		</div>
	
		<h2  style="color:black;font-family:arial;">SIGN UP</h2>
		<h4>It only takes<strong> 2 seconds</strong>...</h4>
		<br>
		<div class="col-md-4">

			<div>
				<c:if test="${not empty passwordmismatch}">
					<p class="alert alert-danger">
						<b>OOPS!</b>&nbsp Password Does't Match
					</p>
				</c:if>

				<c:if test="${not empty useralreadyexists}">
					<p class="alert alert-danger">
						<b>OOPS!</b>&nbsp Username Already Exists
					</p>
				</c:if>

				<c:if test="${not empty success}">
					<p class="alert alert-success">
						<b>GREAT</b>&nbsp Account Created Successfully
					</p>
				</c:if>
			</div>

			<form:form action="${pageContext.request.contextPath}/adduser" method="post" modelAttribute="user">

				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-user fa-lg"
						aria-hidden="true"></i></span>
					<form:input type="text" path="username" class="form-control"
						placeholder="Enter your name" style="width:70%;"/>
						
					<span class="text text-danger"><form:errors path="username" /></span>
						
				</div>
				


				<div class="input-group" style="margin-top: 20px">
					<span class="input-group-addon"><i class="fa fa-envelope "
						aria-hidden="true"></i></span>
					<form:input type="email" class="form-control" path="email"
						placeholder="Enter your email Id" style="width:70%;" />
				</div>
				<span class="text text-danger"><form:errors path="email" /></span>


				<div class="input-group" style="margin-top: 20px">
					<span class="input-group-addon"><i class="fa fa-lock fa-lg"
						aria-hidden="true"></i></span>
					<form:input type="password" path="password" class="form-control"
						placeholder="Enter your password" style="width:70%;"/>
				</div>
				<span class="text text-danger"><form:errors path="password" /></span>


				<div class="input-group" style="margin-top: 20px">
					<span class="input-group-addon"><i class="fa fa-lock fa-lg"
						aria-hidden="true"></i></span>
					<form:input type="password" path="cpassword" class="form-control"
						placeholder="Confirm your password" style="width:70%;" />
				</div>

				<div class="input-group" style="margin-top: 20px">
					<span class="input-group-addon"><i
						class="fa fa-map-marker fa-lg" aria-hidden="true"></i></span>
					<form:input type="text" class="form-control" path="city"
						placeholder="Enter your city" style="width:70%;" />
				</div>

				<div class="input-group" style="margin-top: 20px">
					<span class="input-group-addon"><i class="fa fa-calendar "
						aria-hidden="true"></i></span>
					<form:input type="date" class="form-control" path="dob"
						placeholder="Enter your Date Of Birth" style="width:70%;" />
				</div>

				<div class="input-group" style="margin-top: 20px">
					<span class="input-group-addon"><i class="fa fa-phone "
						aria-hidden="true"></i></span>
					<form:input type="text" class="form-control" path="phone"
						placeholder="Enter the mobile number" style="width:70%;" />
				</div>
				<span class="text text-danger"><form:errors path="phone" /></span>

				<div class="input-group" style="margin-top: 20px;">
					<label class="radio-inline" style="color:black;"> <form:radiobutton 
					path="gender" value="Male" />Male</label> <label class="radio-inline" style="color:black;"> <form:radiobutton
							path="gender" value="Female" />Female
					</label>
				</div>

				<div style="margin-top: 20px">
					<input type="submit" value="Sign Up"
						class="btn btn-danger btn-block" style="width:20%;" />
				</div>

			</form:form>
		</div> 
	</div>
	
	
	
	
<%-- <video width="1500" height="700" controls>
  <source src="${pageContext.request.contextPath}/resources/videos/v3.mp4" type="video/mp4">
 
  Your browser does not support the video tag.
</video>

		 --%>

	<%@ include file="../templates/footer.jsp"%>
</body>
</html>