<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DrInfoUI.aspx.cs" Inherits="WebApplication1.UI.DrInfoUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Doctor Log In Form</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="../CSS/bootstrap.css" rel="stylesheet" />

        <style type="text/css">
        .ddl {
            border: 1px solid #B3B6B7;
            border-radius: 0px;
            padding: 3px;
            -webkit-appearance: none;          
            text-indent: 0.01px; /*In Firefox*/
            text-overflow: ''; /*In Firefox*/
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
                          
                          <%--<asp:Button ID="Home" runat="server" CssClass="btn btn-primary btn-sm" Text="Home" OnClick="Home_Click" />--%>
                          <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='Home.aspx'">Home</button>

                      </div>
                  </div>
                </div>
             </div>
          <div class="container" style="margin-top:35px; background-color:#f0f5f5">
              <center><h4>Please Enter Your Informatin</h4></center>
              <table class="table table-striped">
                  <tr>
                      <td>Name:</td>
                      <td>
                          <asp:TextBox ID="DrInfoNameTextBox" runat="server"  placeholder="Enter Name"></asp:TextBox>
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DrInfoNameTextBox" ErrorMessage="Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>Speciality:</td>
                      <td>
                          <asp:DropDownList ID="DrInfoSpecDropDownList" runat="server" Font-Names="Andalus" CssClass="ddl" Width="175px">
                          </asp:DropDownList>
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DrInfoSpecDropDownList" ErrorMessage="Speciality required" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>Degree:</td>
                      <td>
                          <asp:TextBox ID="DrInfoDegreeTextBox" runat="server"  placeholder="Enter Degree"></asp:TextBox>
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BackColor="White" ControlToValidate="DrInfoDegreeTextBox" ErrorMessage="Degree is required" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>Username:</td>
                      <td>
                          <asp:TextBox ID="DrInfoUsernameTextBox" runat="server"  placeholder="Enter Username"></asp:TextBox>
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DrInfoUsernameTextBox" ErrorMessage="Username required" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>Password:</td>
                      <td>
                          <asp:TextBox ID="DrInfoPasswordTextBox" runat="server"  placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DrInfoPasswordTextBox" ErrorMessage="Password required" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>Re-Type Password:</td>
                      <td>
                          <asp:TextBox ID="DrInfoRePasswordTextBox" runat="server"  placeholder="Re-Type Password" TextMode="Password"></asp:TextBox>
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DrInfoRePasswordTextBox" ErrorMessage="Retype password" ForeColor="Red"></asp:RequiredFieldValidator>
                          <br />
                          <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="DrInfoPasswordTextBox" ControlToValidate="DrInfoRePasswordTextBox" ErrorMessage="Password must be same" ForeColor="Red"></asp:CompareValidator>
                      </td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>Email:</td>
                      <td>
                          <asp:TextBox ID="DrInfoEmailTextBox" runat="server"  placeholder="Enter Email"></asp:TextBox>
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DrInfoEmailTextBox" ErrorMessage="Email is required" ForeColor="Red"></asp:RequiredFieldValidator>
                          <br />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="DrInfoEmailTextBox" ErrorMessage="You must enter valid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                      </td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>Location:</td>
                      <td>
                          <asp:DropDownList ID="DrInfoLocDropDownList" runat="server" Font-Names="Andalus" CssClass="ddl" Width="175px">
                          </asp:DropDownList>
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DrInfoLocDropDownList" ErrorMessage="Locarion is required" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>Latitude:</td>
                      <td>
                          <asp:TextBox ID="DrInfoLatitudeTextBox" runat="server"  placeholder="Enter Latitude"></asp:TextBox>
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="DrInfoLatitudeTextBox" ErrorMessage="Latitude is required" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                      <td><a href="http://www.latlong.net/">Get Latitude & Longitude</a></td>
                  </tr>
                  <tr>
                      <td>Longitude:</td>
                      <td>
                          <asp:TextBox ID="DrInfoLongitudeTextBox" runat="server"  placeholder="Enter Longitude"></asp:TextBox>
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="DrInfoLongitudeTextBox" ErrorMessage="Longitude is required" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>
                          &nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td>
                          &nbsp;</td>
                      <td>
                          &nbsp;</td>
                      <td>
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td>
                          <asp:Button ID="DrInfoSaveButton" runat="server" CssClass="btrn btn-success btn-lg" OnClick="DrInfoSaveButton_Click" Text="Save" />
                      </td>
                      <td>
                          <input id="DrInfoReset" type="reset" class="btn btn-warning btn-lg" value="reset" /></td>
                      <td>&nbsp;</td>
                  </tr>
                  </table>
                  

          </div>
       
    </form>
</body>
</html>
