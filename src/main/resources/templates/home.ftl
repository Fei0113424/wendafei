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
    .layui-form-label{
        width: 100px;
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

                   <#-- <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">车牌号</label>
                            <div class="layui-input-inline">
                                <input name="cph" class="layui-input" type="text" placeholder="请输入车牌号"
                                       autocomplete="off">
                            </div>
                        </div>
                    </div>-->

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">查询来源</label>
                            <div class="layui-input-inline">
                                <input name="cxly" class="layui-input" type="text" placeholder="请输入查询来源"
                                       autocomplete="off">
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">查询类型</label>
                            <div class="layui-input-inline">
                                <input name="cxlx" class="layui-input" type="text" placeholder="请输入查询类型"
                                       autocomplete="off">
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">身份证件号</label>
                            <div class="layui-input-inline">
                                <input name="sfzh" class="layui-input" type="text" placeholder="请输入身份证号"
                                       autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名</label>
                            <div class="layui-input-inline">
                                <input name="xm" class="layui-input" type="text" placeholder="请输入姓名"
                                       autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">是否有证件</label>
                            <div class="layui-input-inline">
                                <input name="sfyzj" class="layui-input" type="text" placeholder="请输入"
                                       autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">是否常住人口</label>
                            <div class="layui-input-inline">
                                <input name="sfczrk" class="layui-input" type="text" placeholder="请输入"
                                       autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">是否暂住人口</label>
                            <div class="layui-input-inline">
                                <input name="sfzzrk" class="layui-input" type="text" placeholder="请输入"
                                       autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">是否持有居住证</label>
                            <div class="layui-input-inline">
                                <input name="sfcyjzz" class="layui-input" type="text" placeholder="请输入"
                                       autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">有效标志</label>
                            <div class="layui-input-inline">
                                <input name="yxbz" class="layui-input" type="text" placeholder="请输入"
                                       autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">创建时间</label>
                            <div class="layui-input-inline">
                                <input name="create_time" class="layui-input" type="text" placeholder="暂无创建时间"
                                       autocomplete="off" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">删除时间</label>
                            <div class="layui-input-inline">
                                <input name="delete_time" class="layui-input" type="text" placeholder="暂无删除时间"
                                       autocomplete="off" readonly>
                            </div>
                        </div>
                    </div>


                    <div class="text-center addBtnGroup none">
                        <button class="layui-btn layui-btn-normal addSubmit">提交</button>
                        <button class="layui-btn layui-btn-danger cancel">取消</button>
                    </div>
                    <div class="text-center resultBtnGroup none">
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
                        $(".userForm input[name='create_time']").attr('readonly','readonly')
                            $(".userForm input[name='delete_time']").attr('readonly','readonly')
                    } else {
                        currenId=$("#idcard").val()
                        // $(".userinfo").text(res.data)
                        $(".userForm").removeClass('none')
                        $(".userForm input").attr('readonly','readonly')
                        $(".resultBtnGroup").removeClass('none')
                        $(".addBtnGroup").addClass('none')
                        // form.val('userForm', res.data)
                       $(".userForm input[name='sfzh']").val( res.data.sfzh),
                          $(".userForm input[name='cxly']").val(res.data.cxly),
                        $(".userForm input[name='cxlx']").val(res.data.cxlx)
                        $(".userForm input[name='xm']").val(res.data.xm),
                           //$(".userForm input[name='cph']").val(res.data.cph),
                            $(".userForm input[name='sfyzj']").val(res.data.sfyzj),
                            $(".userForm input[name='sfczrk']").val(res.data.sfczrk),
                            $(".userForm input[name='sfzzrk']").val(res.data.sfzzrk),
                            $(".userForm input[name='sfcyjzz']").val(res.data.sfcyjzz),
                            $(".userForm input[name='create_time']").val(res.data.create_time),
                            $(".userForm input[name='delete_time']").val(res.data.delete_time),
                            $(".userForm input[name='yxbz']").val(res.data.yxbz)


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
            $(".userForm input[name='create_time']").attr('readonly','readonly')
            $(".userForm input[name='delete_time']").attr('readonly','readonly')
            $(".resultBtnGroup").addClass('none')
            $(".addBtnGroup").removeClass('none')
        })
        $(".updateBtn").click(function (){
            $(".userForm input").removeAttr("readonly");
            $(".userForm input[name='create_time']").attr('readonly','readonly')
            $(".userForm input[name='delete_time']").attr('readonly','readonly')
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
                    cxly: $(".userForm input[name='cxly']").val(),
                    cxlx: $(".userForm input[name='cxlx']").val(),
                    //cph: $(".userForm input[name='cph']").val(),
                    xm: $(".userForm input[name='xm']").val(),
                    sfyzj: $(".userForm input[name='sfyzj']").val(),
                    sfczrk: $(".userForm input[name='sfczrk']").val(),
                    sfzzrk: $(".userForm input[name='sfzzrk']").val(),
                    sfcyjzz: $(".userForm input[name='sfcyjzz']").val(),
                    create_time: $(".userForm input[name='create_time']").val(),
                    delete_time: $(".userForm input[name='delete_time']").val(),
                    yxbz: $(".userForm input[name='yxbz']").val()

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