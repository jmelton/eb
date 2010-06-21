{if logged_in}
    {embed="includes/header"}
    <div id="other_top">
        {embed="includes/email-signup" message="sign up for  newletters & savings by entering your email address" margin="45"}
        <img src="{path='images/site'}eb_lady.png" class="other_lady" />
    </div>
    <div id="member_tabs">
    {if segment_3 !=''}<ul id="{segment_3}">{/if}
    {if segment_3 ==''}<ul id="tab_main">{/if}
    	<li class="tab_pref"><a href="{path='members'}{username}/my-preferences">My Preferences</a></li>
        <li class="tab_rate"><a href="{path='members'}{username}/rate-recipes">Rate Recipes</a></li>
        <li class="tab_save"><a href="{path='members'}{username}/saved-recipes">Saved Recipes</a></li>
    </ul>
	<div style="clear: both"></div>  
    </div>
    <div id="member_bars">
        <div id="member_top_bar" class="top_bar_darkred"></div>
        <div id="member_txt_bar" class="txt_bar_pink">{username}'s Profile</div>
    </div>
    {embed="includes/footer"}
{/if}
{if logged_out}
	<meta http-equiv="refresh" content="0;url={path='members/login'}">
{/if}