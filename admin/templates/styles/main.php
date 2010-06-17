@charset "utf-8";
/* CSS Document */

/* ============================== Basic Formatting ============================== */

a { text-decoration: none; }
a img{ border: none }

body{ padding: 0; margin: 0; }

/* ============================== General Styles ============================== */ 

#page_wrapper{
	width: 760px; 
    height: 100%; 
    margin: 0 auto;
    text-align: center;
}

#user_logged_in{ 
    margin: 8px 0; 
    padding: 4px 8px; 
    font: bold 11px arial; 
    color: #000;
}
#user_logged_in a { font: bold 11px arial; color: #000; }

#footer_nav_top{ 
	width: 760px; 
    background-color: #49dacf; 
    list-style-type: none; 
    padding: 4px 0; 
    margin: 0; 
	text-align: center;
}
#footer_nav_top li{
	display: inline; 
    padding: 0;
    margin: 0;
    font: bold 12px arial;
    color: #FFF; 
}
#footer_nav_top li a{ color: #FFF; }

#footer_nav_bottom{ 
	width: 760px; 
    list-style-type: none; 
    padding: 4px 0; 
    margin: 0; 
	text-align: center;
}
#footer_nav_bottom li{
	display: inline; 
    padding: 0;
    margin: 0; 
    font: bold 12px arial;   
	color: #49dacf;     
}
#footer_nav_bottom li a{ color: #49dacf; }


#emailbox{ float: left; width: 180px; }
#emailbox span{ font: normal 10px verdana; display: block; margin: 3px 0; }
#emailbox #email_address{
	background: url('images/site/input_email.png') top left no-repeat;
    width: 136px;
    height: 32px;
   	padding: 0 0 0 2px;
    margin: 0;
    border: none;
    font-style: italic;
    color: #999;	
}
#emailbox #submit_email{
	background: url('images/site/button_go_aqua.png') top left no-repeat;
    width: 29px;
    height: 29px;
    padding: 0; 
    margin: 0;
    border: none;
}

.ad_space{ margin: 5px; }

/* ============================== Index Page ============================== */ 

#index_top{
	background: url('images/site/index_bkgd.png')top left no-repeat;
    margin: 20px 0 0 0;
    width: 760px;
    height: 145px;
}
#index_bottom{
    width: 760px;
    height: 400px;
   
}

#index_left{
	margin: 20px 0 0 0;
	width: 186px;
    float: left;
    display: inline;
    text-align: center;
}
#index_left img{
	margin: 5px 0;
}

#index_center{
	margin: 20px 0 0 0;
	width: 380px; 
    float: left;
    display: inline; 
    text-align: center;  
}
#index_center img{
	margin: 5px 0;
}

#index_right{
	margin: 20px 0 0 0;
	width: 186px;
    float: left;
    display: inline; 
    text-align: center;    
}

#index_searchbox{ margin: 5px 0 0 0; }
#index_searchbox #search_terms{
	background: url('images/site/input_search.png') top left no-repeat;
    width: 162px;
    height: 31px;
   	padding: 0 0 0 2px;
    margin: 0;
    border: none;
    font-style: italic;
    color: #999;	
}
#index_searchbox #submit_search{
	background: url('images/site/button_go_pink.png') top left no-repeat;
    width: 29px;
    height: 29px;
    padding: 0; 
    margin: 0;
    border: none;
}


#index_loginbox{ margin: 0 10px 15px; 0; text-align: right; }
#index_loginbox #username, #index_loginbox #password{ 
	background: url('images/site/input_login.png') top left no-repeat;
    width: 162px;
    height: 31px;
    padding: 0 0 0 2px;
    margin: 2px 0;
    border: none;
    font-style: italic;
    color: #999;
}
#index_loginbox #signup{
	background: url('images/site/button_signup.png') top left no-repeat;
    width: 67px;
    height: 29px;
    padding: 0; 
    margin: 0;
    border: none;
}
#index_loginbox #submit_login{
	background: url('images/site/button_go_red.png') top left no-repeat;
    width: 29px;
    height: 29px;
    padding: 0; 
    margin: 0;
    border: none;
}
 
.index_lady{
	float: right; 
}

