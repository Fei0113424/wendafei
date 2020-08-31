<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="../js/layui/css/layui.css">
</head>
<style>
    .none {
        display: none;
    }
    input[readonly]{
        border: none;
    }
</style>
<body>
<div class="layui-container">
    <div class="layui-tab">
        <ul class="layui-tab-title">
            <li class="layui-this">外卖查询</li>
            <li>滴滴查询</li>
            <li>快递查询</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div class="layui-form">
                    <div class="layui-form-item">
                        <label class="layui-form-label">身份证号：</label>
                        <div class="layui-input-inline">
                            <input name="sfzh" id="idcard" type="text" class="layui-input" placeholder="请输入身份证号"
                                   autocomplete="off">
                        </div>

                        <button class="layui-btn btnSearch">查询</button>
                        <button class="layui-btn layui-btn-normal btnAdd">添加</button>
                    </div>

                </div>

                <div class="userForm none" lay-filter="userForm" id="userForm">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">用户姓名</label>
                            <div class="layui-input-inline">
                                <input name="username" class="layui-input" placeholder="请输入用户姓名" type="text"
                                       autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">身份证号</label>
                            <div class="layui-input-inline">
                                <input name="sfzh" class="layui-input" type="text" placeholder="请输入身份号码"
                                       autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号码</label>
                            <div class="layui-input-inline">
                                <input name="phone" class="layui-input" type="text" placeholder="请输入手机号码"
                                       autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <div class="layui-btn-group text-center addBtnGroup none">
                        <button class="layui-btn layui-btn-normal addSubmit">提交</button>
                        <button class="layui-btn layui-btn-danger cancel">取消</button>
                    </div>
                    <div class="layui-btn-group text-center resultBtnGroup none">
                        <button class="layui-btn layui-btn-normal updateBtn">修改</button>
                        <button class="layui-btn layui-btn-danger deleteBtn">删除</button>
                    </div>
                </div>
            </div>
            <div class="layui-tab-item">滴滴查询</div>
            <div class="layui-tab-item">快递查询</div>
        </div>
    </div>


</div>

</body>

<script src="../js/layui/layui.js"></script>
<script>
    layui.use(['layer', 'element', 'table', 'form'], function () {
        var $ = layui.jquery, layer = layui.layer, element = layui.element;
        var table = layui.table, form = layui.form;

        var currenId=''//查询出的身份证号
        function searchFun() {
            $.ajax({
                type: 'get',
                data: {
                    sfzh: $("#idcard").val()
                },
                dataType: "json",
                url: './queryMas',
                success: function (res) {
                    if (res.data == null) {
                        layer.msg('未查询到该条信息', {
                            time: 3000, //20s后自动关闭
                        });
                        currenId=''
                        $(".userinfo").text('未查询到该条信息')
                        $(".userForm").addClass('none')
                        form.val('userForm', '')
                        form.render()
                        $(".userForm input").removeAttr("readonly");
                    } else {
                        currenId=$("#idcard").val()
                        // $(".userinfo").text(res.data)
                        $(".userForm").removeClass('none')
                        $(".userForm input").attr('readonly','readonly')
                        $(".resultBtnGroup").removeClass('none')
                        $(".addBtnGroup").addClass('none')
                        // form.val('userForm', res.data)
                       $(".userForm input[name='sfzh']").val( res.data.sfzh),
                          $(".userForm input[name='username']").val(res.data.username),
                        $(".userForm input[name='phone']").val(res.data.phone)
                        // form.render()
                    }
                },
                error: function (err) {

                }
            })
        }

        $('.btnSearch').click(function () {
            if ($("#idcard").val() == '') {
                layer.msg('请输入用户身份证号！', {
                    time: 3000, //20s后自动关闭
                });
                currenId=''
            } else {
                searchFun()
            }
        })
        $(".btnAdd").click(function () {
            $(".userForm").removeClass('none')
            $(".userForm input").removeAttr("readonly");
            $(".resultBtnGroup").addClass('none')
            $(".addBtnGroup").removeClass('none')
        })
        $(".updateBtn").click(function (){
            $(".userForm input").removeAttr("readonly");
            $(".resultBtnGroup").addClass('none')
            $(".addBtnGroup").removeClass('none')
        })
        $(".deleteBtn").click(function (){
            layer.open({
                type: 1
                ,id: 'layerDemo' //防止重复弹出
                ,content: '<div style="padding: 20px 100px;">确认删除？</div>'
                ,btn: '确认'
                ,btnAlign: 'c' //按钮居中
                ,shade: 0 //不显示遮罩
                ,yes: function(index){
                    layer.close();
                    $.ajax({
                        type: 'post',
                        data: JSON.stringify({
                            sfzh: currenId,
                        }),
                        contentType: 'application/json; charset=UTF-8',
                        dataType: "json",
                        url: './deleteMas',
                        success: function (res) {
                            layer.msg('删除成功！', {
                                time: 3000, //20s后自动关闭
                            });
                            layer.close(index)
                            $(".userForm").addClass('none')
                            form.val('userForm', '')
                        },
                        error: function (err) {
                            layer.close(index)
                            layer.msg('删除失败！'+err.responseJSON.message, {
                                time: 3000, //20s后自动关闭
                            });
                        }
                    })
                }
            });
        })
        $(".addSubmit").click(function () {
            $.ajax({
                type: 'post',
                data: JSON.stringify({
                    sfzh: $(".userForm input[name='sfzh']").val(),
                    username: $(".userForm input[name='username']").val(),
                    phone: $(".userForm input[name='phone']").val()
                }),
                contentType: 'application/json; charset=UTF-8',
                dataType: "json",
                url: './insertMas',
                success: function (res) {
                    layer.msg('添加成功！', {
                        time: 3000, //20s后自动关闭
                    });
                    $(".userForm").addClass('none')
                    form.val('userForm', '')
                },
                error: function (err) {

                }
            })
        })
        $(".cancel").click(function () {
            $(".userForm").addClass('none')
            form.val('userForm', '')
        })
    })
</script>
</html>