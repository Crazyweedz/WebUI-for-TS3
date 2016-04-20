<!doctype html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">
<head>
    <title>Teamspeak 3 - Webinterface</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="templates/{$tmpl}/gfx/style.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="templates/{$tmpl}/gfx/tsview.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <script type="text/javascript">
        //<![CDATA[
        function Klappen(Id)
        	{

        	if(Id == 0)
        		{
        		var i = 1;
        		var jetec_Minus="gfx/images/minus.png", jetec_Plus="gfx/images/plus.png";

        		if(document.getElementById('Pic0').name == 'plus')
        			{
        			document.getElementById('Pic0').src = jetec_Minus;
        			document.getElementById('Pic0').name = 'minus';
        			var openAll = 1;
        			}
        			else
        			{
        			document.getElementById('Pic0').src = jetec_Plus;
        			document.getElementById('Pic0').name = 'plus';
        			var openAll = 0;
        			}
        		while(i<100)
        			{
        			if(document.getElementById('Pic'+i)!=null)
        				{
        				var KlappText = document.getElementById('Lay'+i);
        				var KlappBild = document.getElementById('Pic'+i);
        				if (openAll == 1)
        					{
        					KlappText.style.display = 'block';
        					KlappBild.src = jetec_Minus;
        					}
        					else
        					{
        					KlappText.style.display = 'none';
        					KlappBild.src = jetec_Plus;
        					}
        				i++;
        				}
        				else
        				{
        				break;
        				}
        			}
        		}
        	var KlappText = document.getElementById('Lay'+Id);
        	var KlappBild = document.getElementById('Pic'+Id);
        	var jetec_Minus="gfx/images/minus.png", jetec_Plus="gfx/images/plus.png";
        	if (KlappText.style.display == 'none')
        		{
        		KlappText.style.display = 'block';
        		KlappBild.src = jetec_Minus;
        		}
        		else
        		{
        		KlappText.style.display = 'none';
        		KlappBild.src = jetec_Plus;
        		}
        	}

        function oeffnefenster (url) {
        fenster = window.open(url, "fenster1", "width=350,height=150,status=no,scrollbars=yes,resizable=no");
        fenster.opener.name="opener";
        fenster.focus();
        }
        function hide_select(selectId)
        	{
        	if(selectId==0)
        		{
        		document.getElementById("groups").style.display = "";
        		document.getElementById("servergroups").style.display = "";
        		document.getElementById("channelgroups").style.display = "none";
        		document.getElementById("channel").style.display = "none";
        		}
        	else if (selectId==1)
        		{
        		document.getElementById("groups").style.display = "";
        		document.getElementById("servergroups").style.display = "none";
        		document.getElementById("channelgroups").style.display = "";
        		document.getElementById("channel").style.display = "";
        		}
        		else
        		{
        		document.getElementById("groups").style.display = "none";
        		document.getElementById("servergroups").style.display = "none";
        		document.getElementById("channelgroups").style.display = "none";
        		document.getElementById("channel").style.display = "none";
        		}
        	}
        var checkflag = "false";
        function check(form)
        	{
        	if (checkflag == "false")
        		{
        		for (i = 0; i < document.forms[form].elements.length; i++)
        			{
        			if(document.forms[form].elements[i].name != 'checkall')
        				{
        				document.forms[form].elements[i].checked = true;
        				}
        			}
        		checkflag = "true";
        		return checkflag;
        		}
        		else
        		{
        		for (i = 0; i < document.forms[form].elements.length; i++)
        			{
        				document.forms[form].elements[i].checked = false;
        			}
        		checkflag = "false";
        		return checkflag;
        		}
        	}
        var conf_arr = new Array();
        function confirmArray(sid, name, port, action)
        	{
        	conf_arr[sid]=new Object();
        	conf_arr[sid]['name']=name;
        	conf_arr[sid]['port']=port;
        	if(document.getElementById("caction"+sid).options.selectedIndex == 0)
        		{
        		conf_arr[sid]['action']='';
        		}
        		else if(document.getElementById("caction"+sid).options.selectedIndex == 1)
        		{
        		conf_arr[sid]['action']='start';
        		}
        		else if(document.getElementById("caction"+sid).options.selectedIndex == 2)
        		{
        		conf_arr[sid]['action']='stop';
        		}
        		else if(document.getElementById("caction"+sid).options.selectedIndex == 3)
        		{
        		conf_arr[sid]['action']='del';
        		}
        	}

        function confirmAction()
        	{
        	var text="Möchtest du folgende Aktion wirklich ausführen?\n\n";
        	for(var i in conf_arr)
        		{
        		if(conf_arr[i]['action'] == 'start')
        			{
        			text = text+"***Starten*** "+conf_arr[i]['name']+" "+conf_arr[i]['port']+"\n";
        			}
        			else if(conf_arr[i]['action'] == 'stop')
        			{
        			text = text+"***Stoppen*** "+conf_arr[i]['name']+" "+conf_arr[i]['port']+"\n";
        			}
        			else if(conf_arr[i]['action'] == 'del')
        			{
        			text = text+"***Löschen*** "+conf_arr[i]['name']+" "+conf_arr[i]['port']+"\n";
        			}
        		}
        	return text;
        	}
        //]]>
    </script>
</head>
<body class="hold-transition skin-purple sidebar-mini fixed">
    <div class="wrapper">
        {include file="{$tmpl}/head.tpl"}

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">

            {include file="{$tmpl}/mainbar.tpl"}
            <!-- Main content -->
            <section class="content">
			     {include file="{$tmpl}/{$site}.tpl"}
            </section>
            <!-- /.content -->


        </div>
        <!-- /.content-wrapper -->
        <footer class="main-footer text-center">
            <div class="pull-right hidden-xs">
                <b>Version</b> 2.3.0
            </div>
            <span style="display: none">{$footer}</span>
            Teamspeak Web Interface created by <a href="http://addons.teamspeak.com/directory/addon/web-based/Teamspeak-3-Webinterface-by-Psychokiller.html">Psychokiller</a>. Edit by <strong>Crazyweedz</strong>. Theme from
			<a href="https://almsaeedstudio.com/">Almsaeed Studio</a>
        </footer>
    </div>
    <!-- ./wrapper -->



    <script language="JavaScript" type="text/javascript" src="gfx/js/jQuery-2.1.4.min.js"></script>
    <script language="JavaScript" type="text/javascript" src="gfx/js/bootstrap.min.js"></script>
    <script language="JavaScript" type="text/javascript" src="gfx/js/fastclick.min.js"></script>
    <script language="JavaScript" type="text/javascript" src="gfx/js/app.min.js"></script>
    <script language="JavaScript" type="text/javascript" src="gfx/js/jquery.slimscroll.min.js"></script>
</body>
</html>