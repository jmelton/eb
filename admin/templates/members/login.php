{if logged_in}
	<meta http-equiv="refresh" content="0;url={path='members'}{username}">
{/if}
{if logged_out}
    {embed="includes/header"}
    <div id="other_top">
        {embed="includes/email-signup" message="sign up for  newletters & savings by entering your email address" margin="45"}
        <img src="{path='images/site'}eb_lady.png" class="other_lady" />
        <a href="{path='members'}"><img src="{path='images/site'}eb_login.png" class="other_login" /></a>
    </div>
    <div id="member_bars">
        <div id="member_top_bar" class="top_bar_darkred"></div>
        <div id="member_txt_bar" class="txt_bar_pink">Login</div>
    </div>
    <div id="login_wrapper">
        <p>Please login or register in order to submit recipes or cooking tools. All we need is your email address. Thank you!</p>
        <div id="login_form">
            <div class="box_header">Registered Users</div>
            <div id="login_box">
            {exp:member:login_form return="members/login"}
                <table>
                    <tr>
                        <td><label>Email Address</label></td>
                        <td><input type="text" id="username" name="username" value="Username" class="login_text" /></td>
                    </tr>
                    <tr>
                        <td><label>Password</label></td>
                        <td> <input type="text" id="password" name="password" value="Password" class="login_text" /></td>
                    </tr>                
                    <tr>
                        <td colspan="2" align="right"><input type="submit" /></td>
                    </tr>
                </table>
            </div>
            {/exp:member:login_form}	
        </div>
        <div id="signup_form">
            <div class="box_header">New to Easy Breezy?</div>  
            <div id="signup_box">
                <table>
                    <tr>
                        <td><label>Email Address</label></td>
                        <td><input type="text" class="login_text" /></td>
                    </tr>
                    <tr>
                        <td><label>Password</label></td>
                        <td><input type="password" class="login_text" /></td>
                    </tr>                
                    <tr>
                        <td colspan="2" align="right"><input type="submit" /></td>
                    </tr>
                </table>        
            </div>
        </div>
    </div>
    {embed="includes/footer"}
{/if}