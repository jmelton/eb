{embed="includes/header"}

<div id="cc4kids_top">
	{embed="includes/email-signup" message="Parents sign up for notifications by entering your email address" margin="5"}
</div>
<div id="cckids_middle">
	<img src="{path='images/site'}ad_728x90.png" class="ad_space" /><br />
    <img src="{path='images/site'}cc4kids_rotw_bar.png" />
    <div id="cc4kids_main">
        {exp:weblog:entries weblog="eb_cc4kids" limit="1"} 
            <img src="{cc4k_char_image}" id="cc4kids_cal" />
            <div id="cc4kids_rotw">
                <a href="{path='cc4kids/printable'}{url_title}" target="_blank">
                <img src="{path='images/site'}cc4kids_printrecipe.png" align="right" /></a>
                <a href="{path='cc4kids/more-recipes'}">
                <img src="{path='images/site'}cc4kids_morerecipes.png" align="right" /></a>
                <br />
                <br />
                <br />
                <img src="{cc4k_main_image}" align="left" /><br />
                <p>{cc4k_recipe_summary}</p>
            </div>
        {/exp:weblog:entries} 
    </div>
    <div id="cc4kids_middle_ads">
        <img src="{path='images/site'}ad_125x125.png" class="ad_space" /><br />
        <img src="{path='images/site'}ad_125x125.png" class="ad_space" /><br />
    </div>
</div>
<div style="clear: both"></div>
{exp:weblog:entries weblog="eb_cc4kids" limit="1"} 
<div id="cc4kids_items">
    <p>First get everything ready to go! You will need the everything you see in the pictures below:</p>
    <div id="cc4kids_ingredients">
        <p>Ingredients for one serving</p>
        {cc4k_ingredients}
        <div class="cc4kids_ingredient"><img src="{ingredient_img}" /><br />
        	<span>{ingredient_details}</span>
        </div>
        {/cc4k_ingredients}
</div>
    <div id="cc4kids_tools">
        <p>Cooking Tools that you wil need for this recipe</p>
        {cc4k_tools}
        <div class="cc4kids_tool"><img src="{tool_img}" /><br />
        	<span>{tool_name}</span>
        </div>
        {/cc4k_tools}        
    </div>
</div>
{/exp:weblog:entries} 
<div id="cc4kids_bottom">
	<div id="cc4kids_safetytips">
    	<p class="bold">Before You Start...<br />read these really important safety tips!</p>
        <p>	1. Never cook without asking your Mom or Dad first!<br />
        	<br />
			2. Never turn on the stove or oven without adult supervision. <br />
            <br />
			3. Never use knives, blenders, mixers or any other dangerous kitchen tools by yourself.  You must have help from your Mom or Dad <br />
            <br />
			4. Meats and other foods can have harmful germs. An adult should always help you when cooking.<br /></p>
         <p class="bold">Smart Kids r Safe Kids </p>
    </div>
    <div id="cc4kids_directions">
		{exp:weblog:entries weblog="eb_cc4kids" limit="1"} 
    		<p class="header">Directions</p>
            <p class="note">Make certain that an adult is helping you with this recipe.</p>
            <div class="body">{cc4k_recipe_directions}</div>
            <br />
            <div>
                <a href="{path='cc4kids/printable'}{url_title}" target="_blank">
                <img src="{path='images/site'}cc4kids_printrecipe.png" align="right" /></a>
                <a href="{path='cc4kids/more-recipes'}">
                <img src="{path='images/site'}cc4kids_morerecipes.png" align="right" /></a>
                <br />
            </div>
		{/exp:weblog:entries} 
    </div>
    <div id="cck4ids_bottom_ad">
	    <img src="{path='images/site'}ad_170x600.png" /><br />
        <br />
    </div>
	<div style="clear: both"></div>
	<div id="cc4kids_bottom_bar"></div>
</div>

{embed="includes/footer"}