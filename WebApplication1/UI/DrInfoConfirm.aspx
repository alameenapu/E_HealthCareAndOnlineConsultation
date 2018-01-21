<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DrInfoConfirm.aspx.cs" Inherits="WebApplication1.UI.DrInfoConfirm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../CSS/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid">
              <div class="row">
                  <div class="col-sm-1" style="margin-top:35px">
                      <img src="../IMAGE/h.png" / class="img-circle">
                  </div>
                  <div class="col-sm-6" style="margin-top:52px;">
                     <h3>E-Healthcare<br />Online Consltation and Medical Subscription</h3>
                  </div>
                  <div class="col-sm-5" style="margin-top:35px;">
                      <div class="btn-group"  style="float:right">
                            <asp:Button ID="btnhome" runat="server" CssClass="btn btn-primary btn-sm" Text="Home" OnClick="btnhome_Click" />
                            <asp:Button ID="goPro" runat="server" CssClass="btn btn-primary btn-sm" Text="Profile" OnClick="goPro_Click" />
                            
                      </div>
                  </div>
             </div>
         </div>
        <div class="container" style="margin-top:75px; background-color:gainsboro">
            <div class="row">
                <center><h3>Please Upload Your Identity Picture</h3></center>
            </div>
            <div class="row">
                
                <div class="col-sm-3" style="margin-top:70px">
                    <asp:FileUpload ID="DrFileUpload1" runat="server" CssClass="btn-default" />
                 </div>
                 <div class="col-sm-3" style="margin-top:65px;margin-left:6px;">
                     <asp:Button ID="DrImageViwe" runat="server" Text="Save" CssClass="btn-success btn-lg" OnClick="DrImageViwe_Click" />

                 </div>
                
                <div class="col-sm-4" style="margin-top:10px">
                    <center><asp:Image ID="DrImage" runat="server" Height="140px" Width="130px" /></center>
                </div>
                <div class="col-sm-2">
                    <asp:Label ID="DrImageLabel" runat="server" Visible="false"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top:40px">
                <asp:TextBox ID="TextBoxImg" runat="server"></asp:TextBox>
               
            </div>
        </div>
    </form>
</body>
</html>
