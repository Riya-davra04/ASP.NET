<%@ Page Title="Cars" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="VehicleRental.Cars" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Cars - Vehicle Rental
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <h3>Categories</h3>
            <ul>
                <li class="active">All Categories</li>
                <li>Coupe</li>
                <li>Pick-Up Truck</li>
                <li>Convertible</li>
                <li>SUV (Sports Utility Vehicle)</li>
                <li>Micro Car</li>
                <li>Sedan</li>
                <li>Hatchback</li>
            </ul>
            <h3>Size</h3>
            <ul>
                <li>Mid Size (4-5 seats)</li>
                <li>Full Size (7 seats)</li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="car-list">
            <asp:Repeater ID="CarRepeater" runat="server">
                <ItemTemplate>
                    <div class="car-card">
                        <div class="car-header">
                            <span class="fuel-type"><%# Eval("FuelType") %></span>
                            <span class="seats"><%# Eval("Seats") %> seats</span>
                            <span class="model">Model</span>
                        </div>
                        <img src='<%# Eval("CarImage") %>' alt="Car Image" class="car-image" />
                        <div class="car-info">
                            <h3><%# Eval("CarCategory") %></h3>
                            <h4><%# Eval("CarName") %></h4>
                            <p class="price">₹ <%# Eval("Price") %>/day</p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <!-- Pagination -->
            <div class="pagination">
                <asp:Button ID="btnPrev" runat="server" Text="«" CssClass="page-btn" />
                <asp:Button ID="btnPage1" runat="server" Text="1" CssClass="page-btn active" />
                <asp:Button ID="btnPage2" runat="server" Text="2" CssClass="page-btn" />
                <asp:Button ID="btnPage3" runat="server" Text="3" CssClass="page-btn" />
                <asp:Button ID="btnNext" runat="server" Text="»" CssClass="page-btn" />
            </div>
        </div>
    </div>

    <style>
        /* Page Layout */
        .container {
            display: flex;
            padding: 20px;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background: #f4f4f4;
            padding: 20px;
            border-radius: 10px;
        }

        .sidebar h3 {
            font-size: 18px;
            margin-bottom: 10px;
            color: #222;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            background: #fff;
            padding: 10px;
            margin-bottom: 5px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

        .sidebar ul li:hover, .sidebar ul .active {
            background: #007bff;
            color: white;
        }

        /* Car List */
        .car-list {
            flex-grow: 1;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding-left: 20px;
        }

        .car-card {
            width: 280px;
            border: 1px solid #ccc;
            border-radius: 10px;
            overflow: hidden;
            text-align: center;
            background: white;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .car-header {
            display: flex;
            justify-content: space-between;
            background: green;
            color: white;
            padding: 5px;
            font-weight: bold;
        }

        .car-image {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }

        .car-info {
            padding: 10px;
        }

        .price {
            font-size: 16px;
            font-weight: bold;
            color: #ff6600;
        }

        /* Pagination */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .page-btn {
            background: #ff6600;
            color: white;
            padding: 10px 15px;
            margin: 0 5px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .page-btn.active, .page-btn:hover {
            background: #cc5500;
        }
    </style>
</asp:Content>

