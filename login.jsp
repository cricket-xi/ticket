<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>无忧订票 - 登录</title>
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

        .features {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .feature {
            display: flex;
            align-items: flex-start;
        }

        .feature i {
            margin-right: 15px;
            font-size: 24px;
            margin-top: 3px;
        }

        .feature h3 {
            margin-bottom: 5px;
            font-size: 18px;
        }

        .feature p {
            opacity: 0.8;
            font-size: 14px;
        }

        .right-panel {
            padding: 40px;
            flex: 1;
        }

        .login-header {
            margin-bottom: 30px;
        }

        .login-header h3 {
            font-size: 24px;
            margin-bottom: 10px;
            color: #333;
        }

        .login-header p {
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

        .options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .remember-me {
            display: flex;
            align-items: center;
        }

        .remember-me input {
            margin-right: 8px;
        }

        .remember-me label {
            color: #666;
            font-size: 14px;
        }

        .forgot-password {
            color: #1a5fff;
            text-decoration: none;
            font-size: 14px;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }

        .login-btn {
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

        .login-btn:hover {
            background-color: #0040c9;
        }

        .separator {
            text-align: center;
            margin: 25px 0;
            color: #999;
            position: relative;
        }

        .separator::before,
        .separator::after {
            content: "";
            position: absolute;
            top: 50%;
            width: 40%;
            height: 1px;
            background-color: #ddd;
        }

        .separator::before {
            left: 0;
        }

        .separator::after {
            right: 0;
        }

        .social-login {
            display: flex;
            gap: 15px;
            margin-bottom: 30px;
        }

        .social-btn {
            flex: 1;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .social-btn:hover {
            background-color: #f5f5f5;
        }

        .social-btn i {
            font-size: 18px;
        }

        .social-btn span {
            font-size: 14px;
        }

        .signup-link {
            text-align: center;
            color: #666;
        }

        .signup-link a {
            color: #1a5fff;
            text-decoration: none;
            font-weight: 500;
        }

        .signup-link a:hover {
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

        .success-message {
            background-color: #f0fff4;
            color: #22c55e;
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

            .feature {
                justify-content: center;
                text-align: left;
            }

            .separator::before,
            .separator::after {
                width: 30%;
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
        <p class="slogan">探索世界，从一次完美的飞行开始</p>

        <div class="features">
            <div class="feature">
                <i class="fas fa-shield-alt"></i>
                <div>
                    <h3>安全可靠</h3>
                    <p>严格保护您的个人信息和支付安全</p>
                </div>
            </div>
            <div class="feature">
                <i class="fas fa-clock"></i>
                <div>
                    <h3>便捷高效</h3>
                    <p>随时随地查询和预订航班</p>
                </div>
            </div>
            <div class="feature">
                <i class="fas fa-headphones-alt"></i>
                <div>
                    <h3>专业服务</h3>
                    <p>7×24小时客服为您提供帮助</p>
                </div>
            </div>
        </div>
    </div>

    <div class="right-panel">
        <div class="login-header">
            <h3>欢迎回来</h3>
            <p>请登录您的账户继续使用我们的服务</p>
        </div>

        <% if (request.getParameter("registerSuccess") != null) { %>
        <div class="success-message">注册成功，请登录</div>
        <% } %>

        <% if (request.getAttribute("error") != null) { %>
        <div class="error-message"><%= request.getAttribute("error") %></div>
        <% } %>

        <form id="login-form" action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label for="username">用户名或邮箱</label>
                <div class="input-with-icon">
                    <i class="fas fa-user"></i>
                    <input type="text" id="username" name="username" placeholder="请输入用户名或邮箱" required>
                </div>
            </div>

            <div class="form-group">
                <label for="password">密码</label>
                <div class="input-with-icon">
                    <i class="fas fa-key"></i>
                    <input type="password" id="password" name="password" placeholder="请输入密码" required>
                </div>
            </div>

            <div class="options">
                <div class="remember-me">
                    <input type="checkbox" id="remember" name="remember">
                    <label for="remember">记住密码</label>
                </div>
                <a href="#" class="forgot-password">忘记密码?</a>
            </div>

            <button type="submit" class="login-btn">登录</button>
        </form>

        <div class="separator">或使用社交账号登录</div>

        <div class="social-login">
            <button class="social-btn">
                <i class="fab fa-weixin" style="color: #07C160;"></i>
                <span>微信</span>
            </button>
            <button class="social-btn">
                <i class="fab fa-qq" style="color: #12B7F5;"></i>
                <span>QQ</span>
            </button>
        </div>

        <div class="signup-link">
            还没有账户? <a href="${pageContext.request.contextPath}/register">立即注册</a>
        </div>
    </div>
</div>
</body>
</html>
