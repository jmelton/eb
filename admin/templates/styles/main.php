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


#other_top{
	background: url('images/site/other_bkgd.png')top left no-repeat;
    margin: 0;
    padding: 0; 
    width: 760px;
    height: 125px;
}
 
.index_lady{
	float: right;
}

.other_lady{
    position:absolute;
    right:260px;
    top:50px;
    z-index:1;
}

.other_login{
    position:absolute;
    right:280px;
    top:200px;
    z-index:2;
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

/* ============================== Share Form Pages ============================== */ 


#share_bars{ width: 760px; text-align: left; }
#share_top_bar{ height: 6px; }
#share_txt_bar{
	height: 26px;
    font: italic 16px arial;
    font-weight: bold; 
    padding: 6px 0 0 10px;
}
#form_col{
	display: inline;
    width: 550px;
    float: left;
    padding-right: 15px;
}
#share_info1{
    width: 760px;
    text-align: left;
    padding-bottom: 20px;
}
#share_info1 p{
	padding: 20px 20px 15px 20px;
    margin: 0; 
    font: normal 11px arial;   
}
#share_info2{
	text-align: left;
    overflow: hidden;
}
#ads_col{ 
	display: inline; 
    width: 170px; 
    float: left; 
    text-align: left;
    padding: 140px 0px 0 25px;
}


.info_header{
	padding: 6px 20px; 
    margin: 0;
    color: #FFF;
    font: bold 12px arial; 
}

.top_bar_aqua{ background-color: #90c9c1; }
.top_bar_pink{ background-color: #f66d86; }
.top_bar_yellow{ background-color: #fade53; color: #a554a0; }
.txt_bar_green{ background-color: #afcb31; color: #FFF; }
.txt_bar_yellow{ background-color: #fade53; color: #f66d86; }
.txt_bar_purple{ background-color: #a554a0; color: #FFF; }

.form_table{ padding: 0 20px; }
.form_table tr{
	text-align: left;
    vertical-align: top;
}
.form_table td{
	font: bold 11px arial;
    padding-right: 20px;
}
.form_table label{ color: #5580ce; }
.form_table input, .form_table textarea{
    padding: 4px;
}
.green_brdr{ border: 2px solid #afcb31; }
.pink_brdr{ border: 2px solid #f66d86; }
.purple_brdr { border: 2px solid #a554a0; }

.long_text{ width: 380px; }
.med_text { width: 270px; }

.txt_qnt{ width: 30px; }
.txt_unt{ width: 50px; }
.txt_ing{ width: 210px; }
.txt_pre{ width: 100px; }
.txt_ins{ width: 500px; height: 200px; }


/* ============================== Member Pages ============================== */ 

#member_bars{ width: 760px; text-align: left; }
#member_top_bar{ height: 6px; }
#member_txt_bar{
	height: 26px;
    font: italic 16px arial;
    font-weight: bold; 
    padding: 6px 0 0 10px;
}

/* ============================== Sign-Up Form Page ============================== */ 


#register_form{
	text-align: left;
    width: 500px;
    padding: 30px 0;
}
#register_form p{
	font: italic 13px arial;
    font-weight: bold; 
    color: #5580ce;
    margin: 0;
    padding: 8px 0;
}
#register_form label{
	font: italic 12px arial;
    font-weight: bold;
    color: #5580ce;    
}
.register_text { width: 200px; padding: 2px; margin-right: 20px; border: 2px solid #000; }
.top_bar_darkred{ background-color: #98343e; }
.txt_bar_pink{ background-color: #f66d86; color: #FFF; }


/* ============================== Login Form Page ============================== */ 

#login_wrapper{ 
	width: 550px; 
    text-align: left; 
    overflow: hidden; 
    padding-bottom: 50px; 
}
#login_wrapper p{ font: normal 11px arial; }

#login_form, #signup_form{
    display: inline;
    float: left;
    margin-right: 20px;
}

#login_box{
	background: url('images/site/login_bkgd.png') top left no-repeat;
    width: 244px;
    height: 106px;
    padding: 6px 5px;
}

#signup_box{
	background: url('images/site/signup_bkgd.png') top left no-repeat;
    width: 244px;
    height: 106px;  
    padding: 4px 5px;       
}

#login_box label{
	font: italic 11px arial; 
    font-weight: bold; 
    width: 50px;
}
#signup_box label{
	font: italic 11px arial; 
    font-weight: bold; 
    width: 50px;
    color: #FFF;
}

.box_header{ font: italic 13px arial; font-weight: bold; color: #5580ce; margin: 3px 0; }
.login_text{ width: 140px; margin: 2px 0; padding: 1px; border: 2px solid #000; }