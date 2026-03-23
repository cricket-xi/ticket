<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>支付成功 - 机票预订系统</title>
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

    <!-- 成功提示卡片 -->
    <div class="bg-white rounded-xl p-6 md:p-8 mb-8 card-shadow">
        <!-- 成功图标 -->
        <div class="flex justify-center mb-6">
            <div class="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center">
                <i class="fa fa-check text-4xl text-green-500"></i>
            </div>
        </div>

        <!-- 成功信息 -->
        <div class="text-center mb-8">
            <h1 class="text-[clamp(1.5rem,3vw,2.5rem)] font-bold text-gray-800 mb-2">支付成功！</h1>
            <p class="text-gray-600 text-lg">您的订单已确认，我们已发送确认邮件至您的邮箱</p>
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
                    <!-- 核心修改：将 order.createTime 改为 order.createdAt -->
                    <p class="font-medium"><fmt:formatDate value="${order.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
                </div>
                <div>
                    <p class="text-gray-500 text-sm">航班号</p>
                    <p class="font-medium">${order.flightNumber}</p>
                </div>
                <div>
                    <p class="text-gray-500 text-sm">航空公司</p>
                    <p class="font-medium">${order.airline}</p>
                </div>
            </div>

            <!-- 航班信息 -->
            <div class="bg-gray-50 p-4 rounded-lg mb-6">
                <h3 class="text-lg font-medium text-gray-800 mb-3">航班信息</h3>
                <div class="flex flex-col md:flex-row items-center justify-between">
                    <div class="text-center md:text-left mb-4 md:mb-0">
                        <p class="text-3xl font-bold text-gray-800">${order.departureCity}</p>
                        <p class="text-gray-500">${order.departureAirport}</p>
                        <p class="text-sm text-gray-500 mt-1">
                            <fmt:formatDate value="${order.departureTime}" pattern="MM-dd HH:mm" />
                        </p>
                    </div>
                    <div class="flex-1 max-w-[200px] mx-4">
                        <div class="border-t-2 border-dashed border-gray-300 relative">
                            <div class="absolute top-0 left-0 transform -translate-y-1/2 w-3 h-3 bg-blue-500 rounded-full"></div>
                            <div class="absolute top-0 right-0 transform -translate-y-1/2 w-3 h-3 bg-blue-500 rounded-full"></div>
                            <div class="text-center text-sm text-gray-500 mt-1">
                                <i class="fa fa-clock-o mr-1"></i>
                                <span>飞行时间待计算</span>
                            </div>
                        </div>
                    </div>
                    <div class="text-center md:text-right">
                        <p class="text-3xl font-bold text-gray-800">${order.arrivalCity}</p>
                        <p class="text-gray-500">${order.arrivalAirport}</p>
                        <p class="text-sm text-gray-500 mt-1">
                            <fmt:formatDate value="${order.arrivalTime}" pattern="MM-dd HH:mm" />
                        </p>
                    </div>
                </div>
            </div>

            <!-- 舱位和乘客信息 -->
            <div class="mb-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
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
                    <div>
                        <p class="text-gray-500 text-sm">乘客数量</p>
                        <p class="font-medium">${order.passengerCount} 人</p>
                    </div>
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
                    <span class="text-green-600">
                            <c:choose>
                                <c:when test="${order.status == 'paid'}">已支付</c:when>
                                <c:otherwise>${order.status}</c:otherwise>
                            </c:choose>
                        </span>
                </div>
            </div>
        </div>
    </div>

    <!-- 操作按钮 -->
    <div class="flex flex-col sm:flex-row justify-center gap-4 mb-12">
        <a href="${pageContext.request.contextPath}/orders" class="btn-hover bg-blue-600 text-white px-6 py-3 rounded-lg font-medium text-center">
            <i class="fa fa-list-alt mr-2"></i>查看我的订单
        </a>
        <a href="${pageContext.request.contextPath}/purchase" class="btn-hover bg-gray-800 text-white px-6 py-3 rounded-lg font-medium text-center">
            <i class="fa fa-plane mr-2"></i>继续预订其他航班
        </a>
    </div>

    <!-- 底部提示 -->
    <div class="text-center text-gray-500 text-sm">
        <p>如有疑问，请联系客服：400-123-4567</p>
        <p class="mt-1">订单确认邮件已发送至您的注册邮箱，请留意查收</p>
    </div>
</div>
</body>
</html>