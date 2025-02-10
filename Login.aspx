
<%@ Page Title="Login" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="VehicleRental.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login-container">
        <div class="login-box">
            <img src="images/Login2.png" alt="User Icon" class="user-icon">
            <h2>Login</h2>

            <div class="input-group">
                <span class="icon">&#128100;</span>
                <asp:TextBox ID="txtUserID" runat="server" CssClass="input-field" placeholder="User ID here"></asp:TextBox>
            </div>

            <div class="input-group">
                <span class="icon">&#128273;</span>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" TextMode="Password" placeholder="Password here"></asp:TextBox>
            </div>

            <asp:Button ID="btnLogin" runat="server" CssClass="login-btn" Text="Login" OnClick="btnLogin_Click1"  />
        </div>
    </div>

    <style>
        body {
            background: linear-gradient(to bottom, #ffffff, #eeeeee);
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
        }

        .login-box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 400px;
        }

        .user-icon {
            width: 150px;
            margin-bottom: 15px;
            margin-top : 10px
        }

        .input-group {
            display: flex;
            align-items: center;
            background: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 15px;
            padding: 10px;
        }

        .icon {
            font-size: 18px;
            color: #666;
            margin-right: 10px;
        }

        .input-field {
            width: 100%;
            border: none;
            background: none;
            font-size: 16px;
            outline: none;
        }

        .login-btn {
            width: 100%;
            background: red;
            color: white;
            padding: 12px;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            font-weight: bold;
        }

        .login-btn:hover {
            background: darkred;
        }
    </style>
</asp:Content>


