<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SymptomHome.aspx.cs" Inherits="WebApplication1.UI.SymptomHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../CSS/bootstrap.css" rel="stylesheet" />
        <style type="text/css">
        .ddl {
            border: 2px solid #003d99;
            border-radius: 5px;
            padding: 3px;
            -webkit-appearance: none;          
            text-indent: 0.01px; /*In Firefox*/
            text-overflow: ''; /*In Firefox*/
        }
</style>
</head>
<body>
    <form id="form1" runat="server">
         <div class="container-fluid">
             <div class="row">
                  <div class="col-sm-1" style="margin-top:35px">
                      <img src="../IMAGE/h.png" class="img-circle"/>
                  </div>
                  <div class="col-sm-6" style="margin-top:52px;">
                     <h3>E-Healthcare<br />Online Consltation and Medical Subscription</h3>
                  </div>
                  <div class="col-sm-5" style="margin-top:35px;">
                      <div class="btn-group" style="float:right">
                            <asp:Label ID="PaUsName" runat="server" CssClass="btn btn-primary btn-sm" ></asp:Label>
                            <asp:Button ID="Back" runat="server" CssClass="btn btn-primary btn-sm" Text="Profile" OnClick="Back_Click" />
                            <asp:Button ID="PaLogOut" runat="server" CssClass="btn btn-primary btn-sm" Text="Log Out" OnClick="PaLogOut_Click" />
                            
                      </div>
                  </div>
             </div>
         </div>
      <div class="container-fluid" style="margin-top:100px">
          <div class="row">
              <div class="col-md-4">
                  <asp:Image ID="Image1" runat="server" ImageUrl="~/IMAGE/Maleimg/defaultMale.png"/>
              </div>
              <div class="col-md-4">
                  <div class="table-responsive">
                      <table class="table-condensed">
                          <tr>
                              <td>For
                              </td>
                              <td>
                                  <asp:DropDownList ID="DropDownList1" runat="server"  Width="220px" BackColor=" #e6f0ff" ForeColor="#7d6754" Font-Names="Andalus" CssClass="ddl" AutoPostBack="True">
                                      <asp:ListItem Value="1">me</asp:ListItem>
                                      <asp:ListItem Value="2">someone else</asp:ListItem>
                                  </asp:DropDownList>
                              </td>
                          </tr>
                          <tr>
                              <td>Gender
                              </td>
                              <td>
                                  <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="checkbox-inline" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                      <asp:ListItem Value="1">Male</asp:ListItem>
                                      <asp:ListItem Value="2">Female</asp:ListItem>
                                  </asp:RadioButtonList>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList1" Display="Dynamic"
                                      SetFocusOnError="true" ForeColor="Red" ErrorMessage="Select your gender"></asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td>Age
                              </td>
                              <td>
                                  <asp:DropDownList ID="DropDownList2" runat="server"  Width="220px" BackColor=" #e6f0ff" ForeColor="#7d6754" Font-Names="Andalus" CssClass="ddl" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                      <asp:ListItem Value="-1">choose one</asp:ListItem>
                                      <asp:ListItem Value="1">Check for someone 0-2 years</asp:ListItem>
                                      <asp:ListItem Value="2">Check for someone 3- 6 years</asp:ListItem>
                                      <asp:ListItem Value="3">Check for someone 7-12 years</asp:ListItem>
                                      <asp:ListItem Value="4">13-17  years</asp:ListItem>
                                      <asp:ListItem Value="5">18-24  years</asp:ListItem>
                                      <asp:ListItem Value="6">25-34  years</asp:ListItem>
                                      <asp:ListItem Value="7">35-44  years</asp:ListItem>
                                      <asp:ListItem Value="8">45-54  years</asp:ListItem>
                                      <asp:ListItem Value="9">55-64  years</asp:ListItem>
                                      <asp:ListItem Value="10">Over 65  years</asp:ListItem>
                                  </asp:DropDownList>
                              </td>
                          </tr>
                          <tr>
                              <td>Zip Code
                              </td>
                              <td>
                                  <asp:TextBox ID="TextBox1" runat="server" CssClass="ddl" Width="220px" MaxLength="10"  placeholder="Optional"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td>Email Address
                              </td>
                              <td>
                                  <asp:TextBox ID="TextBox2" runat="server" CssClass="ddl" Width="220px" ControlToValidate="TextBox2" MaxLength="20"  placeholder="Optional"></asp:TextBox>
                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="" ControlToValidate="TextBox2" Display="Dynamic"
                                      ForeColor="#CC0000" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  
                              </td>
                              <td>
                                  <center>
                                      <asp:Button ID="Button1" runat="server" CssClass="btn btn-success btn-sm" Text="Done" OnClick="Button1_Click" />
                                  </center>
                              </td>
                          </tr>
                      </table>
                  </div>
              </div>
       </div>

    </div>
    </form>
</body>
</html>

