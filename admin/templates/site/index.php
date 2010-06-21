{embed="includes/header"}
<div id="index_top">
        {embed="includes/email-signup" message="sign up for  newletters & savings by entering your email address" margin="45"}
        <img src="{path='images/site'}eb_lady.png" class="index_lady" />
</div>
<div id="index_bottom">
	<div id="index_left">
    	<a href="{path='cc4kids'}"><img src="{path='images/site'}index_cc4kids.png" /></a>
        <br />
       	<img src="{path='images/site'}index_products.png" />
    </div>
    <div id="index_center">
    	<img src="{path='images/site'}index_howitworks.png" />
        <div id="index_searchbox">
        	<img src="{path='images/site'}index_planner.png" /><br />
           	<input type="text" id="search_terms" name="search_terms" value="Search for recipes" />
            <input type="submit" id="submit_search" name="submit_search" value="" />
        </div>
    </div>
    <div id="index_right">
    	<div id="index_loginbox">
        	{exp:member:login_form return="members/login"}
        	<input type="text" id="username" name="username" value="Username" /><br />
            <input type="text" id="password" name="password" value="Password" /><br />
            <input type="button" id="signup" name="signup" onclick="goPage(\'{path='members/login'}');" value="" />
            <input type="submit" id="submit_login" name="submit_login" value="" />
            {/exp:member:login_form}
        </div>
    	<a href="{path='recipes/share-a-recipe'}"><img src="{path='images/site'}index_share.png" /></a>
    </div>
</div>
<script>
function goPage(page){
	window.location = page;
}
</script>
{embed="includes/footer"}