<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>无忧订票 - 机票预订</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f9f9f9;
            color: #333;
        }

        header {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 15px 0;
        }

        .container {
            width: 1200px;
            max-width: 95%;
            margin: 0 auto;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #1a5fff;
            display: flex;
            align-items: center;
        }

        .logo i {
            margin-right: 10px;
        }

        .nav-links {
            display: flex;
            list-style: none;
            gap: 30px;
        }

        .nav-links a {
            text-decoration: none;
            color: #555;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: #1a5fff;
        }

        .search-section {
            background: linear-gradient(135deg, #1a5fff, #0040c9);
            padding: 40px 0;
            margin-bottom: 30px;
        }

        .search-container {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .search-tabs {
            display: flex;
            margin-bottom: 25px;
            border-bottom: 1px solid #eee;
        }

        .tab {
            padding: 10px 20px;
            font-weight: 500;
            cursor: pointer;
            border-bottom: 3px solid transparent;
            transition: all 0.3s;
        }

        .tab.active {
            color: #1a5fff;
            border-bottom-color: #1a5fff;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .form-group {
            flex: 1;
            min-width: 150px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #666;
            font-size: 14px;
            font-weight: 500;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #1a5fff;
        }

        .search-btn {
            background-color: #1a5fff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 12px 30px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .search-btn:hover {
            background-color: #0040c9;
        }

        .results-section {
            padding: 20px 0 50px;
        }

        .section-title {
            font-size: 22px;
            margin-bottom: 20px;
            color: #333;
        }

        /* 核心修改：筛选栏固定在搜索结果顶部，与搜索按钮逻辑关联 */
        .search-result-header {
            background-color: white;
            border-radius: 10px;
            padding: 15px 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        /* 搜索结果信息栏 */
        .trip-info {
            padding: 10px 0;
            border-bottom: 1px solid #eee;
            margin-bottom: 15px;
        }

        .trip-info span {
            color: #1a5fff;
            font-weight: 500;
        }

        /* 筛选条件容器：与搜索结果强关联，始终在结果上方 */
        .filters {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 20px;
        }

        .filter-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .filter-label {
            color: #666;
            font-weight: 500;
        }

        .filter-options {
            display: flex;
            gap: 15px;
            flex-wrap: wrap; /* 适配小屏幕 */
        }

        .filter-option {
            color: #333;
            cursor: pointer;
            padding: 5px 10px;
            border-radius: 20px;
            transition: all 0.3s;
        }

        .filter-option:hover,
        .filter-option.active {
            background-color: #e8f3ff;
            color: #1a5fff;
        }

        .flight-card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 15px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .flight-info {
            flex: 1;
        }

        .flight-time {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .departure, .arrival {
            text-align: center;
            min-width: 120px;
        }

        .time {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .city {
            color: #666;
            font-size: 14px;
        }

        .flight-duration {
            flex: 1;
            text-align: center;
            position: relative;
        }

        .flight-duration::after {
            content: "";
            position: absolute;
            top: 50%;
            left: 0;
            width: 100%;
            height: 1px;
            background-color: #eee;
            z-index: 1;
        }

        .flight-duration div {
            position: relative;
            z-index: 2;
            background-color: white;
            display: inline-block;
            padding: 0 10px;
        }

        .flight-duration div:first-child {
            color: #666;
            margin-bottom: 5px;
        }

        .flight-duration div:last-child {
            color: #1a5fff;
            font-size: 18px;
        }

        .flight-airline {
            color: #666;
            font-size: 14px;
        }

        .flight-price {
            text-align: right;
            min-width: 150px;
        }

        .price {
            font-size: 22px;
            font-weight: bold;
            color: #e53e3e;
            margin-bottom: 10px;
        }

        .select-btn {
            background-color: #1a5fff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 20px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s;
        }

        .select-btn:hover {
            background-color: #0040c9;
        }

        .no-results {
            text-align: center;
            padding: 50px 0;
            color: #666;
        }

        .no-results i {
            font-size: 50px;
            margin-bottom: 20px;
            color: #ddd;
        }

        /* 隐藏筛选表单，用于提交筛选参数 */
        .filter-form {
            display: none;
        }

        /* 无结果时隐藏筛选栏 */
        .no-results + .search-result-header {
            display: none;
        }

        @media (max-width: 768px) {
            .flight-card {
                flex-direction: column;
                align-items: flex-start;
            }

            .flight-price {
                text-align: left;
                margin-top: 15px;
                width: 100%;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .nav-links {
                gap: 15px;
            }

            .search-tabs {
                overflow-x: auto;
                padding-bottom: 5px;
            }

            .filter-group {
                width: 100%;
                margin-bottom: 10px;
            }

            .filter-options {
                gap: 10px;
            }

            /* 小屏幕下筛选栏换行显示 */
            .filters {
                gap: 15px;
            }
        }
    </style>
</head>
<body>
<!-- 顶部导航 -->
<header>
    <div class="container">
        <nav class="navbar">
            <div class="logo">
                <i class="fas fa-plane"></i>
                无忧订票
            </div>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/orders">我的订单</a></li>
            </ul>
        </nav>
    </div>
</header>

<!-- 搜索区域（仅保留基础搜索表单，筛选条件移至结果区） -->
<section class="search-section">
    <div class="container">
        <div class="search-container">
            <div class="search-tabs">
                <div class="tab active">单程</div>
            </div>

            <!-- 主搜索表单：仅处理基础搜索（城市、日期、乘客、舱位） -->
            <form class="search-form" action="${pageContext.request.contextPath}/searchFlights" method="post">
                <div class="form-row">
                    <div class="form-group">
                        <label>出发城市</label>
                        <input type="text" name="departureCity" placeholder="请输入出发城市"
                               value="${departureCity != null ? departureCity : '北京'}" required>
                    </div>
                    <div class="form-group">
                        <label>到达城市</label>
                        <input type="text" name="arrivalCity" placeholder="请输入到达城市"
                               value="${arrivalCity != null ? arrivalCity : '上海'}" required>
                    </div>
                    <div class="form-group">
                        <label>出发日期</label>
                        <input type="date" name="date"
                               value="${date != null ? date : ''}" required>
                    </div>
                    <div class="form-group">
                        <label>乘客</label>
                        <select name="passengers">
                            <option value="1">1成人</option>
                            <option value="2">2成人</option>
                            <option value="3">3成人</option>
                            <option value="4">4成人</option>
                            <option value="5">5成人</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>舱位</label>
                        <select name="cabin">
                            <option value="economy">经济舱</option>
                            <option value="business">商务舱</option>
                            <option value="first_class">头等舱</option>
                        </select>
                    </div>
                    <div class="form-group" style="align-self: flex-end;">
                        <button type="submit" class="search-btn">搜索航班</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<!-- 航班结果区域（核心修改：筛选条件固定在此区域顶部） -->
<section class="results-section">
    <div class="container">
        <!-- 1. 有搜索结果时显示：筛选条件 + 航班列表 -->
        <c:if test="${not empty flights}">
            <!-- 筛选与排序表单：隐藏表单，用于提交筛选参数 -->
            <form id="filterForm" class="filter-form" action="${pageContext.request.contextPath}/searchFlights" method="post">
                <!-- 隐藏域：传递基础搜索参数（与主搜索表单保持一致） -->
                <input type="hidden" name="departureCity" value="${departureCity}">
                <input type="hidden" name="arrivalCity" value="${arrivalCity}">
                <input type="hidden" name="date" value="${date}">
                <input type="hidden" name="passengers" value="${passengers != null ? passengers : '1'}">
                <input type="hidden" name="cabin" value="${cabin != null ? cabin : 'economy'}">
                <!-- 筛选参数：航空公司 -->
                <input type="hidden" name="selectedAirline" id="selectedAirline" value="${selectedAirline != null ? selectedAirline : 'all'}">
                <!-- 筛选参数：出发时间范围 -->
                <input type="hidden" name="selectedTimeRange" id="selectedTimeRange" value="${selectedTimeRange != null ? selectedTimeRange : 'all'}">
                <!-- 排序参数 -->
                <input type="hidden" name="sortBy" id="sortBy" value="${sortBy != null ? sortBy : 'recommend'}">
            </form>

            <!-- 核心修改：搜索结果头部（包含筛选条件，固定在结果上方） -->
            <div class="search-result-header">
                <!-- 搜索结果信息 -->
                <div class="trip-info">
                    搜索结果：从 <span>${departureCity}</span> 到 <span>${arrivalCity}</span>，出发日期 <span>${date}</span>，共 <span>${flights.size()}</span> 个航班
                </div>

                <!-- 筛选条件组（航空公司、时间、排序） -->
                <div class="filters">
                    <!-- 航空公司筛选 -->
                    <div class="filter-group">
                        <span class="filter-label">航空公司：</span>
                        <div class="filter-options">
                            <div class="filter-option ${selectedAirline == 'all' || empty selectedAirline ? 'active' : ''}" data-type="airline" data-value="all">全部</div>
                            <div class="filter-option ${selectedAirline == '中国国航' ? 'active' : ''}" data-type="airline" data-value="中国国航">中国国航</div>
                            <div class="filter-option ${selectedAirline == '东方航空' ? 'active' : ''}" data-type="airline" data-value="东方航空">东方航空</div>
                            <div class="filter-option ${selectedAirline == '南方航空' ? 'active' : ''}" data-type="airline" data-value="南方航空">南方航空</div>
                            <div class="filter-option ${selectedAirline == '海南航空' ? 'active' : ''}" data-type="airline" data-value="海南航空">海南航空</div>
                        </div>
                    </div>

                    <!-- 出发时间筛选 -->
                    <div class="filter-group">
                        <span class="filter-label">出发时间：</span>
                        <div class="filter-options">
                            <div class="filter-option ${selectedTimeRange == 'all' || empty selectedTimeRange ? 'active' : ''}" data-type="timeRange" data-value="all">全部</div>
                            <div class="filter-option ${selectedTimeRange == '00:00-06:00' ? 'active' : ''}" data-type="timeRange" data-value="00:00-06:00">00:00-06:00</div>
                            <div class="filter-option ${selectedTimeRange == '06:00-12:00' ? 'active' : ''}" data-type="timeRange" data-value="06:00-12:00">06:00-12:00</div>
                            <div class="filter-option ${selectedTimeRange == '12:00-18:00' ? 'active' : ''}" data-type="timeRange" data-value="12:00-18:00">12:00-18:00</div>
                            <div class="filter-option ${selectedTimeRange == '18:00-24:00' ? 'active' : ''}" data-type="timeRange" data-value="18:00-24:00">18:00-24:00</div>
                        </div>
                    </div>

                    <!-- 排序筛选 -->
                    <div class="filter-group">
                        <span class="filter-label">排序：</span>
                        <div class="filter-options">
                            <div class="filter-option ${sortBy == 'recommend' || empty sortBy ? 'active' : ''}" data-type="sort" data-value="recommend">推荐</div>
                            <div class="filter-option ${sortBy == 'price_asc' ? 'active' : ''}" data-type="sort" data-value="price_asc">价格低到高</div>
                            <div class="filter-option ${sortBy == 'price_desc' ? 'active' : ''}" data-type="sort" data-value="price_desc">价格高到低</div>
                            <div class="filter-option ${sortBy == 'time_asc' ? 'active' : ''}" data-type="sort" data-value="time_asc">耗时短</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 航班列表（筛选条件下方直接显示结果） -->
            <div class="flight-list">
                <c:forEach var="flight" items="${flights}">
                    <div class="flight-card">
                        <div class="flight-info">
                            <div class="flight-time">
                                <div class="departure">
                                    <div class="time"><fmt:formatDate value="${flight.departureTime}" pattern="HH:mm"/></div>
                                    <div class="city">${flight.departureCity} (${flight.departureAirport})</div>
                                </div>
                                <div class="flight-duration">
                                    <div>${flight.duration}</div>
                                    <div><i class="fas fa-plane"></i></div>
                                </div>
                                <div class="arrival">
                                    <div class="time"><fmt:formatDate value="${flight.arrivalTime}" pattern="HH:mm"/></div>
                                    <div class="city">${flight.arrivalCity} (${flight.arrivalAirport})</div>
                                </div>
                            </div>
                            <div class="flight-airline">${flight.airline} · ${flight.flightNumber} · ${flight.aircraft}</div>
                        </div>
                        <div class="flight-price">
                            <div class="price">
                                <c:choose>
                                    <c:when test="${cabin == 'business'}">¥${flight.businessPrice}</c:when>
                                    <c:when test="${cabin == 'first_class'}">¥${flight.firstClassPrice}</c:when>
                                    <c:otherwise>¥${flight.economyPrice}</c:otherwise>
                                </c:choose>
                            </div>
                            <a href="${pageContext.request.contextPath}/passengers/select?flightId=${flight.id}&cabin=${cabin}" class="select-btn">选择</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <!-- 2. 无搜索结果时显示提示 -->
        <c:if test="${empty flights and not empty departureCity}">
            <div class="no-results">
                <i class="fas fa-search"></i>
                <h3>没有找到符合条件的航班</h3>
                <p>请尝试调整出发城市、到达城市或日期</p>
                <!-- 无结果时提供快速重新搜索入口 -->
                <a href="${pageContext.request.contextPath}/searchFlights" class="select-btn" style="margin-top: 20px; display: inline-block;">重新搜索</a>
            </div>
        </c:if>
    </div>
</section>

<script>
    // 切换单程/往返/多程选项卡
    document.querySelectorAll('.tab').forEach(tab => {
        tab.addEventListener('click', () => {
            document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
            tab.classList.add('active');
        });
    });

    // 筛选与排序逻辑（保持功能不变，适配新布局）
    document.querySelectorAll('.filter-option').forEach(option => {
        option.addEventListener('click', () => {
            const type = option.getAttribute('data-type');
            const value = option.getAttribute('data-value');

            // 1. 更新选中状态（只更新当前组内选项）
            const siblings = Array.from(option.parentElement.children);
            siblings.forEach(sib => sib.classList.remove('active'));
            option.classList.add('active');

            // 2. 更新对应隐藏域参数
            if (type === 'airline') {
                document.getElementById('selectedAirline').value = value;
            } else if (type === 'timeRange') {
                document.getElementById('selectedTimeRange').value = value;
                // 存储时间范围到sessionStorage，页面刷新后保持状态
                sessionStorage.setItem('selectedTimeRange', value);
            } else if (type === 'sort') {
                document.getElementById('sortBy').value = value;
            }

            // 3. 提交筛选表单，刷新结果
            document.getElementById('filterForm').submit();
        });
    });

    // 页面加载时恢复出发时间范围选中状态（适配新布局）
    window.onload = function() {
        const savedTimeRange = sessionStorage.getItem('selectedTimeRange') || 'all';
        const timeRangeOption = document.querySelector(`.filter-option[data-type="timeRange"][data-value="${savedTimeRange}"]`);

        if (timeRangeOption) {
            // 恢复选中状态
            const siblings = Array.from(timeRangeOption.parentElement.children);
            siblings.forEach(sib => sib.classList.remove('active'));
            timeRangeOption.classList.add('active');
            // 同步隐藏域值
            document.getElementById('selectedTimeRange').value = savedTimeRange;
        }

        // 初始化时默认选中“全部”航空公司和排序
        if (!document.querySelector('.filter-option[data-type="airline"].active')) {
            document.querySelector('.filter-option[data-type="airline"][data-value="all"]').classList.add('active');
        }
        if (!document.querySelector('.filter-option[data-type="sort"].active')) {
            document.querySelector('.filter-option[data-type="sort"][data-value="recommend"]').classList.add('active');
        }
    };
</script>
</body>
</html>