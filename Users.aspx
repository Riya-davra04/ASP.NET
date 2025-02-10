<%@ Page Title="Registered Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="VehicleRental.Users1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Registered Users</h2>
    <style>

.MainContent {
    margin-left: 20px; /* Adjusted to prevent overlap */
    width: calc(100% - 260px); /* Take full width minus sidebar */
    background-color: #f4f4f4; /* Light gray */
   
}
/* Table Container */
.table-container {
    width: 100%;
    overflow-x: auto;
   margin-left: 20px;
}

/* Table Styling */
table {
    width: 80%;
    border-collapse: collapse;
    background-color: white;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

th, td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: left;
    white-space: nowrap; /* Prevents text wrapping */
}

th {
    background-color: #0056b3;
    color: white;
    text-align: left;
}

/* Responsive Fix */
@media (max-width: 1024px) {
    .sidebar {
        width: 100%;
        height: auto;
        position: relative;
    }

    .MainContent {
        margin-left: 0;
        width: 100%;
        padding: 0px;
    }
}

    </style>


    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Aadhar</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="UserRepeater" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("u_id") %></td>
                            <td><%# Eval("Name") %></td>
                            <td><%# Eval("Email") %></td>
                            <td><%# Eval("Phone") %></td>
                            <td><%# Eval("Gender") %></td>
                            <td><%# Eval("Address") %></td>
                            <td><%# Eval("Aadhar") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>

</asp:Content>
