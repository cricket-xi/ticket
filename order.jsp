<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的订单 - 机票预订系统</title>
    <!-- 引入Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- 引入Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <style type="text/tailwindcss">
        @layer utilities {
            .content-auto {
                content-visibility: auto;
            }
            .order-card {
                @apply bg-white rounded-lg shadow-md overflow-hidden transition-all duration-300 hover:shadow-lg;
            }
            .status-badge {
                @apply px-2 py-1 rounded-full text-xs font-medium;
            }
        }
    </style>
</head>
<body class="bg-gray-50 min-h-screen">
<div class="container mx-auto px-4 py-8 max-w-6xl">
    <!-- 页面标题和操作区 -->
    <div class="mb-8 flex flex-col sm:flex-row justify-between items-start sm:items-center">
        <div>
            <h1 class="text-2xl md:text-3xl font-bold text-gray-800">我的订单</h1>
            <p class="text-gray-500 mt-1">查看和管理您的所有机票订单</p>
        </div>

        <!-- 操作按钮组 -->
        <div class="mt-4 sm:mt-0 flex gap-3">
            <!-- 新增：返回首页（航班订购）按钮 -->
            <a href="${pageContext.request.contextPath}/flights"
               class="inline-flex items-center px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors">
                <i class="fa fa-home mr-2"></i>
                返回首页
            </a>

            <!-- 原有的可能存在的其他按钮 -->
            <a href="${pageContext.request.contextPath}/flights/search"
               class="inline-flex items-center px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors">
                <i class="fa fa-plus mr-2"></i>
                新订单
            </a>
        </div>
    </div>

    <!-- 订单列表 -->
    <div class="space-y-6">
        <c:choose>
            <c:when test="${not empty orders}">
                <c:forEach items="${orders}" var="order">
                    <div class="order-card">
                        <div class="p-6">
                            <!-- 订单基本信息 -->
                            <div class="flex flex-col md:flex-row justify-between mb-4">
                                <div>
                                    <div class="flex items-center">
                                        <span class="font-semibold text-gray-800">订单编号：</span>
                                        <span class="ml-2">${order.orderNumber}</span>
                                    </div>
                                    <div class="flex items-center mt-1">
                                        <span class="font-semibold text-gray-800">下单时间：</span>
                                        <span class="ml-2"><fmt:formatDate value="${order.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
                                    </div>
                                </div>

                                <div class="mt-3 md:mt-0 flex flex-col items-start md:items-end">
                                    <div class="flex items-center">
                                        <span class="font-semibold text-gray-800">总金额：</span>
                                        <span class="ml-2 text-red-600 font-bold">¥<fmt:formatNumber value="${order.totalPrice}" pattern="0.00" /></span>
                                    </div>

                                    <!-- 订单状态标签 -->
                                    <div class="mt-1">
                                        <c:choose>
                                            <c:when test="${order.status == 'paid'}">
                                                <span class="status-badge bg-green-100 text-green-800">已支付</span>
                                            </c:when>
                                            <c:when test="${order.status == 'pending'}">
                                                <span class="status-badge bg-yellow-100 text-yellow-800">待支付</span>
                                            </c:when>
                                            <c:when test="${order.status == 'cancelled'}">
                                                <span class="status-badge bg-gray-100 text-gray-800">已取消</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-badge bg-blue-100 text-blue-800">${order.status}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>

                            <!-- 航班信息 -->
                            <div class="bg-gray-50 p-4 rounded-lg mb-4">
                                <div class="flex flex-col md:flex-row items-center justify-between">
                                    <div class="text-center md:text-left mb-4 md:mb-0">
                                        <p class="text-2xl font-bold text-gray-800">${order.departureCity}</p>
                                        <p class="text-gray-500 text-sm">${order.departureAirport}</p>
                                        <p class="mt-1 font-medium"><fmt:formatDate value="${order.departureTime}" pattern="yyyy-MM-dd HH:mm" /></p>
                                    </div>

                                    <div class="flex-1 max-w-[200px] mx-4">
                                        <div class="border-t-2 border-dashed border-gray-300 relative">
                                            <div class="absolute top-0 left-0 transform -translate-y-1/2 w-3 h-3 bg-blue-500 rounded-full"></div>
                                            <div class="absolute top-0 right-0 transform -translate-y-1/2 w-3 h-3 bg-blue-500 rounded-full"></div>
                                            <div class="text-center text-sm text-gray-500 mt-1">
                                                <i class="fa fa-plane mr-1"></i>
                                                    ${order.flightNumber}
                                            </div>
                                        </div>
                                    </div>

                                    <div class="text-center md:text-right">
                                        <p class="text-2xl font-bold text-gray-800">${order.arrivalCity}</p>
                                        <p class="text-gray-500 text-sm">${order.arrivalAirport}</p>
                                        <p class="mt-1 font-medium"><fmt:formatDate value="${order.arrivalTime}" pattern="yyyy-MM-dd HH:mm" /></p>
                                    </div>
                                </div>
                            </div>

                            <!-- 操作按钮 -->
                            <div class="flex flex-wrap gap-3 justify-end pt-3 border-t border-gray-100">
                                <a href="${pageContext.request.contextPath}/orders/detail?id=${order.id}"
                                   class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors">
                                    <i class="fa fa-eye mr-1"></i> 查看详情
                                </a>

                                <c:choose>
                                    <c:when test="${order.status == 'pending'}">
                                        <a href="${pageContext.request.contextPath}/payment?orderId=${order.id}"
                                           class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors">
                                            <i class="fa fa-credit-card mr-1"></i> 去支付
                                        </a>

                                        <a href="${pageContext.request.contextPath}/orders/cancel?id=${order.id}"
                                           class="px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors">
                                            <i class="fa fa-times mr-1"></i> 取消订单
                                        </a>
                                    </c:when>
                                    <c:when test="${order.status == 'paid'}">
                                        <a href="${pageContext.request.contextPath}/orders/refund?id=${order.id}"
                                           class="px-4 py-2 bg-orange-600 text-white rounded-lg hover:bg-orange-700 transition-colors">
                                            <i class="fa fa-undo mr-1"></i> 申请退款
                                        </a>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <!-- 无订单时的提示 -->
                <div class="bg-white rounded-lg shadow p-8 text-center">
                    <div class="w-16 h-16 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-4">
                        <i class="fa fa-file-text-o text-2xl text-gray-400"></i>
                    </div>
                    <h3 class="text-xl font-medium text-gray-800 mb-2">暂无订单记录</h3>
                    <p class="text-gray-500 mb-6">您还没有任何订单，快去预订机票吧</p>
                    <a href="${pageContext.request.contextPath}/purchase"
                       class="inline-flex items-center px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors">
                        <i class="fa fa-plus mr-2"></i>
                        立即预订
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>
