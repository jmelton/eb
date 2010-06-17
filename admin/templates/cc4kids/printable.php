{embed="includes/header"}

{exp:weblog:entries weblog="eb_cc4kids" limit="1" url_title="{segment_3}"} 

<div id="cc4kids_print_wrap">
    <div id="cc4kids_print_top">
        <img src="{cc4k_char_image}" id="cc4kids_cal" align="left" style="padding-right: 20px;" />
        <img src="{cc4k_title_image}" /><br />
        <div class="tools_text">Cooking Tools that you wil need for this recipe</div>
        <div id="cc4kids_print_tools">
            {cc4k_tools}
            <div>
                <img src="{tool_img}" /><br />
                <span>{tool_name}</span>
            </div>
            {/cc4k_tools}                	
        </div>
    </div>
    <div style="clear: both"></div>
    <div id="cc4kids_print_middle">
        <div id="cc4kids_print_ingredients">
            <p>Ingredients for one serving</p>
            {cc4k_ingredients}
            <div class="cc4kids_print_ingredient"><img src="{ingredient_img}" /><br />
                <span>{ingredient_details}</span>
            </div>
            {/cc4k_ingredients}
        </div>
    </div>
    <div style="clear: both"></div>   
    <div id="cc4kids_print_bottom">
        <div id="cc4kids_print_directions">
            <p class="header">Directions</p>
            <p class="note">Make certain that an adult is helping you with this recipe.</p>
            <div class="body">{cc4k_recipe_directions}</div>
        </div>
    </div>
</div>
{/exp:weblog:entries} 


{embed="includes/footer-print"}