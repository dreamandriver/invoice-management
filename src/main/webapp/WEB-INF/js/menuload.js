

//打开标签窗口
var opentabwindow = function(tabTitle,url){
	addTab(tabTitle,url,'icon icon-null');
};
//菜单单击事件
var menuclick = function(){
		//var tabTitle = $(this).children('.nav').text();
	    //获取二级菜单的title
		var tabTitle = $(this).attr("title");
		//获取二级菜单的url,rel是获取json数据时拼接成的html的一部分
		var url = $(this).attr("rel");
		var menuid = $(this).attr("ref");
		var icon = 'icon '+$(this).attr("icon");
		addTab(tabTitle,url,icon);
		$('.easyui-accordion li div').removeClass("selected");
		$(this).parent().addClass("selected");
};
//初始化左侧
function initMenu(menus_var) {
		
	$("#nav").accordion({animate:false}); 

    $.each(menus_var.menus, function(i, n) {
		var menulist ='';
		menulist +='<ul>';
        $.each(n.menus, function(j, o) {
			menulist += '<li><div><a title="'+o.menuname+'" ref="'+o.menuid+'" href="#" rel="' + o.url + '" icon="' + o.icon + '"  ><span class="icon '+o.icon+'" >&nbsp;</span><span class="nav">' + o.menuname + '</span></a></div></li> ';
        });
		menulist += '</ul>';

		$('#nav').accordion('add', {
            title: n.menuname,
            content: menulist,
            iconCls: 'icon ' + n.icon
        });

    });

	$('.easyui-accordion li a').click(menuclick).hover(function(){
		$(this).parent().addClass("hover");
	},function(){
		$(this).parent().removeClass("hover");
	});

}

function addTab(subtitle,url,icon){
	if(!$('#tabs').tabs('exists',subtitle)){
		$('#tabs').tabs('add',{
			title:subtitle,
			content:createFrame(url),
			closable:true,
			icon:icon
		});
	}else{
		$('#tabs').tabs('select',subtitle);
	}
}

function createFrame(url)
{
	var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
	return s;
}




