{if $loginstatus === true AND $site !==login}

<!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- /.search form -->
                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu">
                    <li class="header">MENU</li>
                    <li class="treeview">
                        <a href="#">
                        <i class="fa fa-server"></i> <span>{$lang['server']}</span> <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            {if $hoststatus === true}
                            <li><a href="index.php?site=server"><i class="fa fa-circle-o"></i> {$lang['serverlist']}</a></li>
							{/if}

							{if !isset($sid) AND $hoststatus === true}
								<li><a href="index.php?site=createserver"><i class="fa fa-circle-o"></i> {$lang['createserver']}</a></li>
								<li><a href="index.php?site=servertraffic"><i class="fa fa-circle-o"></i> {$lang['instancetraffic']}</a></li>
								<li><a href="index.php?site=instanceedit"><i class="fa fa-circle-o"></i> {$lang['instanceedit']}</a></li>
								<li><a href="index.php?site=logview"><i class="fa fa-circle-o"></i> {$lang['logview']}</a></li>
								<li><a href="index.php?site=iserverbackup"><i class="fa fa-circle-o"></i> {$lang['instancebackup']}</a></li>
							{/if}
							{if isset($sid)}
								<li><a href="index.php?site=serverview&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['serverview']}</a></li>
								<li><a href="index.php?site=servertraffic&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['virtualtraffic']}</a></li>
								<li><a href="index.php?site=serveredit&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['serveredit']}</a></li>
								<li><a href="index.php?site=temppw&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['temppw']}</a></li>
								<li><a href="index.php?site=fileupload&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['iconupload']}</a></li>
								<li><a href="index.php?site=logview&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['logview']}</a></li>
								<li><a href="index.php?site=filelist&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['filelist']}</a></li>
								<li><a href="javascript:oeffnefenster('site/interactive.php?sid={$sid}&amp;action=action');"><i class="fa fa-circle-o"></i> {$lang['massaction']}</a></li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#">
                        <i class="fa fa-navicon"></i> <span>{$lang['channel']}</span> <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="index.php?site=channel&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['channellist']}</a></li>
                            <li><a href="index.php?site=createchannel&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['createchannel']}</a></li>
                            {if isset($cid)}
	                            <li><a href="index.php?site=channelview&amp;sid={$sid}&amp;cid={$cid}"><i class="fa fa-circle-o"></i> {$lang['channelview']}</a></li>
                                <li><a href="index.php?site=channeledit&amp;sid={$sid}&amp;cid={$cid}"><i class="fa fa-circle-o"></i> {$lang['editchannel']}</a></li>
                                <li><a href="index.php?site=channeleditperm&amp;sid={$sid}&amp;cid={$value['cid']}"><i class="fa fa-circle-o"></i> {$lang['channeleditperms']}</a></li>
                            {/if}
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#">
                        <i class="fa fa-user"></i> <span>{$lang['clients']}</span> <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="index.php?site=counter&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['clientcounter']}</a></li>
                            <li><a href="index.php?site=clients&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['clientlist']}</a></li>
                            <li><a href="index.php?site=complainlist&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['complainlist']}</a></li>
                            <li><a href="index.php?site=chanclienteditperm&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['chanclientperms']}</a></li>
                            <li><a href="index.php?site=clientcleaner&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['clientcleaner']}</a></li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#">
                        <i class="fa fa-user-times"></i> <span>{$lang['bans']}</span> <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="index.php?site=banlist&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['banlist']}</a></li>
                            <li><a href="index.php?site=banadd&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['addban']}</a></li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#">
                        <i class="fa fa-users"></i> <span>{$lang['groups']}</span> <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="index.php?site=sgroups&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['servergroups']}</a></li>
                            <li><a href="index.php?site=sgroupadd&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['addservergroup']}</a></li>
                            <li><a href="index.php?site=cgroups&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['channelgroups']}</a></li>
                            <li><a href="index.php?site=cgroupadd&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['addchannelgroup']}</a></li>
                        </ul>
                    </li>
		            <li class="treeview">
                        <a href="#">
                        <i class="fa fa-key"></i> <span>{$lang['token']}</span> <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="index.php?site=token&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['token']}</a></li>
                        </ul>
                    </li>
		            <li class="treeview">
                        <a href="#">
                        <i class="fa fa-download"></i> <span>{$lang['backup']}</span> <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="index.php?site=backup&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['chanbackups']}</a></li>
                            <li><a href="index.php?site=serverbackup&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['serverbackups']}</a></li>
                            <li><a href="index.php?site=permexport&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['permexport']}</a></li>
                            <li><a href="index.php?site=clientsexport&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['clientsexport']}</a></li>
                            <li><a href="index.php?site=bansexport&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['bansexport']}</a></li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#">
                        <i class="fa fa-terminal"></i> <span>{$lang['console']}</span> <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="index.php?site=console&amp;sid={$sid}"><i class="fa fa-circle-o"></i> {$lang['queryconsole']}</a></li>
                        </ul>
                    </li>		
						{/if}
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>
{/if}


