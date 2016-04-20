<header class="main-header">
    <!-- Logo -->
    <a href="index.php" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>TS</b>W</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>TS</b>WebUI</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
        </a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Notifications: style can be found in dropdown.less -->
              <li class="user user-menu">

              </li>
              <li class="dropdown tasks-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  	{if $loginstatus === true}
						{$smarty.session.loginuser} : 
					{/if}
                </a>
              </li>
              <!-- User Account: style can be found in dropdown.less -->
              <li class="user user-menu">
                {if $loginstatus === true}
					<a href="index.php?site=logout">{$lang['logout']}</a>
				{/if}
              </li>
              <li class="dropdown user user-menu">
			    <div style="padding-top: 10px; padding-bottom: 10px; margin-right: 10px">
			    	{if $fastswitch == true AND $hoststatus === true}
						<form method="get" action="index.php?site=serverview">
							{if strpos($site, 'edit') == false OR $site == serveredit}
							<input type="hidden" name="site" value="{$site}" />
							{else}
							<input type="hidden" name="site" value="serverview" />
							{/if}
							<select name="sid" onchange="submit()" class="form-control input-sm">
							{foreach key=key item=server from=$serverlist}
								{if $sid == $server['virtualserver_id']}
								<option selected="selected" value="{$server['virtualserver_id']}">{$server['virtualserver_name']}-{$server['virtualserver_port']}</option>
								{else}
								<option value="{$server['virtualserver_id']}">{$server['virtualserver_name']}-{$server['virtualserver_port']}</option>
								{/if}
							{/foreach}
							</select>
						</form>
					{/if}
			    </div>
			  </li>
            </ul>
        </div>
    </nav>
</header>