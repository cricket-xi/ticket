<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单支付 - 机票预订系统</title>
    <style>
        /* 原有样式保持不变，新增双按钮样式 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Microsoft YaHei", sans-serif;
        }
        body {
            background-color: #f5f7fa;
            padding: 30px 0;
            color: #333;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 0 20px;
        }
        .page-title {
            color: #1a73e8;
            margin-bottom: 25px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        .card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 25px;
            margin-bottom: 20px;
        }
        .card-title {
            font-size: 18px;
            margin-bottom: 20px;
            color: #333;
            padding-bottom: 10px;
            border-bottom: 1px solid #f0f0f0;
        }
        .flight-info {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-bottom: 15px;
        }
        .info-item {
            margin-bottom: 10px;
        }
        .info-label {
            color: #666;
            font-size: 14px;
            margin-bottom: 3px;
            display: block;
        }
        .info-value {
            font-weight: 500;
        }
        .passenger-list {
            margin-top: 15px;
        }
        .passenger-item {
            display: flex;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #f0f0f0;
        }
        .passenger-item:last-child {
            border-bottom: none;
        }
        .passenger-avatar {
            width: 40px;
            height: 40px;
            background-color: #e8f0fe;
            border-radius: 50%;
            color: #1a73e8;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            margin-right: 15px;
        }
        .passenger-name {
            font-weight: 500;
            margin-bottom: 3px;
        }
        .passenger-id {
            font-size: 14px;
            color: #666;
        }
        .price-detail {
            margin-top: 15px;
        }
        .price-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #f0f0f0;
        }
        .price-item:last-child {
            border-bottom: 2px solid #f0f0f0;
            margin-top: 10px;
            font-weight: bold;
            font-size: 16px;
        }
        .price-label {
            color: #666;
        }
        .price-value {
            color: #d93025;
        }
        .payment-methods {
            margin-top: 20px;
        }
        .method-option {
            display: flex;
            align-items: center;
            padding: 15px;
            border: 2px solid #eee;
            border-radius: 6px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: all 0.3s;
        }
        .method-option:hover {
            border-color: #d2e3fc;
        }
        .method-option.selected {
            border-color: #1a73e8;
            background-color: #f0f7ff;
        }
        .method-option input {
            margin-right: 15px;
            width: 18px;
            height: 18px;
        }
        .method-icon {
            width: 40px;
            height: 40px;
            margin-right: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .method-icon img {
            max-width: 100%;
            max-height: 100%;
        }
        .method-info {
            flex: 1;
        }
        .method-name {
            font-weight: 500;
            margin-bottom: 3px;
        }
        .method-desc {
            font-size: 14px;
            color: #666;
        }
        /* 新增：双按钮容器样式 */
        .pay-buttons {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        .pay-btn {
            padding: 12px 40px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        /* 成功按钮样式 */
        .success-btn {
            background-color: #34a853;
            color: white;
        }
        .success-btn:hover {
            background-color: #2d9248;
        }
        /* 失败按钮样式 */
        .fail-btn {
            background-color: #ea4335;
            color: white;
        }
        .fail-btn:hover {
            background-color: #d33725;
        }
        .error-message {
            color: #d93025;
            background-color: #fef0f0;
            padding: 12px 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            border-left: 4px solid #d93025;
        }
        .back-link {
            display: inline-block;
            margin-right: 15px;
            color: #1a73e8;
            text-decoration: none;
            padding: 12px 0;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="page-title">订单支付</h1>

    <!-- 错误信息 -->
    <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
    </c:if>

    <!-- 航班信息 -->
    <div class="card">
        <h2 class="card-title">航班信息</h2>
        <div class="flight-info">
            <div>
                <span class="info-label">航班号</span>
                <span class="info-value">${flight.flightNumber}</span>
            </div>
            <div>
                <span class="info-label">出发城市</span>
                <span class="info-value">${flight.departureCity}（${flight.departureAirport}）</span>
            </div>
            <div>
                <span class="info-label">到达城市</span>
                <span class="info-value">${flight.arrivalCity}（${flight.arrivalAirport}）</span>
            </div>
            <div>
                <span class="info-label">出发时间</span>
                <span class="info-value">${flight.departureTime}</span>
            </div>
            <div>
                <span class="info-label">到达时间</span>
                <span class="info-value">${flight.arrivalTime}</span>
            </div>
            <div>
                <span class="info-label">舱位类型</span>
                <span class="info-value">${sessionScope.selectedCabinTypeName}</span>
            </div>
        </div>
    </div>

    <!-- 乘客信息 -->
    <div class="card">
        <h2 class="card-title">乘客信息（${sessionScope.passengerCount}人）</h2>
        <div class="passenger-list">
            <c:forEach var="passenger" items="${passengers}">
                <div class="passenger-item">
                    <div class="passenger-avatar">
                        <c:out value="${passenger.name.charAt(0)}" />
                    </div>
                    <div class="passenger-details">
                        <div class="passenger-name">${passenger.name}</div>
                        <div class="passenger-id">证件号：${passenger.idCard}</div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- 价格信息 -->
    <div class="card">
        <h2 class="card-title">价格明细</h2>
        <div class="price-detail">
            <div class="price-item">
                <span class="price-label">
                    ${sessionScope.selectedCabinTypeName}票价（${sessionScope.passengerCount}人）
                </span>
                <span class="price-value">
                    <fmt:formatNumber value="${sessionScope.pricePerPerson}" pattern="0.00" /> × ${sessionScope.passengerCount}
                </span>
            </div>
            <div class="price-item">
                <span class="price-label">税费</span>
                <span class="price-value">0.00</span>
            </div>
            <div class="price-item">
                <span class="price-label">总价</span>
                <span class="price-value">¥<fmt:formatNumber value="${sessionScope.totalPrice}" pattern="0.00" /></span>
            </div>
        </div>
    </div>

    <!-- 支付方式 -->
    <div class="card">
        <h2 class="card-title">选择支付方式</h2>
        <div class="payment-methods">
            <div class="method-option selected">
                <input type="radio" name="paymentMethod" id="alipay" value="alipay" checked>
                <label for="alipay">
                    <div class="method-icon">
                        <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iIzFFNzNFOEUiIGQ9Ik0xMiAxQzYuNDggMSAxIDYuNDggMSAxMnMxLjUzIDUuNjggNC41MyA5LjM4QzcuMzggMTguMTQgMTAuOTQgMjEgMTIgMjFjMS4wNiAwIDIuMDctLjA5IDMuMDItLjI3QzE1LjQ3IDIxIDE5IDE3LjQ3IDE5IDEyUzE0LjUyIDIgMTIgMnoiLz48cGF0aCBkPSJNMTYgMTVjMCAuNTUtLjQ1IDEtMSAxSDljLS41NSAwLTEtLjQ1LTEtMVY5YzAtLjU1LjQ1LTEgMS0xaDVjLjU1IDAgMS4wMS40NSAxLjAxIDF2NiIvPjwvc3ZnPg==" alt="支付宝">
                    </div>
                    <div class="method-info">
                        <div class="method-name">支付宝</div>
                        <div class="method-desc">推荐使用，支付更快捷</div>
                    </div>
                </label>
            </div>
            <div class="method-option">
                <input type="radio" name="paymentMethod" id="wechat" value="wechat">
                <label for="wechat">
                    <div class="method-icon">
                        <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iIzA5QjgzQyIgZD0iTTExLjk5IDcuOTljLS44OSAwLTEuNjMuNzQtMS42MyAxLjYzcy43NCAxLjYzIDEuNjMgMS42M3ptMi43MyAxLjgyYy0uMjQgMC0uNDcuMDktLjY0LjI2LS4xNy4xNy0uMjYuNDEtLjI2LjY1IDAgLjI0LjA5LjQ4LjI2LjY1LjE3LjE3LjQxLjI2LjY1LjY2cy40OC0uMDkgLjY1LS4yNnoiLz48cGF0aCBkPSJNMjEgMTJjMCA1LjUzLTQuNDcgMTAtMTAgMTAtMi44OSAwLTUuMzUtMS41My03LjIxLTMuOTVDMy41MyAxNy4zNSAxIDE0Ljg5IDEgMTJzNC40Ny0xMCAxMC0xMCA1LjM1IDAgNy4yMSAxLjUzIDcuMjEgMy45NUMxNi41MyAyMS41MyAxOSAxOS4wOSAxOSAxMnptLTkgOWMtNC40MSAwLTgtMy41OS04LThzMy41OS04IDgtOCA4IDMuNTkgOCA4LTguMDAxIDgtOCA4eiIvPjwvc3ZnPg==" alt="微信支付">
                    </div>
                    <div class="method-info">
                        <div class="method-name">微信支付</div>
                        <div class="method-desc">支持微信扫码支付</div>
                    </div>
                </label>
            </div>
            <div class="method-option">
                <input type="radio" name="paymentMethod" id="card" value="card">
                <label for="card">
                    <div class="method-icon">
                        <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iIzRBODNEMyIgZD0iTTIyIDEwVjE4YzAgMS4xLS45IDItMiAySDRjLTEuMSAwLTItLjktMi0yVjEwYzAtMS4xLjktMiAyLTJoMTZDMjEuMSA4IDIyIDguOSAyMiAxMHptLTQgMi41aC00di01aDR2NXptOC01aC00djVoNHYtNXptLTkgNnYyaDR2LTRoLTR6Ii8+PC9zdmc+" alt="银行卡支付">
                    </div>
                    <div class="method-info">
                        <div class="method-name">银行卡支付</div>
                        <div class="method-desc">支持各大银行储蓄卡和信用卡</div>
                    </div>
                </label>
            </div>
        </div>

        <!-- 核心修改：替换原有单按钮为双按钮，分别提交到不同接口 -->
        <div class="pay-buttons">
            <!-- 支付成功按钮 -->
            <form action="${pageContext.request.contextPath}/payment/process?status=success" method="post" style="margin:0;">
                <button type="submit" class="pay-btn success-btn">
                    确认支付（成功）
                </button>
            </form>
            <!-- 支付失败按钮 -->
            <form action="${pageContext.request.contextPath}/payment/process?status=fail" method="post" style="margin:0;">
                <button type="submit" class="pay-btn fail-btn">
                    确认支付（失败）
                </button>
            </form>
        </div>
    </div>
</div>

<script>
    // 支付方式选择逻辑
    document.querySelectorAll('.method-option').forEach(option => {
        option.addEventListener('click', function() {
            document.querySelectorAll('.method-option').forEach(item => {
                item.classList.remove('selected');
            });
            this.classList.add('selected');
            this.querySelector('input').checked = true;
        });
    });
</script>
</body>
</html>