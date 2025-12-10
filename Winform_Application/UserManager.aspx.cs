using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Winform_Application
{
    public partial class UserManager : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["MyDb"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        void LoadUsers()
        {
            using (SqlConnection connection = new SqlConnection(conn))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM users", connection);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvUsers.DataSource = dt;
                gvUsers.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Console.WriteLine(e);
            
            using (SqlConnection connection = new SqlConnection(conn))
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO users (userName, password, age, sex) VALUES (@u, @p, @a, @s)",
                    connection);

                cmd.Parameters.AddWithValue("@u", txtNewUsername.Text);
                cmd.Parameters.AddWithValue("@p", txtNewPassword.Text);
                cmd.Parameters.AddWithValue("@a", txtNewAge.Text);
                cmd.Parameters.AddWithValue("@s", txtNewSex.Text);

                connection.Open();
                cmd.ExecuteNonQuery();
            }

            LoadUsers();
        }


        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditUser")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                using (SqlConnection con = new SqlConnection(conn))
                {
                    con.Open();
                    string sql = "SELECT * FROM users WHERE id = @id";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@id", id);

                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        hfEditId.Value = id.ToString();
                        txtEditUsername.Text = dr["userName"].ToString();
                        txtEditPassword.Text = dr["password"].ToString();
                        txtEditAge.Text = dr["age"].ToString();
                        txtEditSex.Text = dr["sex"].ToString();
                    }
                }

                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "showModal", "var myModal = new bootstrap.Modal(document.getElementById('editUserModal')); myModal.show();", true);
            }
        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();

                string sql = "UPDATE users SET userName = @u, password = @p, age = @a, sex = @s WHERE id = @id";
                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@u", txtEditUsername.Text);
                cmd.Parameters.AddWithValue("@p", txtEditPassword.Text);
                cmd.Parameters.AddWithValue("@a", txtEditAge.Text);
                cmd.Parameters.AddWithValue("@s", txtEditSex.Text);
                cmd.Parameters.AddWithValue("@id", hfEditId.Value);

                cmd.ExecuteNonQuery();
            }

            LoadUsers();

            ScriptManager.RegisterStartupScript(this, this.GetType(),
                "hideModal", "$('#editUserModal').modal('hide');", true);
        }



        protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            string sqlcheck = "SELECT * FROM users WHERE id = @id";
        }


        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value); 

            using (SqlConnection connection = new SqlConnection(conn))
            {
                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM users WHERE id = @id",
                    connection);

                cmd.Parameters.AddWithValue("@id", id);

                connection.Open();
                cmd.ExecuteNonQuery();
            }

            LoadUsers();
        }



    }
}