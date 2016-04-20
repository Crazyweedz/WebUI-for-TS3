<style type="text/css">
body{
    background-color:#f5f5f5;
}
.form-signin
{
    max-width: 330px;
    padding: 15px;
    margin: 0 auto;
}
.form-signin .form-control
{
    position: relative;
    font-size: 16px;
    height: auto;
    padding: 10px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin .form-control:focus
{
    z-index: 2;
}
.form-signin input[type="text"]
{
    margin-bottom: -1px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}
.form-signin input[type="password"]
{
    margin-bottom: 10px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}
.account-wall
{
    margin-top: 80px;
    padding: 40px 0px 20px 0px;
    background-color: #ffffff;
    box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.16);
}
.profile-img
{
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}
</style>

{if !empty($error)}
<div class="alert alert-danger alert-dismissible" role="alert">
	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	{$error}
</div>
{/if}

{if !isset($smarty.post.sendlogin) AND $loginstatus !== true OR $loginstatus !== true}
<div class="row">
    <div class="col-sm-6 col-md-4 col-md-offset-4">
        <div class="account-wall">
            <div id="my-tab-content" class="tab-content">
				<div class="tab-pane active" id="login">
           		    <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                alt="">
           			<form class="form-signin" action="index.php?site=login" method="post">
           				{if count($instances) == 1}
							{foreach key=skey item=sdata from=$instances}
								<input type="hidden" name="skey" value="{$skey}" />	{$sdata['alias']} 
							{/foreach}
						{else}
							<select name="skey" class="form-control">
							{foreach key=skey item=sdata from=$instances}
								<option value="{$skey}">{$sdata['alias']}</option>	
							{/foreach}
							</select>
						{/if}
           				<input type="text" class="form-control" name="loginUser" placeholder="{$lang['username']}" value="serveradmin" required autofocus>
           				<input type="password" class="form-control" name="loginPw" placeholder="{$lang['password']}" required>
           				<input type="submit" class="btn btn-lg btn-default btn-block" name="sendlogin" value="{$lang['login']}" />
           			</form>
				</div>
            </div>
        </div>
    </div>
</div>
{/if}