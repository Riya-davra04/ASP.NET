<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="VehicleRental.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <style>
       .slider {
           width: 100%;
           height: 500px;
           overflow: hidden;
           position: relative;
       }

       .slides {
           display: flex;
           width: 300%;
           animation: slideAnimation 5s infinite;
       }

       .slides img {
           width: 300%;
           height: 500px;
           object-fit: contain; 
       }

        @keyframes slideAnimation {
            0%, 30%    { transform: translateX(0%); }    
            33%, 63%   { transform: translateX(-33.33%); } 
            66%, 96%   { transform: translateX(-66.66%); } 
            100%       { transform: translateX(0%); }    
        }

        .text-overlay {
            position: absolute;
            top: 40%;
            width: 100%;
            text-align: center;
            color: white;
            font-size: 20px;
            font-weight: bold;
            text-shadow: 2px 2px 8px black;
        }
        .highlight {
            color: red;
        }
       .auto-style1 {
           position: absolute;
           top: 89%;
           width: 36%;
           text-align: center;
           color: white;
           font-size: 20px;
           font-weight: bold;
           text-shadow: 2px 2px 8px black;
           left: 239px;
           height: 71px;
       }
    </style>
    
    <div class="slider">
        <div class="slides">
            <img src="Images/car1.jpg" alt="Car Rental">
            <img src="Images/car2.jpg" alt="Car Ride">
            <img src="Images/car3.jpg" alt="Explore Cars">
        </div>
        <div class="auto-style1">
            <span class="highlight">FIND YOUR CAR TODAY!</span><br>
            BOOK THE BEST CAR FOR YOU
        </div>
    </div>
</asp:Content>
