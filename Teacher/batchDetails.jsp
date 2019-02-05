<%@ page import="onLoad.*" %>
<% 
	String mid=(String)session.getAttribute("memberID");
	String cn=(String)session.getAttribute("cn");
	session.setAttribute("bn",request.getParameter("param"));
	String bn=(String)session.getAttribute("bn");
	
	
	Batchstud stud[]=Batchstud.getStudentList(request.getParameter("param"),cn);
	int cnt;
	for(cnt=0;cnt<20;cnt++)
	{
		if(stud[cnt]==null)
			break;
	}
	String sub1[]=Batchsub.getSubList(mid,bn,cn);
	int cnt1;
	for(cnt1=0;cnt1<20;cnt1++)
	{
		if(sub1[cnt1]==null)
			break;
	}
	String sub[]=new String[cnt];
	for(int j=0;j<cnt;j++)
	{
		sub[j]=new String();
		sub[j]=sub1[j];
	}
		
%>

<html>
    <head>
    <script>
    function go(a)
    	{
    		window.location.href="http://localhost:8080/Project/Teacher/batchDetails.jsp?param="+a.innerHTML;
    	}
    	function goassg(a)
    	{
    		window.location.href="http://localhost:8080/Project/Teacher/assgList.jsp?param="+a.innerHTML;
    	}
    </script>
        <style>
            .vertical-menu 
            {
                width: 120%;
                height: 100%;
                background-color: #C3C6C7;
                /* Set a width if you like */
            }

            .vertical-menu a 
            {
              /*background-color: #eee; Grey background color */
              color: black; /* Black text color */
              display: block; /* Make the Topics appear below each other */
              padding: 12px; /* Add some padding */
              text-decoration: none; /* Remove underline from Topics */
            }

            .vertical-menu a:hover 
            {
              background-color: #ccc; /* Dark grey background on mouse-over */
            }

            .vertical-menu a.active 
            {
              background-color: black; /*Add black color to active Topic*/
              color: white;
            }
            
            .fullWidth
            {
                width:100% !important;
                background-color: lightslategray;
            }
            
            .noPadding
            {
                padding-left: 0 !important;
                padding-right: 0 !important;
                padding-top: 0;
            }
           
            .noMargin
            {
                margin-left: 0 !important;
                margin-right: 0 !important;
                margin-top: 0 !important;
                margin-bottom: 0 !important;
            }
            
            .black
            {
            	color:black; !important 
            }
            
        </style>
        
        <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>View Batch</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="../Student/css/base.css">
    <link rel="stylesheet" href="../Student/css/vendor.css">
    <link rel="stylesheet" href="../Student/css/main.css">

    <!-- script
    ================================================== -->
    <script src="js/modernizr.js"></script>

    <!-- favicons
    ================================================== -->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="../favicon.ico" type="image/x-icon">
        
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    
    <body>
        <header class="s-header">
        <a class="header__toggle-menu" href="#0" title="Menu"><span>Menu</span></a>
        <nav class="header__nav-wrap">

            <h2 class="header__nav-heading h6">Navigate to</h2>

            <ul class="header__nav">
                <li><img src="logo.png"></li>
                <li class="current"><a href="index.jsp" title="">Home</a></li>
                <li class="has-children">
                    <a href="#0" title="">Menu</a>
                    <ul class="sub-menu">
                        <li><a href="profile.jsp">Profile</a></li>
                        <li><a href="../logout.jsp">Logout</a></li>
                    </ul>
                </li>
            </ul> <!-- end header__nav -->

            <a href="#0" title="Close Menu" class="header__overlay-close close-mobile-menu">Close</a>

        </nav> <!-- end header__nav-wrap -->

    </header> <!-- s-header -->
        <br><br><br><br>
        <div class="container fullWidth noPadding">
            <div class="row fullWidth">
                <div class="col-lg-2">
                    
                    <div class="vertical-menu">
                    <a href="index.jsp">Home</a>
                    <a href="class.jsp">View Batches</a>
                    <a href="batchDetails.jsp">Student List</a>
                    <a href="batchDetails.jsp">Assignments</a>
                    </div>
                </div>
                <br><br><br>
                <div class="col-lg-1">
                </div>
                
               <div class="col-lg-9">
               <table>
               <tr>
               <th>Roll NO</th>
               <th>Name</th> 
               </tr>
                   <!-- <h3>Entire list of batches alloted to memberID</h3><br><br> -->
                   <% for(int i=0;i<cnt;i++)
                   {
                   %>
                   <tr>
                   <td><%= stud[i].getrollno()   %></td>
                   <td><%= stud[i].getName()   %></td>
                   </tr>
                   <% } %>
                  </table>
                  <h4>Subjects</h4>
                  <% for(int i=0;i<cnt1;i++)
                   {
                   %>
                   <a href="#" onclick=" goassg(this); "><%= sub[i] %></a><br>
                   <% } %>
                </div>
                </div>
            </div>
        
    </body>
</html>