<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="../js/layui/css/layui.css">
</head>
<style>
    .none{
        display: none;
    }
</style>
<body>

<div class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">身份证号：</label>
        <div class="layui-input-inline">
            <input name="sfzh" type="text" class="layui-input" placeholder="请输入身份证号" autocomplete="off" >
        </div>
    </div>
    <button class="layui-btn btnSearch">查询</button>
    <button class="layui-btn layui-btn-normal btnAdd">添加</button>

</div>

<p class="userinfo"></p>

<div class="addFrom layui-form none">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">用户姓名</label>
            <div class="layui-input-inline">
                <input name="username" class="layui-input" placeholder="请输入用户姓名" type="text" autocomplete="off">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">身份证号</label>
            <div class="layui-input-inline">
                <input name="idcard" class="layui-input" type="text" placeholder="请输入身份号码" autocomplete="off">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">手机号码</label>
            <div class="layui-input-inline">
                <input name="phone" class="layui-input" type="tel" placeholder="请输入手机号" autocomplete="off">
            </div>
        </div>
    </div>
    <button class="layui-btn layui-btn-normal addSubmit">提交</button>
    <button class="layui-btn layui-btn-danger cancel">取消</button>
</div>

</body>

<script src="../js/jquery/jquery-3.2.1.min.js"></script>
<script src="../js/layui/layui.js"></script>
<script>
    function searchFun(){
        $.ajax({
            type:'get',
            data:{
                sfzh:$("input[name='sfzh']").val()
            },
            dataType: "json",
            url:'./queryMas',
            success:function (res) {
                console.log(res.data==null)
                if(res.data==null){
                    alert('未查询到该条信息')
                    $(".userinfo").text('未查询到该条信息')
                }else{
                    $(".userinfo").text(res.data)
                }
            },
            error:function (err) {

            }
        })
    }
    $('.btnSearch').click(function () {
        searchFun()
    })
    $(".btnAdd").click(function () {
        $(".addFrom").removeClass('none')
    })
    $(".addSubmit").click(function () {
        $.ajax({
            type:'post',
            data:JSON.stringify({
                sfzh:$("input[name='idcard']").val(),
                username:$("input[name='username']").val(),
                phone:$("input[name='phone']").val()
            }),
            contentType: 'application/json; charset=UTF-8',
            dataType: "json",
            url:'./insertMas',
            success:function (res) {
                alert('添加成功')
                $(".addFrom").addClass('none')
                $("input[name='idcard']").val('')
                $("input[name='username']").val('')
                $("input[name='phone']").val('')
            },
            error:function (err) {

            }
        })
    })
    $(".cancel").click(function () {
        $(".addFrom").addClass('none')
    })
</script>
</html>