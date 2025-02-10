<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="VehicleRental.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="form-box">
            <img src="images/user.png" alt="User Icon" class="user-icon">
            
            <div class="row">
                <asp:TextBox ID="txtUserName" runat="server" CssClass="input-field" placeholder="User Name"></asp:TextBox>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" placeholder="Email ID or User ID"></asp:TextBox>
            </div>

            <div class="row">
                <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" TextMode="Password" placeholder="Password"></asp:TextBox>
                <asp:TextBox ID="txtRepeatPassword" runat="server" CssClass="input-field" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
            </div>

            <div class="row">
                <asp:TextBox ID="txtPhone" runat="server" CssClass="input-field" placeholder="Phone Number"></asp:TextBox>
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="input-field">
                    <asp:ListItem Text="-- Select Gender --" Value=""></asp:ListItem>
                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="row">
                <asp:TextBox ID="txtAddress" runat="server" CssClass="input-field" placeholder="Address"></asp:TextBox>
                <asp:TextBox ID="txtAadhar" runat="server" CssClass="input-field" placeholder="Aadhar Number"></asp:TextBox>
            </div>

            <asp:Button ID="btnRegister" runat="server" CssClass="register-btn" Text="Register" OnClick="btnRegister_Click" />
        </div>
    </div>

    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 70vh;
        }
        .form-box {
            width: 600px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0,0,0,0.2);
            background: white;
            text-align: center;
        }
        .user-icon {
            width: 120px;
            margin-bottom: 20px;
        }
        .row {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            margin-bottom: 15px;
        }
        .input-field {
            width: 48%;
            padding: 15px;
            font-size: 18px;
            border: 2px solid #ddd;
            border-radius: 5px;
        }
        .register-btn {
            width: 100%;
            background: green;
            color: white;
            padding: 15px;
            font-size: 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            font-weight: bold;
        }
        .register-btn:hover {
            background: darkgreen;
        }
    </style>
</asp:Content>
