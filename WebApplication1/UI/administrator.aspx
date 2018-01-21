<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="administrator.aspx.cs" Inherits="WebApplication1.UI.administratopr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../CSS/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 306px;
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
        <div class="container" style="margin-top:100px; background-color:#f0f5f5; height:220px">
            <div class="row">
                <div class="col-sm-4"></div>
               <div class="col-sm-4" style="margin-top:55px">

                   <table class="table table-bordered">
                       <tr>
                           <td class="auto-style1"><asp:Label ID="admname" runat="server" Font-Size="Large" Text="Name:"></asp:Label></td>
                           <td><asp:TextBox ID="admnameText" runat="server"></asp:TextBox></td>
                       </tr>
                       <tr>
                           <td class="auto-style1"><asp:Label ID="admpass" runat="server" Font-Size="Large" Text="Password"></asp:Label></td>
                           <td><asp:TextBox ID="admpassText" runat="server" TextMode="Password"></asp:TextBox></td>
                       </tr>
                       
                   </table>
                      <center><td class="auto-style1"><asp:Button ID="Button1" runat="server" CssClass="btn btn-success btn-sm" Text="Submit" OnClick="Button1_Click" /></td></center>
               </div>
            </div>
        </div>
        </form>
</body>
</html>
