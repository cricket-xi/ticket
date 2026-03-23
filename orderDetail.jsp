<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>订单详情</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
        }
        h1 {
            color: #333;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }
        .detail-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .detail-table th, .detail-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        .detail-table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .detail-table tr:hover {
            background-color: #f5f5f5;
        }
        .total-price {
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
            color: #d9534f;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #4CAF50;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>订单详情</h1>

    <table class="detail-table">
        <tr>
            <th>序号</th>
            <th>乘客姓名</th>
            <th>身份证号</th>
            <th>票价(元)</th>
        </tr>
        <c:forEach items="${orderDetails}" var="detail" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${detail.passengerName}</td>
                <td>${detail.passengerIdCard}</td>
                <td>${detail.price}</td>
            </tr>
        </c:forEach>
    </table>

    <div class="total-price">
        总金额:
        <c:set var="total" value="0" />
        <c:forEach items="${orderDetails}" var="detail">
            <c:set var="total" value="${total + detail.price}" />
        </c:forEach>
        ${total} 元
    </div>

    <a href="javascript:history.back()" class="back-link">返回上一页</a>
</div>
</body>
</html>