<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="VehicleRental.Dashboard1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Admin Dashboard</h2>

    <style>
       
.dashboard {
    display: grid;
    grid-template-columns: repeat(3, 1fr); 
    gap: 20px;
    /*padding: 20px;*/
    margin-left: 20px;
}

/* Card Styling */
.card {
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
    text-align: center;
    transition: transform 0.3s ease-in-out;
    min-height: 150px;
}

/* Card Hover Effect */
.card:hover {
    transform: translateY(-5px);
}

/* Responsive Design */
@media (max-width: 992px) {
    .dashboard {
        grid-template-columns: repeat(2, 1fr); /* 2 cards per row */
    }
}

@media (max-width: 600px) {
    .dashboard {
        grid-template-columns: repeat(1, 1fr); /* 1 card per row */
    }
}
h2{
    margin-top:0;
}

    </style>


<div class="dashboard">
        <div class="card">
            <h3>Registered Users</h3>
            <p><%= RegisteredUsers %></p>
            <a href="Users.aspx">View Details >></a>
        </div>
        <div class="card">
            <h3>Categories</h3>
            <p><%= Categories %></p>
            <a href="Categories.aspx">View Details >></a>
        </div>
        <div class="card">
            <h3>Car Variants</h3>
            <p><%= CarVariants %></p>
            <a href="CarVariants.aspx">View Details >></a>
        </div>
        <div class="card">
            <h3>Cars</h3>
            <p><%= Cars %></p>
            <a href="Cars.aspx">View Details >></a>
        </div>
        <div class="card">
            <h3>Drivers</h3>
            <p><%= Drivers %></p>
            <a href="Drivers.aspx">View Details >></a>
        </div>
        <div class="card">
            <h3>New Bookings</h3>
            <p><%= NewBookings %></p>
            <a href="Bookings.aspx">View Details >></a>
        </div>
    </div>
</asp:Content>
