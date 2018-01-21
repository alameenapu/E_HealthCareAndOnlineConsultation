<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminForm.aspx.cs" Inherits="WebApplication1.UI.AdminForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../CSS/bootstrap.css" rel="stylesheet" />

    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server" class="form-horizontal">
          <div class="container-fluid">
              <div class="row">
                  <div class="col-sm-1" style="margin-top:35px">
                      <img src="../IMAGE/h.png" / class="img-circle">
                  </div>
                  <div class="col-sm-6" style="margin-top:52px;">
                     <h3>E-Healthcare<br />Online Consltation and Medical Subscription</h3>
                  </div>
                  <div class="col-sm-5" style="margin-top:35px;">
                      <div class="btn-group" style="float:right">
                            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='Home.aspx';">Home</button>
                           <%-- <asp:Button ID="admstbutton" runat="server" CssClass="btn btn-primary btn-sm" Text="Home" OnClick="admstbutton_Click"></asp:Button>--%>
                            <%--<button type="button" class="btn btn-primary btn-sm">View Review</button>
                            <button type="button" class="btn btn-primary btn-sm">E-Pharma</button>--%>
                      </div>
                  </div>
             </div>
         </div>
        <div class="container-fluid" style="margin-top:35px">
            <div class="row">
                <div class="col-md-4">
                    <asp:Button ID="admupbtn" runat="server" CssClass="btn-default" Text="Update Clinic" Width="200px" OnClick="admupbtn_Click" /><br />
                </div>
                <div class="col-md-6">
                    <table class="table table-responsive">
                        <tr>
                            <td>Clinic/Medical Name:</td>
                            <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Location:</td>
                            <td><asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>Latitude:</td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Longitude:</td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Catagory:</td>
                            <td>
                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Spetiality:</td>
                            <td class="auto-style1">
                                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td>
                                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Phone:</td>
                            <td>
                                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Upload Image:</td>
                            <td>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <center><asp:Button ID="Button1" runat="server" CssClass="btn-success btn-sm" Text="Save" /></center>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
