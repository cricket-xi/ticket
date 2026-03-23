<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>支付失败 - 机票预订系统</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style type="text/tailwindcss">
        @layer utilities {
            .content-auto { content-visibility: auto; }
            .card-shadow { box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05); }
            .btn-hover { @apply transition-all duration-300 hover:shadow-lg transform hover:-translate-y-0.5; }
        }
    </style>
</head>
<body class="bg-gray-50 min-h-screen">
<div class="container mx-auto px-4 py-8 max-w-5xl">
    <!-- 返回导航 -->
    <div class="mb-6">
        <a href="${pageContext.request.contextPath}/orders" class="text-blue-600 hover:text-blue-800 flex items-center">
            <i class="fa fa-arrow-left mr-2"></i>
            <span>返回我的订单</span>
        </a>
    </div>

    <!-- 失败提示卡片 -->
    <div class="bg-white rounded-xl p-6 md:p-8 mb-8 card-shadow">
        <!-- 失败图标 -->
        <div class="flex justify-center mb-6">
            <div class="w-20 h-20 bg-red-100 rounded-full flex items-center justify-center">
                <i class="fa fa-times text-4xl text-red-500"></i>
            </div>
        </div>

        <!-- 失败信息 -->
        <div class="text-center mb-8">
            <h1 class="text-[clamp(1.5rem,3vw,2.5rem)] font-bold text-gray-800 mb-2">支付失败</h1>
            <p class="text-gray-600 text-lg">${errorMsg != null ? errorMsg : "支付过程中出现问题，请重试或选择其他支付方式"}</p>
        </div>

        <!-- 订单信息卡片 -->
        <div class="border-t border-gray-200 pt-6 mt-6">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">订单详情</h2>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
                <div>
                    <p class="text-gray-500 text-sm">订单编号</p>
                    <p class="font-medium">${order.orderNumber}</p>
                </div>
                <div>
                    <p class="text-gray-500 text-sm">下单时间</p>
                    <p class="font-medium"><fmt:formatDate value="${order.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
                </div>
                <div>
                    <p class="text-gray-500 text-sm">航班号</p>
                    <p class="font-medium">${order.flightNumber}</p>
                </div>
                <div>
                    <p class="text-gray-500 text-sm">舱位类型</p>
                    <p class="font-medium">
                        <c:choose>
                            <c:when test="${order.cabinType == 'economy'}">经济舱</c:when>
                            <c:when test="${order.cabinType == 'business'}">商务舱</c:when>
                            <c:when test="${order.cabinType == 'first_class'}">头等舱</c:when>
                            <c:otherwise>${order.cabinType}</c:otherwise>
                        </c:choose>
                    </p>
                </div>
            </div>

            <!-- 价格信息 -->
            <div class="border-t border-gray-200 pt-4">
                <div class="flex justify-between items-center font-bold text-lg text-gray-800">
                    <span>订单总价：</span>
                    <span class="text-red-600">¥<fmt:formatNumber value="${order.totalPrice}" pattern="0.00" /></span>
                </div>
                <div class="flex justify-between items-center text-sm text-gray-500 mt-1">
                    <span>订单状态：</span>
                    <span class="text-yellow-600">待支付</span>
                </div>
            </div>
        </div>
    </div>

    <!-- 操作按钮 -->
    <div class="flex flex-col sm:flex-row justify-center gap-4 mb-12">
        <a href="${pageContext.request.contextPath}/payment?orderId=${order.id}" class="btn-hover bg-blue-600 text-white px-6 py-3 rounded-lg font-medium text-center">
            <i class="fa fa-refresh mr-2"></i>重新支付
        </a>
        <a href="${pageContext.request.contextPath}/orders" class="btn-hover bg-gray-800 text-white px-6 py-3 rounded-lg font-medium text-center">
            <i class="fa fa-list-alt mr-2"></i>查看我的订单
        </a>
    </div>

    <!-- 底部提示 -->
    <div class="text-center text-gray-500 text-sm">
        <p>支付失败可能原因：余额不足、网络异常、支付方式限额</p>
        <p class="mt-1">如有疑问，请联系客服：400-123-4567</p>
    </div>
</div>
</body>
</html>