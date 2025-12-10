<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="UserManager.aspx.cs" Inherits="Winform_Application.UserManager" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="maincontent" runat="Server">

    <div class="card shadow p-4">
        <h2 class="mb-4 text-center">User Manager</h2>

        <asp:GridView ID="gvUsers" runat="server"
            CssClass="table table-bordered table-striped text-center"
            AutoGenerateColumns="False"
            DataKeyNames="id"
            OnRowEditing="gvUsers_RowEditing"
            OnRowDeleting="gvUsers_RowDeleting"
            OnRowCommand="gvUsers_RowCommand"
            HeaderStyle-CssClass="table-dark">

            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="true" />
                <asp:BoundField DataField="userName" HeaderText="Username" />
                <asp:BoundField DataField="password" HeaderText="Password" />
                <asp:BoundField DataField="age" HeaderText="Age" />
                <asp:TemplateField HeaderText="Sex">
                    <ItemTemplate>
                        <%# Convert.ToBoolean(Eval("sex")) ? "Male" : "Female" %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEdit" runat="server"
                            Text="Edit"
                            CommandName="EditUser"
                            CommandArgument='<%# Eval("id") %>'
                            CssClass="btn btn-sm btn-warning">
                        </asp:LinkButton>

                        <asp:LinkButton ID="btnDelete" runat="server"
                            Text="Delete"
                            CommandName="Delete"
                            CssClass="btn btn-sm btn-danger"
                            OnClientClick="return confirm('Are you sure?');">
                        </asp:LinkButton>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:LinkButton ID="btnEdit" runat="server"
                            Text="Edit"
                            CssClass="btn btn-sm btn-warning"
                            CommandName="EditUser"
                            CommandArgument='<%# Eval("id") %>'>
                        </asp:LinkButton>

                        <asp:LinkButton ID="btnCancel" runat="server"
                            Text="Cancel"
                            CommandName="Cancel"
                            CssClass="btn btn-sm btn-secondary">
                        </asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>

            </Columns>

        </asp:GridView>

        <hr />

        <h4 class="mt-3">Add New User</h4>

        <div class="row">
            <div class="col-md-3">
                <label>Username</label>
                <asp:TextBox ID="txtNewUsername" runat="server" CssClass="form-control" />
            </div>

            <div class="col-md-3">
                <label>Password</label>
                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" />
            </div>

            <div class="col-md-2">
                <label>Age</label>
                <asp:TextBox ID="txtNewAge" runat="server" CssClass="form-control" />
            </div>

            <div class="col-md-2">
                <label>Sex</label>
                <asp:TextBox ID="txtNewSex" runat="server" CssClass="form-control" />
            </div>

            <div class="col-md-2 d-flex align-items-end">
                <asp:Button ID="btnAdd" runat="server" Text="Add User"
                    CssClass="btn btn-success w-100" OnClick="btnAdd_Click" />
            </div>
        </div>

    </div>

    <div class="modal fade" id="editUserModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Edit User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <asp:HiddenField ID="hfEditId" runat="server" />

                    <label>Username</label>
                    <asp:TextBox ID="txtEditUsername" runat="server" CssClass="form-control" />

                    <label class="mt-2">Password</label>
                    <asp:TextBox ID="txtEditPassword" runat="server" CssClass="form-control" />

                    <label class="mt-2">Age</label>
                    <asp:TextBox ID="txtEditAge" runat="server" CssClass="form-control" />

                    <label class="mt-2">Sex</label>
                    <asp:TextBox ID="txtEditSex" runat="server" CssClass="form-control" />
                </div>

                <div class="modal-footer">
                    <asp:Button ID="btnSaveEdit" runat="server"
                        CssClass="btn btn-primary"
                        Text="Save Changes" OnClick="btnSaveEdit_Click" />
                </div>

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>


