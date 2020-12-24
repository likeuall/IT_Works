<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    /* The popup form - hidden by default */
    .form-popup {
    width: 300px;
    border: 3px solid #f1f1f1;
    z-index: 9;
    padding-left: 5px;
    font-size: 13px;
    }

    /* Add styles to the form container */
    .form-container {
    max-width: 350px;
    padding: 10px;
    background-color: white;
    }

    /* Set a style for the submit/login button */
    .form-container .btn {
    background-color: #17a2b8;
    color: white;
    border-radius: 10%;
    padding: 8px;
    border: none;
    cursor: pointer;
    margin-top:10px;
    width: 50px;
    }

    /* Add a red background color to the cancel button */
    .form-container .cancel {
    background-color: red;
    }
    .form-container table th{width: 100px; height: 35px; font-size: 12px; font-weight: 700; background-color: rgb(240, 240, 240); text-align: center;}
</style>
<body>
	<!-- 회의실 예약조회 모달 -->
    <div class="form-popup" id="reservation">
        <div class="form-container">
            <h1>회의실 예약 조회</h1>
                <div>
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
            <!-- Modal footer -->
            <div class="modal-footer" align="right">
                <!-- 작성자만 볼 수 있게 -->
                <button type="submit" class="btn btn-info">수정</button>
                <button type="button" class="btn cancel" onclick="window.close();">닫기</button>
            </div>
        </div>
    </div>
</body>
</html>