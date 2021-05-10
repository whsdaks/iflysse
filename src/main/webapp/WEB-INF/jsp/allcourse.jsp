<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>
        查询老师或者班级周课表
    </title>
<link rel="shortcut icon" href="images/log.ico">
    <script type="text/javascript">

        function callDialog(openPage, widthheigh) {
            showModalDialog(openPage, window, widthheigh);
        }

        function update_fresh() {
            form1.document.getElementById("lin_刷新").click();
        }

    </script>

    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            height: 32px;
        }

        .style4 {
            height: 29px;
        }

        .style5 {
            height: 28px;
        }

    </style>

    <link href="new_style_b.css" rel="stylesheet" type="text/css">
</head>
<body>
<form name="form1" method="post" action="xqpk_zkb_lsbj.aspx" id="form1">
    <div>
        <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
        <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
        <input type="hidden" name="__LASTFOCUS" id="__LASTFOCUS" value="">
        <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
               value="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">
    </div>

    <script type="text/javascript">
        //<![CDATA[
        var theForm = document.forms['form1'];
        if (!theForm) {
            theForm = document.form1;
        }

        function __doPostBack(eventTarget, eventArgument) {
            if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                theForm.__EVENTTARGET.value = eventTarget;
                theForm.__EVENTARGUMENT.value = eventArgument;
                theForm.submit();
            }
        }

        //]]>
    </script>


    <div>

        <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="1C0BCDA0">
        <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION"
               value="/wEWPgKSmPDmBQKfq6jIAwKM1rLPDAKambfnAgKOmrfnAgK02P6xAwKo2f6xAwKYr5GVBgKcqJGVBgKalbOSDQKelrOSDQKsl8HBCAKgkMHBCAK4kprKAgKr74DNDQL/tsbLDQKQucTmCQLgt9ntBQKrxZLxBwKC0I6RCALA8oQ8Av3G+LkJAtzRmeIBAvXOtLwGApuOhZsNArDtl8gOArGavsAHAtHWz6AEAovjj/oHAvn52ZoKAuuY8cMGAvjl68QJAuT3260KAuX3260KAub3260KAuf3260KAuD3260KAuH3260KAuL3260KAvP3260KAvz3260KAuT3m64KAuT3l64KAuT3k64KAuT3r64KAuT3q64KAuT3p64KAuT3o64KAuT3v64KAuT3+60KAuT3960KAuX3m64KAuX3l64KAv/z+fsNAvvqspAMAs6oqrYDAt3VsLEMAveHnY8CAuDz3YAPArKy19cBAuzp6sQNAtupr7QFGtt1NEa3eSRsMSx0eAhfMqnsbj4=">
    </div>
    <div>


        <table class="style1">
            <tbody>
            <tr>
                <td class="style2">&nbsp;&nbsp;当前学年学期：<span id="Lab_当前学年学期" class="f14pxfbb" style="font-weight:bold;">2020-2021学年第二学期</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前周数：<span id="Lab_当前周数" class="f14pxfbb"
                                                                               style="font-weight:bold;">3</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;温馨提示：<span id="Lab_提示" class="f14pxfbb"
                                                                         style="font-weight:bold;">查询老师或者班级周课表</span>
                </td>
            </tr>

            <tr bgcolor="#E7E9F1">
                <td class="style4"><font face="宋体" size="2" style="vertical-align: bottom"><span
                        style="font-size: 10pt; color: #293235">
                &nbsp;查询学年学期:<select name="Dr_学年学期"
                                     onchange="javascript:setTimeout('__doPostBack(\'Dr_学年学期\',\'\')', 0)" id="Dr_学年学期"
                                     title="来源于教务系统设置排课查询学年学期">
	<option selected="selected" value="--选择--">--选择--</option>
	<option value="2020-2021学年第二学期">2020-2021学年第二学期</option>
	<option value="2020-2021学年第一学期">2020-2021学年第一学期</option>
	<option value="2019-2020学年第二学期">2019-2020学年第二学期</option>
	<option value="2019-2020学年第一学期">2019-2020学年第一学期</option>
	<option value="2018-2019学年第二学期">2018-2019学年第二学期</option>
	<option value="2018-2019学年第一学期">2018-2019学年第一学期</option>
	<option value="2017-2018学年第二学期">2017-2018学年第二学期</option>
	<option value="2017-2018学年第一学期">2017-2018学年第一学期</option>
	<option value="2016-2017学年第二学期">2016-2017学年第二学期</option>
	<option value="2016-2017学年第一学期">2016-2017学年第一学期</option>

</select>
                &nbsp;&nbsp;<span id="Lab_开课部门">开课部门:</span><select name="Dr_开课部门"
                                                                    onchange="javascript:setTimeout('__doPostBack(\'Dr_开课部门\',\'\')', 0)"
                                                                    id="Dr_开课部门">
	<option selected="selected" value="--选择--">--选择--</option>
	<option value="创新创业中心">创新创业中心</option>
	<option value="商务与管理系">商务与管理系</option>
	<option value="机电工程系">机电工程系</option>
	<option value="珠宝系">珠宝系</option>
	<option value="大唐信息技术学院">大唐信息技术学院</option>
	<option value="空中乘务">空中乘务</option>
	<option value="应用外语系">应用外语系</option>
	<option value="汽车工程系">汽车工程系</option>
	<option value="教务处">教务处</option>
	<option value="教育学院">教育学院</option>
	<option value="基础部">基础部</option>
	<option value="餐旅服务学院">餐旅服务学院</option>
	<option value="艺术设计系">艺术设计系</option>
	<option value="学生处（学工部）">学生处（学工部）</option>
	<option value="计算机信息系">计算机信息系</option>

</select>
                    *&nbsp;&nbsp;<span id="Lab_开始周数">开始周:</span><select name="Dr_开始周数"
                                                                        onchange="javascript:setTimeout('__doPostBack(\'Dr_开始周数\',\'\')', 0)"
                                                                        id="Dr_开始周数">
	<option selected="selected" value="--选择--">--选择--</option>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">10</option>
	<option value="11">11</option>
	<option value="12">12</option>
	<option value="13">13</option>
	<option value="14">14</option>
	<option value="15">15</option>
	<option value="16">16</option>
	<option value="17">17</option>
	<option value="18">18</option>
	<option value="19">19</option>
	<option value="20">20</option>
	<option value="21">21</option>

</select>
                &nbsp;&nbsp;<span id="Lab_结束周数">结束周:</span><select name="Dr_结束周数" id="Dr_结束周数">

</select>
                &nbsp;&nbsp;<a id="LinkB_导出Word" href="javascript:__doPostBack('LinkB_导出Word','')"><font face="宋体"
                                                                                                         size="2"
                                                                                                         style="vertical-align: bottom">导出到Word </font></a>
                &nbsp;&nbsp;<a id="LinkB_导出Excel" href="javascript:__doPostBack('LinkB_导出Excel','')"><font face="宋体"
                                                                                                           size="2"
                                                                                                           style="vertical-align: bottom">导出到Excel </font></a>
                 </span></font>
                </td>
            </tr>

            <tr bgcolor="#E7E9F1">
                <td class="style5" valign="middle"><span style="font-size: 10pt; color: #293257">
                     &nbsp;&nbsp;<select name="Dr_老师班级找"
                                         onchange="javascript:setTimeout('__doPostBack(\'Dr_老师班级找\',\'\')', 0)"
                                         id="Dr_老师班级找">
	<option selected="selected" value="--选择--">--选择--</option>
	<option value="按老师查">按老师查</option>
	<option value="按班级查">按班级查</option>

</select>
                     :<textarea name="Text_找教师" rows="2" cols="20" id="Text_找教师"
                                style="color:#293257;height:21px;width:70px;"></textarea>
                     <input type="image" name="Im_f_js" id="Im_f_js" title="以输入内容检索老师或班级" src="../images/Find.gif"
                            style="height:16px;width:14px;border-width:0px;">
                     <select name="Dr_任课老师" id="Dr_任课老师">

</select>
                     *&nbsp;&nbsp;&nbsp;&nbsp;<input type="image" name="ImageB_查询" id="ImageB_查询"
                                                     src="../images/B_Button_CX.gif" style="border-width:0px;">
                     &nbsp;&nbsp;注：*表可不选
                  </span>
                </td>
            </tr>

            </tbody>
        </table>


        <table class="style1">
            <tbody>
            <tr>
                <td style="FONT-WEIGHT: bold; FONT-SIZE: 13pt; COLOR: #6c4706; text-align: center;" colspan="2">
                    <span id="lbl_学年学期"></span>
                    <span id="lbl_班级名称"></span>课程表
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table border="1" bordercolor="E6E8E5" cellpadding="0" cellspacing="0" class="style1">
                        <tbody>
                        <tr bgcolor="F2F7FB" height="35" align="center" valign="middle">
                            <td>
                                时间
                            </td>
                            <td width="15%">
                                星期一
                            </td>
                            <td width="15%">
                                星期二
                            </td>
                            <td width="15%">
                                星期三
                            </td>
                            <td width="15%">
                                星期四
                            </td>
                            <td width="15%">
                                星期五
                            </td>
                            <td>
                                星期六
                            </td>
                            <td>
                                星期日
                            </td>
                        </tr>
                        <tr bgcolor="FFFFFB" height="50">
                            <td width="40px" align="center" valign="middle">
                                上午
                            </td>
                            <td valign="top">
                                <span id="Label_1_1">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_2_1">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_3_1">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_4_1">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_5_1">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_6_1">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_7_1">&nbsp;</span>
                            </td>
                        </tr>

                        <tr bgcolor="#DFFFDF" height="50">
                            <td align="center" valign="middle">
                                中午
                            </td>
                            <td valign="top">
                                <span id="Label_1_4">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_2_4">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_3_4">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_4_4">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_5_4">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_6_4">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_7_4">&nbsp;</span>
                            </td>
                        </tr>

                        <tr bgcolor="#FFFFFB" height="50">
                            <td align="center" valign="middle">
                                下午
                            </td>
                            <td valign="top">
                                <span id="Label_1_2">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_2_2">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_3_2">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_4_2">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_5_2">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_6_2">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_7_2">&nbsp;</span>
                            </td>
                        </tr>
                        <tr bgcolor="#DFFFDF" height="50">
                            <td align="center" valign="middle">
                                晚上
                            </td>
                            <td valign="top">
                                <span id="Label_1_3">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_2_3">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_3_3">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_4_3">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_5_3">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_6_3">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_7_3">&nbsp;</span>
                            </td>
                        </tr>

                        <tr bgcolor="#FFFFFB" height="50">
                            <td align="center" valign="middle">
                                全天
                            </td>
                            <td valign="top">
                                <span id="Label_1_5">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_2_5">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_3_5">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_4_5">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_5_5">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_6_5">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_7_5">&nbsp;</span>
                            </td>
                        </tr>

                        <tr bgcolor="#DFFFDF" height="50">
                            <td align="center" valign="middle">
                                其他
                            </td>
                            <td valign="top">
                                <span id="Label_1_6">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_2_6">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_3_6">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_4_6">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_5_6">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_6_6">&nbsp;</span>
                            </td>
                            <td valign="top">
                                <span id="Label_7_6">&nbsp;</span>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </td>
            </tr>

            <tr>
                <td>


                </td>
                <td>
                    <span id="lbl_当前时间"></span>
                </td>
            </tr>
            </tbody>
        </table>


    </div>

    <script>alert('你没选择具体的学年学期,请先选择！！');</script>
</form>


</body>
</html>