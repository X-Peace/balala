<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/default/easyui.css">
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
function formatterclass(value,row,index) {
	return value.bcname;
}
$(function(){
	init();
	 $("#cc").combobox({
		url:'bc',
		method:'post',
		valueField:'bcid',//填充进 <option value='id'>text</option>    
		textField:'bcname'//标签中间（<option>text</option>）   

	}) 
})
function init(){
	var bc=$("#cc").combobox('getValue');
	/* alert($("#sex").combobox("getValue")) */
	if(bc=="--请选择班级--"){
		bc='';
	}
	$("#Book").datagrid({
		url:'Book',
		method:'post',
		pagination:true,
		toolbar:'#tb',
		queryParams:{
			bid:$("#bid").val(),
			bname:$("#bname").val(),
			startbsale:$("#startbsale").val(),
			endbsale:$("#endbsale").val()
		}
		
	})
	$("#tb-frm").form("reset");
}
function formattercaozuo(value,row,index){
	return "<a href='javascript:void(0)' onclick='updateStu("+index+")'>修改</a>   <a href='javascript:void(0)' onclick='deleteStu("+index+")'>删除</a>"
}
function updateStu(index){
	var arr=$("#Book").datagrid("getData");
	var row=arr.rows[index];
	
	
	$("#updatecc").combobox({
		url:'bc',
		method:'post',
		valueField:'bcid',//填充进 <option value='id'>text</option>    
		textField:'bcname'//标签中间（<option>text</option>）   
	})
	$("#updatecc").combobox('setValue',row.bc.bcid)
	
	
	//填充表单
	$("#updatefrm").form("load",row);
	//打开弹窗
	$("#update-dialog").dialog("open")
}
function saveUpdate(){
	//获取修改弹窗中的所有的数据
	/* alert($("#updatecc").combobox('getValue')); */
	$.post("updateBook",{
		bid:$("#updatebid").val(),
		bname:$("#updatebname").val(),
		bsale:$("#updatebsale").val(),
		bzuoze:$("#updatebzuoze").val(),
		bjieshao:$("#updatebjieshao").val(),
		bcid:$("#updatecc").combobox('getValue')
	},function(res){
		if(res>0){
			//修改成功
			$("#Book").datagrid("reload");
			$("#update-dialog").dialog("close")
			$.messager.alert("提示","修改成功");
		}else{
			//修改失败
			$.messager.alert("提示","修改失败");
		}
		
	},"json")
	
	
}
/* 打开添加弹窗 */
function add(){
	$('#addcc').combobox({    
	    url:'bc',  
	    method:"post",
	    valueField:'bcid',    
	    textField:'bcname'   
	     
	});
	$("#add_dialog").window("open");
}
/* 添加商品 */
function addsave(){
	var t=$("#add_frm").form("validate");
	if(t){
		var pcid=$('#addcc').combobox('getValue')
		if(pcid=='--请选择--'){
			pcid='';
		}
		if(pcid!=''){
	$.post("addBook",{
		bname:$("#addbname").val(),
		bsale:$("#addbsale").val(),
		bzuoze:$("#addbzuoze").val(),
		bjieshao:$("#addbjieshao").val(),
		bcid:$("#addcc").combobox('getValue')
	},
	function(res){
		if(res>0){
			$("#Book").datagrid("reload");
			$("#add_dialog").window("close");
			$.messager.alert("提示","添加成功！")
		}else{
			$.messager.alert("提示","添加失败！")
		}
	},"json")
		}else{
			$.messager.alert("提示","请填写分类信息！")
		}
	}else{
		$.messager.alert("提示","请填写完整的信息！")
	}
}
function deleteStu(index){
	var data=$("#Book").datagrid("getData");
	var row=data.rows[index];
	$.messager.confirm("提示","确认删除么？",function(r){
		if(r){
			$.post("deleteBook",{
				bid:row.bid
			},function(res){
				if(res>0){
					//删除成功
					$("#Book").datagrid("reload");
					$.messager.alert("提示","删除成功");
					
				}else{
					//删除失败
					$.messager.alert("提示","删除失败");
				}
			},"json")
			
		}
	})
}
function detail(index){
	
	

	$('#bcc').combobox({    
	    url:'bc',  
	    method:"post",
	    valueField:'bcid',    
	    textField:'bcname'   
	     
	});
	var data=$("#Book").datagrid("getData");
	var row=data.rows[index];
	
	
	$("#detail_frm").form("load",row);
	$("#detail-dialog").dialog("open");
}
</script>
</head>
<body>
	<table id="Book" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'bid',title:'ID'"></th>
				<th data-options="field:'bname',title:'名称'"></th>
				<th data-options="field:'bsale',title:'价格'"></th>
				<th data-options="field:'bzuoze',title:'作者'"></th>
				<th data-options="field:'bjieshao',title:'介绍'"></th>
				<th data-options="field:'bc',title:'类别',formatter:formatterclass"></th>
				<th data-options="field:'caozuo',title:'操作',formatter:formattercaozuo" ></th>
			
			</tr>
		
		</thead>
	
	</table>
	<div id="tb">
	
		<form id="tb-frm" class="easyui-form">
	       <a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add'" onclick="add()">新增</a> 
			  
	        <label for="name">名字:</label>   
	        <input class="easyui-validatebox" type="text"  id="bname" data-options="required:true" />   
	    	
	    	 
	        <label for="name">价格:</label>   
	        <input class="easyui-validatebox" type="text"  id="startbsale" data-options="required:true" /> ~  
	        <input class="easyui-validatebox" type="text"  id="endbsale" data-options="required:true" />   
	    	
	    	
	    	 
	    	
	    	<!-- 下拉列表 -->
			<select id="cc" class="easyui-combobox">
				<option selected="selected" >--请选择类别--</option>
			</select> 
	    	
	    	
			<a href="javascript:void(0)" onclick="init()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
		</form>
	</div>
	<!--修改  -->
	<div id="update-dialog" class="easyui-dialog" data-options="modal:true,closed:true,title:'修改',
	buttons:[{
				text:'保存',
				handler:function(){
				saveUpdate();
				}
			},{
				text:'关闭',
				handler:function(){
					clear();
				}
			
	}]">
		<form class="easyui-form" id="updatefrm">
			<label for="name">id:</label>   
	        <input class="easyui-validatebox" disabled="disabled" type="text" name="bid"  id="updatebid" data-options="required:true" />   
	    	 <br>
			  
	        <label for="name">名称:</label>   
	        <input class="easyui-validatebox" type="text" name="bname"  id="updatebname" data-options="required:true" />   
	    	 <br>
	    	 
	        <label for="name">价格:</label>   
	        <input class="easyui-validatebox" type="text" name="bsale"  id="updatebsale" data-options="required:true" />   
	    	 <br>
	    	 <label for="name">作者:</label>   
	        <input class="easyui-validatebox" type="text" name="bzuoze"  id="updatebzuoze" data-options="required:true" />   
	    	 <br>
	    	 <label for="name">介绍:</label>   
	        <input class="easyui-validatebox" type="text" name="bjieshao"  id="updatebjieshao" data-options="required:true" />   
	    	 <br>
	    	
	    	 
	        
	        
			<!-- 下拉列表 -->
			<select id="updatecc" class="easyui-combobox">
				<option selected="selected" >--请选择班级--</option>
			</select>
		</form>
	</div>
	<!-- 学生新增框 -->
	<div id="add_dialog" class="easyui-dialog"
		data-options="modal:true,closed:true,title:'新增书籍',buttons:[{
				text:'保存',
				iconCls:'icon-save',
				handler:function(){
				addsave()
				}
			},{
				text:'取消',
				iconCls:'icon-clear',
				handler:function(){
				clear()
				}
			}]">
		<form id="add_frm">
			<table cellspacing="5">
				<tr>
					<td>名字：</td>
					<td><input id="addbname" class="easyui-textbox" /></td>
				</tr>
				<tr>
					<td>价格：</td>
					<td><input id="addbsale" class="easyui-textbox" /></td>
				</tr>
				<tr>
					<td>作者：</td>
					<td><input id="addbzuoze" class="easyui-textbox" /></td>
				</tr>
				
				<tr>
					<td>介绍：</td>
					<td><input id="addbjieshao" class="easyui-textbox" /></td>
				</tr>
				<!-- 下拉列表 -->
			

			</table>
			<select id="addcc" class="easyui-combobox">
				<option selected="selected" >--请选择类别--</option>
			</select>
		</form>
	</div>
	<!-- <!-- 查看框 -->
	<div id="detail-dialog" class="easyui-dialog"
		data-options="modal:true,closed:true,title:'查看书籍',buttons:[{
				text:'取消',
				iconCls:'icon-clear',
				handler:function(){
				clear()
				}
			}]">
		<form id="detail_frm">
			<table cellspacing="5">
				<tr>
					<td>编号：</td>
					<td><input disabled="disabled" id="bid" name="bid"
						class="easyui-textbox" /></td>
				</tr>
				<tr>
					<td>名字：</td>
					<td><input disabled="disabled" id="bname" name="bname" class="easyui-textbox" /></td>
				</tr>
				<tr>
					<td>作者：</td>
					<td><input disabled="disabled" id="bzuoze" name="bzuoze" class="easyui-textbox" /></td>
				</tr>
				<tr>
					<td>介绍：</td>
					<td><input disabled="disabled" id="bjieshao" name="bjieshao" class="easyui-textbox" /></td>
				</tr>
				
				
			</table>
			<select id="bcc" class="easyui-combobox">
				<option selected="selected" ></option>
			</select>
		</form>
	</div> -->
</body>
</html>