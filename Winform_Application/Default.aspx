<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Winform_Application._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="hero-section text-white" style="
        background-image: url('https://images.unsplash.com/photo-1529101091764-c3526daf38fe');
        background-size: cover;
        background-position: center;
        padding: 100px 20px;
        position: relative;">
    <div style="background: rgba(0,0,0,0.55); padding: 80px 20px; border-radius: 12px;">
        <h1 class="display-3 fw-bold">Welcome to My Project</h1>
        <p class="lead mt-3">A modern, intuitive, and easy-to-use management solution.</p>
        <a class="btn btn-primary btn-lg mt-3 px-4">Get Started</a>
    </div>
</div>

<div class="container mt-5">
    <h2 class="text-center mb-4">Key Features</h2>
    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h4 class="card-title">📌 User Management</h4>
                    <p class="card-text">Easily create, edit, and monitor user activities within the system.</p>
                    <a href="#" class="btn btn-outline-primary">View Details</a>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h4 class="card-title">📊 Visual Reports</h4>
                    <p class="card-text">Access real-time charts, statistics, and detailed reports.</p>
                    <a href="#" class="btn btn-outline-primary">View Reports</a>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h4 class="card-title">⚙️ Flexible Configuration</h4>
                    <p class="card-text">Customize the system to meet your business needs.</p>
                    <a href="#" class="btn btn-outline-primary">Settings</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- About Section -->
<div class="container mt-5 mb-5">
    <div class="row align-items-center">
        <div class="col-md-6">
            <img src="https://images.unsplash.com/photo-1551033406-611cf9a28f67" class="img-fluid rounded shadow" />
        </div>
        <div class="col-md-6">
            <h3 class="fw-bold">Why Choose Our System?</h3>
            <p class="mt-3">
                We provide a powerful and user-friendly platform that helps you manage work more efficiently.
            </p>
            <ul>
                <li> Clean and easy-to-use interface</li>
                <li> Fast and stable performance</li>
                <li> Fully responsive on all devices</li>
            </ul>
        </div>
    </div>
</div>




<!-- Footer -->
<footer class="text-center text-muted py-3 border-top">
    © @DateTime.Now.Year - Your System. All rights reserved.
</footer>

</asp:Content>
