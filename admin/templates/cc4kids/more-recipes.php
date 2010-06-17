{embed="includes/header"}

<div id="cc4kids_top">
	{embed="includes/email-signup" message="Parents sign up for notifications by entering your email address" margin="5"}
</div>
<div id="cckids_middle">
    <img src="{path='images/site'}cc4kids_mrfc_bar.png" /><br />             
	<div style="clear: both"></div> 
	<div id="cckids_more_left">
        {exp:weblog:entries weblog="eb_cc4kids" limit="1"} 
        <img src="{cc4k_char_image}" id="cc4kids_cal" />
        {/exp:weblog:entries}    
        <div id="cc4kids_safetytips2">
            <p class="top">Before You Start...<br />read these really important <br />safety tips!</p>
            <p>	1. Never cook without asking your Mom or Dad first!<br />
                <br />
                2. Never turn on the stove or oven without adult supervision. <br />
                <br />
                3. Never use knives, blenders, mixers or any other dangerous kitchen tools by yourself.  You must have help from your Mom or Dad <br />
                <br />
                4. Meats and other foods can have harmful germs. An adult should always help you when cooking.<br /></p>
             <p class="btm">Smart Kids r Safe Kids </p>
        </div>        
	</div>
    <div id="cc4kids_main">  
        <div id="cc4kids_rotw" style="min-height: 720px;">
            <a href="{path='cc4kids'}"><img src="{path='images/site'}cc4kids_backto.png" align="right" /><br /></a>
            <br />
            {exp:weblog:entries weblog="eb_cc4kids" limit="5"} 
			<div class="cc4kds_week_of">Week of {cc4k_week_of}</div>
            <img src="{cc4k_main_image}" align="right" /><br />
            {/exp:weblog:entries}    
        </div>
    </div>
    <div id="cc4kids_middle_ads">
        <img src="{path='images/site'}ad_125x125.png" class="ad_space" /><br />
        <img src="{path='images/site'}ad_125x125.png" class="ad_space" /><br />
        <img src="{path='images/site'}ad_125x125.png" class="ad_space" /><br />        
        <img src="{path='images/site'}ad_125x125.png" class="ad_space" /><br />        
        <img src="{path='images/site'}ad_125x125.png" class="ad_space" /><br />        
    </div>
   
</div>
{embed="includes/footer"}