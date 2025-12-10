<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Winform_Application.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: #f7f9fc;
            font-family: "Segoe UI", sans-serif;
        }

        .login-card {
            max-width: 420px;
            margin: 80px auto;
            padding: 30px;
            border-radius: 12px;
            background: white;
            box-shadow: 0px 6px 20px rgba(0,0,0,0.1);
        }

        .form-control {
            height: 42px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">

        <div class="login-card">

            <h3 class="text-center mb-4">Welcome to the App</h3>

            <div class="mb-3">
                <label for="txtUsername" class="form-label">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="txtPassword" class="form-label">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
            </div>

            <asp:Label ID="lblError" runat="server" CssClass="text-danger d-block mb-2"></asp:Label>

            <asp:Button 
                ID="btnLogin" 
                runat="server" 
                Text="Login" 
                CssClass="btn btn-primary w-100 mt-2"
                OnClick="btnLogin_Click" />

        </div>
    </form>

</body>
</html>
