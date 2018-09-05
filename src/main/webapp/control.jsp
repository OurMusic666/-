<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>Musik</title>
  <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">Musik后台</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">控制台</a></li>
      <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          贤心
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="">退了</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">歌曲管理</a>
          <dl class="layui-nav-child">
            <dd><a href="MusicShow" >所有歌曲</a></dd>
            <dd><a href="javascript:;">歌手分类</a></dd>
            <dd><a href="javascript:;">专辑分类</a></dd>
           
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">用户管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">普通用户</a></dd>
            <dd><a href="javascript:;">vip用户</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="upload">上传歌曲</a></li>
       
      </ul>
    </div>
  </div>
   <c:if test="${!empty MusicShow }">
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <table class="layui-hide" id="test" lay-filter="test"></table>
    


<script type="text/html"  id="barDemo">

  <a class="layui-btn  layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

  </div>
  </c:if>
  
  
  
  <c:if test="${!empty upload }">
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div class="layui-upload">
  
 
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>上传图片与音频</legend>
</fieldset> 
 
<div class="layui-upload">
  <button type="button" class="layui-btn layui-btn-normal" id="testList">上传图片</button> 
  <div class="layui-upload-list">
    <table class="layui-table">
      <thead>
        <tr><th>文件名</th>
        <th>大小</th>
        <th>状态</th>
        <th>操作</th>
      </tr></thead>
      <tbody id="demoList"></tbody>
    </table>
  </div>
  <button type="button" class="layui-btn" id="testListAction">开始上传</button>
</div> 

<div class="layui-upload">

  <button type="button" style="margin-top: 30px" class="layui-btn layui-btn-normal" id="testList">上传音频</button> 
  <div class="layui-upload-list">
    <table class="layui-table">
      <thead>
        <tr><th>文件名</th>
        <th>大小</th>
        <th>状态</th>
        <th>操作</th>
      </tr></thead>
      <tbody id="demoList"></tbody>
    </table>
  </div>
  <button type="button" class="layui-btn" id="testListAction">开始上传</button>
</div>



  </div>
  </c:if>
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © 
  </div>
</div>

<script type="text/javascript" src="layui/lay/modules/jquery.min.js">

</script>


<script src="layui/layui.all.js"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>

<script>
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#test'
    ,url:'listMusic'
    ,toolbar: '#toolbarDemo'
    ,title: '用户数据表'
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
      ,{field:'music_id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
      ,{field:'music_name', title:'歌曲名', width:120, edit: 'text'}
      ,{field:'singer_name', title:'歌手', width:80, edit: 'text'}
      
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
     
    ]]
    ,page: true
  });
  

  
  //监听行工具事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
    //console.log(obj)
    if(obj.event === 'del'){
      layer.confirm('您确定要删除此歌曲吗', function(index){
    	  
    	  var table = layui.table;
    	
        obj.del();
        $.ajax({
        	url:"adminDel",
        	dataType:'html',
        	type:"POST",
        	data :{
        		
        		music_name: data.music_name
        		
        	},
        	error : function(){
        		layer.msg('网络异常,请稍后再试!');
        	},
        	success: function(data){
        		if(data=="suc"){
        			layer.msg('删除成功');
        		}else{
        			layer.msg(data)
        		}
        		
        	}
        
        	
        }); 
        
       
        
        
        layer.close(index);
        
        
      });
    } else if(obj.event === 'edit'){
      layer.prompt({
        formType: 2
        ,value: data.email
      }, function(value, index){
        obj.update({
          email: value
        });
        layer.close(index);
      });
    }
  });
});


layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;
  
  //普通图片上传
  var uploadInst = upload.render({
    elem: '#test1'
    ,url: '/upload/'
    ,before: function(obj){
      //预读本地文件示例，不支持ie8
      obj.preview(function(index, file, result){
        $('#demo1').attr('src', result); //图片链接（base64）
      });
    }
    ,done: function(res){
      //如果上传失败
      if(res.code > 0){
        return layer.msg('上传失败');
      }
      //上传成功
    }
    ,error: function(){
      //演示失败状态，并实现重传
      var demoText = $('#demoText');
      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
      demoText.find('.demo-reload').on('click', function(){
        uploadInst.upload();
      });
    }
  });
  
  //多图片上传
  upload.render({
    elem: '#test2'
    ,url: '/upload/'
    ,multiple: true
    ,before: function(obj){
      //预读本地文件示例，不支持ie8
      obj.preview(function(index, file, result){
        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
      });
    }
    ,done: function(res){
      //上传完毕
    }
  });
  
  //指定允许上传的文件类型
  upload.render({
    elem: '#test3'
    ,url: '/upload/'
    ,accept: 'file' //普通文件
    ,done: function(res){
      console.log(res)
    }
  });
  upload.render({ //允许上传的文件后缀
    elem: '#test4'
    ,url: '/upload/'
    ,accept: 'file' //普通文件
    ,exts: 'zip|rar|7z' //只允许上传压缩文件
    ,done: function(res){
      console.log(res)
    }
  });
  upload.render({
    elem: '#test5'
    ,url: '/upload/'
    ,accept: 'video' //视频
    ,done: function(res){
      console.log(res)
    }
  });
  upload.render({
    elem: '#test6'
    ,url: '/upload/'
    ,accept: 'audio' //音频
    ,done: function(res){
      console.log(res)
    }
  });
  
  //设定文件大小限制
  upload.render({
    elem: '#test7'
    ,url: '/upload/'
    ,size: 60 //限制文件大小，单位 KB
    ,done: function(res){
      console.log(res)
    }
  });
  
  //同时绑定多个元素，并将属性设定在元素上
  upload.render({
    elem: '.demoMore'
    ,before: function(){
      layer.tips('接口地址：'+ this.url, this.item, {tips: 1});
    }
    ,done: function(res, index, upload){
      var item = this.item;
      console.log(item); //获取当前触发上传的元素，layui 2.1.0 新增
    }
  })
  
  //选完文件后不自动上传
  upload.render({
    elem: '#test8'
    ,url: '/upload/'
    ,auto: false
    //,multiple: true
    ,bindAction: '#test9'
    ,done: function(res){
      console.log(res)
    }
  });
  
  //拖拽上传
  upload.render({
    elem: '#test10'
    ,url: '/upload/'
    ,done: function(res){
      console.log(res)
    }
  });
  
  //多文件列表示例
  var demoListView = $('#demoList')
  ,uploadListIns = upload.render({
    elem: '#testList'
    ,url: '/upload/'
    ,accept: 'file'
    ,multiple: true
    ,auto: false
    ,bindAction: '#testListAction'
    ,choose: function(obj){   
      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
      //读取本地文件
      obj.preview(function(index, file, result){
        var tr = $(['<tr id="upload-'+ index +'">'
          ,'<td>'+ file.name +'</td>'
          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
          ,'<td>等待上传</td>'
          ,'<td>'
            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
            ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
          ,'</td>'
        ,'</tr>'].join(''));
        
        //单个重传
        tr.find('.demo-reload').on('click', function(){
          obj.upload(index, file);
        });
        
        //删除
        tr.find('.demo-delete').on('click', function(){
          delete files[index]; //删除对应的文件
          tr.remove();
          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
        });
        
        demoListView.append(tr);
      });
    }
    ,done: function(res, index, upload){
      if(res.code == 0){ //上传成功
        var tr = demoListView.find('tr#upload-'+ index)
        ,tds = tr.children();
        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
        tds.eq(3).html(''); //清空操作
        return delete this.files[index]; //删除文件队列已经上传成功的文件
      }
      this.error(index, upload);
    }
    ,error: function(index, upload){
      var tr = demoListView.find('tr#upload-'+ index)
      ,tds = tr.children();
      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
    }
  });
  
  //绑定原始文件域
  upload.render({
    elem: '#test20'
    ,url: '/upload/'
    ,done: function(res){
      console.log(res)
    }
  });
  
});
</script>



</body>
</html>