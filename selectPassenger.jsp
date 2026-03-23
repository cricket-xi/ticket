<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>选择乘客 - 机票预订</title>
    <style>
        /* 保持原有样式不变 */
        body {
            font-family: "Microsoft YaHei", sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f7fa;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1, h2 {
            color: #333;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
        }
        .flight-info {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 6px;
            margin-bottom: 30px;
        }
        .flight-info p {
            margin: 8px 0;
            color: #666;
        }
        .passenger-list {
            margin: 20px 0;
        }
        .passenger-item {
            display: flex;
            align-items: center;
            padding: 12px;
            border: 1px solid #eee;
            border-radius: 6px;
            margin-bottom: 10px;
            transition: background-color 0.3s;
        }
        .passenger-item:hover {
            background-color: #f5f5f5;
        }
        .passenger-item input[type="checkbox"] {
            margin-right: 15px;
            width: 18px;
            height: 18px;
        }
        .passenger-details {
            flex: 1;
        }
        .passenger-name {
            font-weight: bold;
            margin-right: 15px;
        }
        .cabin-type {
            margin: 20px 0;
        }
        .cabin-type label {
            margin-right: 20px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
        }
        .cabin-type .price-tag {
            color: #1a73e8;
            margin-left: 8px;
            font-size: 14px;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .btn-primary {
            background-color: #1a73e8;
            color: white;
        }
        .btn-primary:hover {
            background-color: #1557b0;
        }
        .btn-secondary {
            background-color: #f0f0f0;
            color: #333;
            margin-left: 10px;
        }
        .btn-secondary:hover {
            background-color: #e0e0e0;
        }
        .add-passenger-form {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 2px dashed #eee;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: inline-block;
            width: 100px;
            text-align: right;
            margin-right: 15px;
            color: #666;
        }
        .form-group input {
            padding: 8px 10px;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .error-message {
            color: #dc3545;
            margin: 10px 0;
            padding: 10px;
            background-color: #f8d7da;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>选择乘客</h1>

    <!-- 航班信息展示（补充舱位价格显示） -->
    <div class="flight-info">
        <h2>航班信息</h2>
        <p>
            <strong>航班号：</strong>${flight.flightNumber}
            <strong>出发城市：</strong>${flight.departureCity}（${flight.departureAirport}）
            <strong>到达城市：</strong>${flight.arrivalCity}（${flight.arrivalAirport}）
        </p>
        <p>
            <strong>出发时间：</strong>${flight.departureTime}
            <strong>到达时间：</strong>${flight.arrivalTime}
            <strong>机型：</strong>${flight.aircraft}
        </p>
        <p>
            <strong>参考价格：</strong>
            经济舱 ¥<fmt:formatNumber value="${flight.economyPrice}" pattern="0.00" /> |
            商务舱 ¥<fmt:formatNumber value="${flight.businessPrice}" pattern="0.00" /> |
            头等舱 ¥<fmt:formatNumber value="${flight.firstClassPrice}" pattern="0.00" />
        </p>
    </div>

    <!-- 错误信息展示 -->
    <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
    </c:if>

    <!-- 乘客选择表单 -->
    <form action="${pageContext.request.contextPath}/passengers/confirm" method="post">
        <input type="hidden" name="flightId" value="${flight.id}">
        <!-- 隐藏域：传递航班各舱位价格（供后端计算） -->
        <input type="hidden" name="economyPrice" value="${flight.economyPrice}">
        <input type="hidden" name="businessPrice" value="${flight.businessPrice}">
        <input type="hidden" name="firstClassPrice" value="${flight.firstClassPrice}">

        <h2>选择已有乘客</h2>
        <div class="passenger-list">
            <c:choose>
                <c:when test="${not empty passengers}">
                    <c:forEach var="passenger" items="${passengers}">
                        <div class="passenger-item">
                            <input type="checkbox" name="passengerId" value="${passenger.id}" id="p${passenger.id}">
                            <label for="p${passenger.id}">
                                <span class="passenger-name">${passenger.name}</span>
                                <span>证件号：${passenger.idCard}</span>
                                <span>电话：${passenger.phone}</span>
                                <span>类型：${passenger.type}</span>
                            </label>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p>您暂无保存的乘客信息，请添加新乘客</p>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- 舱位类型选择（value改为英文，与后端对齐） -->
        <div class="cabin-type">
            <h3>选择舱位类型</h3>
            <label>
                <input type="radio" name="cabinType" value="economy" checked>
                经济舱
                <span class="price-tag">¥<fmt:formatNumber value="${flight.economyPrice}" pattern="0.00" /></span>
            </label>
            <label>
                <input type="radio" name="cabinType" value="business">
                商务舱
                <span class="price-tag">¥<fmt:formatNumber value="${flight.businessPrice}" pattern="0.00" /></span>
            </label>
            <label>
                <input type="radio" name="cabinType" value="first_class">
                头等舱
                <span class="price-tag">¥<fmt:formatNumber value="${flight.firstClassPrice}" pattern="0.00" /></span>
            </label>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn btn-primary">确认选择并继续</button>
            <a href="${pageContext.request.contextPath}/purchase" class="btn btn-secondary">返回航班列表</a>
        </div>
    </form>

    <!-- 添加新乘客表单（保持不变） -->
    <div class="add-passenger-form">
        <h2>添加新乘客</h2>
        <form action="${pageContext.request.contextPath}/passengers/add" method="post">
            <input type="hidden" name="flightId" value="${flight.id}">
            <div class="form-group">
                <label for="name">姓名：</label>
                <input type="text" id="name" name="name" required placeholder="请输入乘客姓名">
            </div>
            <div class="form-group">
                <label for="idCard">证件号：</label>
                <input type="text" id="idCard" name="idCard" required placeholder="请输入身份证号">
            </div>
            <div class="form-group">
                <label for="phone">手机号：</label>
                <input type="tel" id="phone" name="phone" required placeholder="请输入手机号码">
            </div>
            <div class="form-group">
                <label for="type">乘客类型：</label>
                <input type="text" id="type" name="type" required placeholder="例如：成人、儿童、学生">
            </div>
            <button type="submit" class="btn btn-primary">添加乘客</button>
        </form>
    </div>
</div>
</body>
</html>