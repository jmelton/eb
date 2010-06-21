{if logged_in}
    {embed="includes/header"}
    <div id="other_top">
            {embed="includes/email-signup" message="sign up for  newletters & savings by entering your email address" margin="45"}
            <img src="{path='images/site'}eb_lady.png" class="other_lady" />
    </div>
    <div id="share_bars">
        <div id="share_top_bar" class="top_bar_aqua"></div>
        <div id="share_txt_bar" class="txt_bar_green">Share a Recipe</div>
    </div>
    <div id="form_col">
        <div id="share_info1">
            <p>Do you have a favorite recipe that will make a great Easy Breezy Dinner? We are excited to know what it is.</p>
            <table class="form_table">
              <tr>
                <td><label>Name</label></td>
                <td><input type="text" class="long_text green_brdr" /></td>
              </tr>
              <tr>
                <td><label>Email Address</label></td>
                <td><input type="text" class="long_text green_brdr" /></td>
              </tr>
            </table>
        </div>
        <div style="clear: both"></div>
        <div id="share_info2">
            <h1 class="info_header top_bar_aqua">Recipe Ingredients</h1>
            <br />
            <table class="form_table">
              <tr>
                <td><label class="lbl_header">Quantity</label></td>
                <td><label class="lbl_header">Unit</label></td>
                <td><label class="lbl_header">Ingredient</label></td>
                <td><label class="lbl_header">Preperation</label></td>
              </tr>
              <tr>
                <td><input type="text" class="txt_qnt green_brdr" /></td>
                <td><input type="text" class="txt_unt green_brdr" /></td>
                <td><input type="text" class="txt_ing green_brdr" /></td>
                <td><input type="text" class="txt_pre green_brdr" /></td>
              </tr>
              <tr>
                <td><input type="text" class="txt_qnt green_brdr" /></td>
                <td><input type="text" class="txt_unt green_brdr" /></td>
                <td><input type="text" class="txt_ing green_brdr" /></td>
                <td><input type="text" class="txt_pre green_brdr" /></td>        
              </tr>
              <tr>
                <td><input type="text" class="txt_qnt green_brdr" /></td>
                <td><input type="text" class="txt_unt green_brdr" /></td>
                <td><input type="text" class="txt_ing green_brdr" /></td>
                <td><input type="text" class="txt_pre green_brdr" /></td>        
              </tr>
              <tr>
                <td><input type="text" class="txt_qnt green_brdr" /></td>
                <td><input type="text" class="txt_unt green_brdr" /></td>
                <td><input type="text" class="txt_ing green_brdr" /></td>
                <td><input type="text" class="txt_pre green_brdr" /></td>        
              </tr>
              <tr>
                <td><input type="text" class="txt_qnt green_brdr" /></td>
                <td><input type="text" class="txt_unt green_brdr" /></td>
                <td><input type="text" class="txt_ing green_brdr" /></td>
                <td><input type="text" class="txt_pre green_brdr" /></td>        
              </tr>                        
            </table>
            <br />
        </div>
        <div style="clear: both"></div>
        <div id="share_info2">
            <h1 class="info_header top_bar_aqua">Recipe Instructions</h1>
            <br />
            <table class="form_table">
              <tr>
                <td colspan="2"><label class="lbl_header">Directions for the evening before cooking</label></td>
              </tr>    
              <tr>
                <td colspan="2"><textarea class="txt_ins green_brdr"></textarea></td>
              </tr>
              <tr><td>&nbsp;</td></tr>
              <tr>
                <td colspan="2"><label class="lbl_header">Directions for the day of cooking</label></td>
              </tr>    
              <tr>
                <td colspan="2"><textarea class="txt_ins green_brdr"></textarea></td>
              </tr>
              <tr><td>&nbsp;</td></tr>
              <tr><td>&nbsp;</td></tr>            
              <tr>
                <td><label>How many does this recipe serve?</label></td>
                <td><select type="select" class="green_brdr" />
                        <option value="1">serves 1</option>
                        <option value="2">serves 2</option>
                        <option value="3">serves 3</option>
                        <option value="4">serves 4</option>
                        <option value="5">serves 5</option>
                        <option value="6">serves 6</option>
                        <option value="7">serves 7</option>
                        <option value="8">serves 8</option>
                        <option value="9">serves 9</option>
                        <option value="10">serves 10</option>
                        <option value="11">serves 11</option>
                        <option value="11">serves 12</option>
                    </select></td>
              </tr>
              <tr>
                <td><label>How long does this recipe take to prepare?</label></td>
                <td><select type="select" class="green_brdr" />
                        <option value="5">5 minutes</option>
                        <option value="10">10 minutes</option>
                        <option value="15">15 minutes</option>
                        <option value="20">20 minutes</option>
                        <option value="25">25 minutes</option>
                        <option value="30">30 minutes</option>
                        <option value="45">45 minutes</option>
                        <option value="60">60 minutes</option>
                    </select></td>
              </tr>
              <tr>
                <td><label>How long does this recipe take to cook?</label></td>
                <td><select type="select" class="green_brdr" />
                        <option value="5">5 minutes</option>
                        <option value="10">10 minutes</option>
                        <option value="15">15 minutes</option>
                        <option value="20">20 minutes</option>
                        <option value="25">25 minutes</option>
                        <option value="30">30 minutes</option>
                        <option value="45">45 minutes</option>
                        <option value="60">60 minutes</option>
                        <option value="75">1 hour 15 minutes</option>
                        <option value="90">1 hour 30 minutes</option>
                        <option value="105">1 hour 45 minutes</option>
                        <option value="120">2 hours</option>                
                        <option value="180">3 hours</option>                
                        <option value="240">4 hours</option>                                                
                        <option value="300">5 hours</option>                
                    </select></td>
              </tr>  
              </table>
            <br />          
        </div>
    </div>
    <div id="ads_col">
        <img src="{path='images/site'}ad_125x125.png" class="ad_space" /><br />
        <br />
        <img src="{path='images/site'}ad_160x600.png" class="ad_space" /><br />
        
    </div>
    {embed="includes/footer"}
{/if}
{if logged_out}
	<meta http-equiv="refresh" content="0;url={path='members/login'}">
{/if}