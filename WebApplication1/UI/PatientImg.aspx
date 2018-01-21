<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientImg.aspx.cs" Inherits="WebApplication1.UI.PatientImg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="../CSS/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form2" runat="server" class="form-horizontal">      
          <div class="container-fluid">
              <div class="row">
                  <div class="col-sm-1" style="margin-top:35px">
                      <img src="../IMAGE/h.png" / class="img-circle">
                  </div>
                  <div class="col-sm-6" style="margin-top:52px;">
                     <h3>E-Healthcare<br />Online Consltation and Medical Subscription</h3>
                  </div>
                  <div class="col-sm-5" style="margin-top:35px;">
                      <div class="btn-group" style="float: right">
                          <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='Home.aspx'">Home</button>
                          <asp:Button ID="goPro" runat="server" CssClass="btn btn-primary btn-sm" Text="Profile" OnClick="goPro_Click" />

                      </div>
                  </div>

                </div>
             </div>
             
            <div class="container" style="margin-top:75px; background-color:gainsboro; height:250px;">
            <div class="row">
                <center><h3>Please Upload Your Identity Picture</h3></center>
            </div>
            <div class="row">
                
                <div class="col-sm-3" style="margin-top:70px">
                    <asp:FileUpload ID="PaFileUpload1" runat="server" CssClass="btn-default" />
                 </div>
                 <div class="col-sm-3" style="margin-top:65px;margin-left:6px;">
                     <asp:Button ID="ImgSave" runat="server" Text="Save" CssClass="btn-success btn-sm" OnClick="ImgSave_Click" />

                 </div>
                
                <div class="col-sm-4" style="margin-top:10px">
                    <center><asp:Image ID="PaImg" runat="server" Height="140px" Width="130px" /></center>
                </div>
                <div class="col-sm-2">
                    <asp:Label ID="Palbl" runat="server" Visible="false"></asp:Label>
                </div>
               
            </div>
            
        </div>
    </form>
</body>
</html>
