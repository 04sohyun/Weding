<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>11문의내역</title>
    <style>
        a { color: #333; }
        a:hover { color: #333; text-decoration: none; }

        .side-menu {
            width: 200px;
            float: left;
        }
        .side-menu ul {
            margin: 0;
            padding: 0;
            display: inline;
        }
        .side-menu ul li {
            list-style-type: none;
            margin-bottom: 5px;
        }

        .side-menu ul li:first-child {
            font-size: 1.3em;
            font-weight: bold;
            margin-bottom: 30px;
        }

        .table {
            width: 910px;
            float: left;
        }

        footer {
            clear: both;
            width: 100%;
            height: 50px;
            background-color: gray;
        }

        .footer {
            margin: 0 auto;
            width: 1110px;
            height: inherit;
            line-height: 50px;
            text-align: center;
            color: white;
        }

        .sub-banner-wrap {
            width: 100%;
            height: 150px;
            background-color: grey;
            margin-bottom: 100px;
        }

        .sub-banner {
            margin: 0 auto;
            width: 1110px;
            height: 150px;
            line-height: 150px;
            text-align: center;
            font-weight: bold;
            font-size: 1.8em;
        }

    </style>
</head>
<body>
    <div class="sub-banner-wrap">
        <div class="sub-banner">
            1:1문의답변
        </div>
    </div>
    <div class="container">
        <div class="side-menu">
              <%@include file = "menu.jsp"%>
        </div>
        <table class="table table-bordered">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>답변여부</th>
            </tr>

            <!-- 반복 여기서부터 -->
            <tr>
                <td>1</td>
                <td><a href="#">제목</a></td>
                <td>홍길동</td>
                <td>2022-01-22</td>
                <td>N</td>
            </tr>
            <!-- 여기까지 반복 -->

            <!-- 지워야되는 부분 여기서부터 -->
            <tr>
                <td>1</td>
                <td>제목</td>
                <td>홍길동</td>
                <td>2022-01-22</td>
                <td>N</td>
            </tr>

            <tr>
                <td>1</td>
                <td>제목</td>
                <td>홍길동</td>
                <td>2022-01-22</td>
                <td>N</td>
            </tr>

            <tr>
                <td>1</td>
                <td>제목</td>
                <td>홍길동</td>
                <td>2022-01-22</td>
                <td>N</td>
            </tr>

            <tr>
                <td>1</td>
                <td>제목</td>
                <td>홍길동</td>
                <td>2022-01-22</td>
                <td>N</td>
            </tr>

            <tr>
                <td>1</td>
                <td>제목</td>
                <td>홍길동</td>
                <td>2022-01-22</td>
                <td>N</td>
            </tr>

            <tr>
                <td>1</td>
                <td>제목</td>
                <td>홍길동</td>
                <td>2022-01-22</td>
                <td>N</td>
            </tr>

            <tr>
                <td>1</td>
                <td>제목</td>
                <td>홍길동</td>
                <td>2022-01-22</td>
                <td>N</td>
            </tr>

            <tr>
                <td>1</td>
                <td>제목</td>
                <td>홍길동</td>
                <td>2022-01-22</td>
                <td>N</td>
            </tr>

            <tr>
                <td>1</td>
                <td>제목</td>
                <td>홍길동</td>
                <td>2022-01-22</td>
                <td>N</td>
            </tr>
            <!-- 지워도되는 부분 여기까지 -->
        </table>
    </div>

    <footer>
    	<%@include file = "../footer.jsp"%>
    </footer>
</body>
</html>