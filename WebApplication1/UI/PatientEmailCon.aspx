<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientEmailCon.aspx.cs" Inherits="WebApplication1.UI.PatientEmailCon" %>

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
                      <div class="btn-group" style="margin-left:180px">
                            <asp:Button ID="btnhome" runat="server" CssClass="btn btn-primary btn-lg" Text="Home" OnClick="btnhome_Click" />
                            <asp:Button ID="goPro" runat="server" CssClass="btn btn-primary btn-lg" Text="Profile" OnClick="goPro_Click" />
                            
                      </div>
                  </div>
             </div>
         </div>
        <div class="container" style="margin-top:150px">
            <center><h2 class="text-success" style="font-family:SimSun-ExtB">Your email is activeted.<br /> Thank for using our website and enjoy our service.</h2></center>
        </div>
    </form>
</body>
</html>
