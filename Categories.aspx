<%@ Page Title="Manage Categories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="VehicleRental.Categories1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Main Content Adjustments */
.content {
    margin-left: 260px; /* Matches master page sidebar width */
    padding: 20px;
}

/* Form Styling */
.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    font-weight: bold;
    color: #34495E;
}

.form-group input, .form-group textarea {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

/* Button Styles */
.btn {
    padding: 10px 15px;
    background: #007BFF;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    margin-right: 10px;
}

.btn:hover {
    background: #0056b3;
}

/* Grid/Table Styling */
.table-container {
    margin-top: 20px;
}

.table {
    width: 100%;
    border-collapse: collapse;
    background: white;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
}

.table th, .table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}

/* Edit & Delete Buttons */
.edit-btn {
    background: #28A745;
    color: white;
    padding: 5px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.delete-btn {
    background: #DC3545;
    color: white;
    padding: 5px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

/* Image Thumbnail */
.table img {
    width: 50px;
    height: 50px;
    border-radius: 5px;
    object-fit: cover;
}

/* Responsive */
@media screen and (max-width: 768px) {
    .content {
        margin-left: 0;
        padding: 10px;
    }

    .table th, .table td {
        padding: 5px;
        font-size: 14px;
    }
}

    </style>
    <h2>Manage Categories</h2>

    <asp:HiddenField ID="HiddenCategoryID" runat="server" />
    <asp:Label ID="lblCategoryCount" runat="server" CssClass="category-count"></asp:Label>

    <div class="form-group">
        <label for="TxtCategoryName">Category Name:</label>
        <asp:TextBox ID="TxtCategoryName" runat="server"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="TxtDescription">Description:</label>
        <asp:TextBox ID="TxtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="FileUploadImage">Upload Image:</label>
        <asp:FileUpload ID="FileUploadImage" runat="server" />
    </div>

    <asp:Button ID="BtnSaveCategory" runat="server" Text="Save Category" CssClass="btn" OnClick="BtnSaveCategory_Click" />
    <asp:Button ID="BtnUpdateCategory" runat="server" Text="Update Category" CssClass="btn" OnClick="BtnUpdateCategory_Click" />

    <div class="table-container">
        <asp:GridView ID="CategoryGrid" runat="server" AutoGenerateColumns="False" CssClass="table"
            OnRowCommand="CategoryGrid_RowCommand">
            <Columns>
                <asp:BoundField DataField="CategoryID" HeaderText="ID" />
                <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <img src='<%# ResolveUrl(Eval("ImagePath").ToString()) %>'
                            alt="Category Image" width="50" height="50" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="BtnEdit" runat="server" Text="Edit" CommandName="EditCategory"
                            CommandArgument='<%# Eval("CategoryID") %>' CssClass="edit-btn" />
                        <asp:Button ID="BtnDelete" runat="server" Text="Delete" CommandName="DeleteCategory"
                            CommandArgument='<%# Eval("CategoryID") %>' CssClass="delete-btn" OnClientClick="return confirm('Are you sure you want to delete this category?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
