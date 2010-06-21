<?php if (isset($_POST['email_address'])){$new_email = $_POST['email_address'];} else {$new_email = ""; } ?>
{embed="includes/header"}
<div id="other_top">
    {embed="includes/email-signup" message="sign up for  newletters & savings by entering your email address" margin="45"}
    <img src="{path='images/site'}eb_lady.png" class="other_lady" />
</div>
<div id="member_bars">
	<div id="member_top_bar" class="top_bar_darkred"></div>
    <div id="member_txt_bar" class="txt_bar_pink">Sign-Up for Email and Saving Preference</div>
</div>
<div id="register_form">
	<form>
        <table>
			<tr>
            	<td colspan="3"><p>Please verify your email address then click the "go" button to subscribe.</p></td>
            </tr>
        	<tr>
           	  <td width="276"><label>Email Address</label></td>
            	<td width="175"><input type="text" id="register_email" name=""  class="register_text" value="<?php echo $new_email; ?>" /></td>
              <td width="451"><input type="submit" /></td>
          </tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
            	<td colspan="3"><p>If you would like to create an accont with us to save your menus and preferences for later, please enter a password and click the "go" button to register.</p></td>
            </tr>              
        	<tr>
            	<td><label>Password</label></td>
            	<td><input type="password" id="register_password" class="register_text" name="" /></td>
                <td><input type="submit" /></td>
            </tr>
        </table>
    </form>
</div>
{embed="includes/footer"}