<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Amiri:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style>
    div{border: 0px solid rgb(89, 89, 89); box-sizing: border-box;}
    .wrap{
        padding-top: 50px;
        margin:auto; 
        width: 800px;
        height: 800px;
    }
    #datepick{height:5%; margin-top: 40px;}
    #floor{height: 10%; margin-top: 20px;}
    #tablewrap{height: 50%;}

    #datepick>*{margin-left: 30px; border: 0;}
    input{border: 0;}
    .btn1-light{border-radius: 50%; font-size: 10px; }
    .btn1{padding: 0px 10px 3px 10px; font-size: 13px; background-color: lightgray; border-radius: 10%}
    button:hover{cursor: pointer;}
    #floor>ul {width:100%; height:100%; list-style-type: none; margin: auto; padding:0; text-align:center;}
    #floor>ul>li{width:10%; height:100%; line-height: 70px; display: inline-block;}
    #floor>ul>li a{text-decoration: none; color:black;}

    .tablewrap>table {width: 100%; height: 100%;}
    #tablewrap>table th{height: 35px; font-size: 14px; font-weight: 700; background-color: rgb(240, 240, 240); text-align: center;}
    .tablewrap>table tbody>tr{text-align: center; font-size: 13px; height: 30px;}
    #tablewrap>table tr :hover{cursor: pointer; background-color: rgb(240, 240, 240);}
</style>
<body>

	<jsp:include page="../common/approvalNavbar.jsp"/>
	
	<script>
        function getToday(){
            // 오늘 날짜 구하기
            const offset = new Date().getTimezoneOffset() * 60000;
            const today = new Date(Date.now() - offset);
            document.getElementById("datePicker").value = today.toISOString().substring(0,10);
        }
        $(function(){
            getToday();
            // 예약창(팝업) 띄우기
            $("#tablewrap>table tbody>tr>td").click(function(){
                open("reservation.re?floor=${}?reserveNo=${}","childForm",
                    "width=430, height=600, location=no, menubar=no, scrollbars=no, status=no, toolbar=no, resizable=no");
                
            })
        })
        function dateset(reday, remonth){
            // 날짜 두자리수 표현
            if(reday < 10){
                reday = String(("0" + reday));
            }
            if(remonth<10){
                remonth = String(("0" + remonth));
            }
            return {
                day:reday, 
                month:remonth
                };
        }
        function minusDate(){
            // 날짜 마이너스
            var value = new Date(document.getElementById("datePicker").value);
                value = new Date(value.getFullYear(), value.getMonth(), value.getDate()-1);
            var date = dateset(value.getDate(), value.getMonth()+1);
            var str = value.getFullYear()+"-"+date.month+"-"+date.day;
            document.getElementById("datePicker").value = str;
        }
        function plusDate(){
            // 날짜 플러스
            var value = new Date(document.getElementById("datePicker").value);
                value = new Date(value.getFullYear(), value.getMonth(), value.getDate()+1);
            var date = dateset(value.getDate(), value.getMonth()+1);
            var str = value.getFullYear()+"-"+date.month+"-"+date.day;
            document.getElementById("datePicker").value = str;
        }
    </script>
    

    
    <div class="wrap">
        <h4>회의실 예약</h4>
        <div id="datepick" align="center">
            <button type="button" class="btn1-light" onclick="minusDate();"><span class="material-icons">arrow_left</span></button>
            <input type="date" id="datePicker">
            <button type="button" class="btn1-light" onclick="plusDate();"><span class="material-icons">arrow_right</span></button>
            <button type="button" class="btn1" onclick="getToday();">Today</button>
        </div>
        <div id="floor">
            <ul>
            	<c:forEach var="i" begin="3" end="8">
	                <li><a href="reservation.re?floor=${ i }">${ i }층</a></li>
            	</c:forEach>
            </ul>
        </div>
        
        <div id="tablewrap" class="tablewrap" align="center">
            <table border="1" bordercolor="lightgray">
                <thead>
                    <tr>
                        <th width="60px"></th>
                        <th width="150px" data-toggle="tooltip" title="6인, 화이트보드, 노트북">소회의실 Ⅰ</th>
                        <th width="150px" data-toggle="tooltip" title="8인, 화이트보드, 노트북">소회의실 Ⅱ</th>
                        <th width="150px" data-toggle="tooltip" title="15인, 화이트보드, 노트북">중회의실</th>
                        <th width="150px" data-toggle="tooltip" title="30인, 화이트보드, 노트북, 빔프로젝터">대회의실</th>
                        <th width="150px" data-toggle="tooltip" title="50인, 탁상마이크, 노트북, 빔프로젝터">중역회의실</th>
                    </tr>
                </thead>
                <tbody align="center">
                    <tr>
                        <th>09:00</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>10:00</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>11:00</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>12:00</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>13:00</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>14:00</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>15:00</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>16:00</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>17:00</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>18:00</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- 회의실 예약 모달 -->
    <div class="modal fade" id="reservation">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회의실 예약</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button> 
                </div>
                <form action="★" method="post">
                    <!-- Modal Body -->
                    <div class="modal-body tablewrap">
                        <table>
                            <tr>
                                <th>신청자</th>
                                <td><input type="text" name="" value="홍길동" readonly></td>
                            </tr>
                            <tr>
                                <th>부서</th>
                                <td><input type="text" name="" value="개발팀" readonly></td>
                            </tr>
                            <tr>
                                <th>시작일자 *</th>
                                <td>
                                    <input type="date" name="" required>
                                    <input type="text" class="timepicker" name="time"/>   
                                </td>
                            </tr>
                            <tr>
                                <th>종료일자 *</th>
                                <td>
                                    <input type="datetime-local" name="" required>
                                </td>
                            </tr>
                            <tr>
                                <th>회의실 *</th>
                                <td>
                                    <select name="" id="" required>
                                        <option value="소회의실 Ⅰ">소회의실 Ⅰ</option>
                                        <option value="소회의실 Ⅱ">소회의실 Ⅱ</option>
                                        <option value="중회의실">중회의실</option>
                                        <option value="대회의실">대회의실</option>
                                        <option value="중역회의실">중역회의실</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>사용목적 * </th>
                                <td><input type="text" name="" value="" placeholder="내용을 입력해주세요" required></td>
                            </tr>
                            <tr>
                                <th>외부인참석여부</th>
                                <td>
                                    <label class="form-check-label" style="margin-right: 30px;">
                                        <input type="radio" name="visiterYn" id="yes"> 예
                                    </label>
                                    <label class="form-check-label">
                                        <input type="radio" name="visiterYn" id="no"> 아니오
                                    </label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-info">신청</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <!-- 회의실 조회 모달 -->
    <div class="modal fade" id="reservationCheck">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회의실 예약현황</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button> 
                </div>
                    <!-- Modal Body -->
                    <div class="modal-body tablewrap">
                        <table>
                            <tr>
                                <th>신청자</th>
                                <td>홍길동</td>
                            </tr>
                            <tr>
                                <th>부서</th>
                                <td>개발팀</td>
                            </tr>
                            <tr>
                                <th>시작일자</th>
                                <td>
                                    2020.12.14 (월) 09:00 
                                </td>
                            </tr>
                            <tr>
                                <th>종료일자</th>
                                <td>
                                    2020.12.14 (월) 11:00 
                                </td>
                            </tr>
                            <tr>
                                <th>회의실</th>
                                <td>
                                    소회의실 Ⅰ
                                </td>
                            </tr>
                            <tr>
                                <th>사용목적 </th>
                                <td>총무팀 주간 회의</td>
                            </tr>
                            <tr>
                                <th>외부인참석여부</th>
                                <td>
                                    예
                                </td>
                            </tr>
                        </table>
                    </div>
            </div>
        </div>
    </div>
</body>
</html>