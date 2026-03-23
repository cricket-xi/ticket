<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>无忧订票 - 注册</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            display: flex;
            width: 900px;
            max-width: 90%;
            overflow: hidden;
        }

        .left-panel {
            background: linear-gradient(135deg, #1a5fff, #0040c9);
            color: white;
            padding: 40px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .logo {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }

        .logo i {
            margin-right: 10px;
            font-size: 36px;
        }

        .slogan {
            font-size: 18px;
            margin-bottom: 40px;
            opacity: 0.9;
        }

        .benefits {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .benefit {
            display: flex;
            align-items: flex-start;
        }

        .benefit i {
            margin-right: 15px;
            font-size: 24px;
            margin-top: 3px;
        }

        .benefit h3 {
            margin-bottom: 5px;
            font-size: 18px;
        }

        .benefit p {
            opacity: 0.8;
            font-size: 14px;
        }

        .right-panel {
            padding: 40px;
            flex: 1;
        }

        .register-header {
            margin-bottom: 30px;
        }

        .register-header h3 {
            font-size: 24px;
            margin-bottom: 10px;
            color: #333;
        }

        .register-header p {
            color: #666;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
        }

        .input-with-icon {
            position: relative;
        }

        .input-with-icon i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
        }

        .input-with-icon input {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .input-with-icon input:focus {
            outline: none;
            border-color: #1a5fff;
        }

        .form-row {
            display: flex;
            gap: 15px;
        }

        .form-row .form-group {
            flex: 1;
        }

        .terms {
            margin: 20px 0 30px;
            color: #666;
            font-size: 14px;
        }

        .terms a {
            color: #1a5fff;
            text-decoration: none;
        }

        .terms a:hover {
            text-decoration: underline;
        }

        .register-btn {
            width: 100%;
            padding: 14px;
            background-color: #1a5fff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .register-btn:hover {
            background-color: #0040c9;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
            color: #666;
        }

        .login-link a {
            color: #1a5fff;
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .error-message {
            background-color: #fff0f0;
            color: #e53e3e;
            padding: 10px 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .left-panel {
                text-align: center;
            }

            .benefit {
                justify-content: center;
                text-align: left;
            }

            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="left-panel">
        <div class="logo">
            <i class="fas fa-plane"></i>
            无忧订票
        </div>
        <p class="slogan">注册账户，开启您的便捷出行之旅</p>

        <div class="benefits">
            <div class="benefit">
                <i class="fas fa-ticket-alt"></i>
                <div>
                    <h3>快速预订</h3>
                    <p>一键查询和预订国内外航班</p>
                </div>
            </div>
            <div class="benefit">
                <i class="fas fa-tag"></i>
                <div>
                    <h3>专属优惠</h3>
                    <p>注册用户专享折扣和促销活动</p>
                </div>
            </div>
            <div class="benefit">
                <i class="fas fa-history"></i>
                <div>
                    <h3>订单管理</h3>
                    <p>便捷查看和管理您的所有订单</p>
                </div>
            </div>
        </div>
    </div>

    <div class="right-panel">
        <div class="register-header">
            <h3>创建新账户</h3>
            <p>填写以下信息完成注册</p>
        </div>

        <% if (request.getAttribute("error") != null) { %>
        <div class="error-message"><%= request.getAttribute("error") %></div>
        <% } %>

        <form id="register-form" action="${pageContext.request.contextPath}/register" method="post">
            <div class="form-group">
                <label for="username">用户名</label>
                <div class="input-with-icon">
                    <i class="fas fa-user"></i>
                    <input type="text" id="username" name="username"
                           value="${user != null ? user.username : ''}"
                           placeholder="请设置用户名" required>
                </div>
            </div>

            <div class="form-group">
                <label for="password">密码</label>
                <div class="input-with-icon">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="password" name="password"
                           placeholder="请设置密码（至少6位）" required>
                </div>
            </div>

            <div class="form-group">
                <label for="fullName">姓名</label>
                <div class="input-with-icon">
                    <i class="fas fa-id-card"></i>
                    <input type="text" id="fullName" name="fullName"
                           value="${user != null ? user.fullName : ''}"
                           placeholder="请输入真实姓名" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="email">邮箱</label>
                    <div class="input-with-icon">
                        <i class="fas fa-envelope"></i>
                        <input type="email" id="email" name="email"
                               value="${user != null ? user.email : ''}"
                               placeholder="请输入邮箱地址" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="phone">手机号码</label>
                    <div class="input-with-icon">
                        <i class="fas fa-phone"></i>
                        <input type="tel" id="phone" name="phone"
                               value="${user != null ? user.phone : ''}"
                               placeholder="请输入手机号码" required>
                    </div>
                </div>
            </div>

            <div class="terms">
                <input type="checkbox" id="agreeTerms" required>
                <label for="agreeTerms">我已阅读并同意<a href="#">《用户服务协议》</a>和<a href="#">《隐私政策》</a></label>
            </div>

            <button type="submit" class="register-btn">注册</button>

            <div class="login-link">
                已有账户? <a href="${pageContext.request.contextPath}/login">立即登录</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
