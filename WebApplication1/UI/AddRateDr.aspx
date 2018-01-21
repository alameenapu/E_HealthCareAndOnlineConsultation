<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddRateDr.aspx.cs" Inherits="WebApplication1.UI.AddRateDr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rate Your Doctor</title>
    <link href="../CSS/bootstrap.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="../CSS/style.css" />
    <script type="text/javascript" src="../js/jquery-1.2.6.min.js"></script>
    <script type="text/javascript" src="../js/jquery.rater.js"></script>
    <script type="text/javascript">
    	$(function() {
    	    $('#testRater').rater({ postHref: 'Handler1.ashx' });
    	});
     </script>
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
                            <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='Home.aspx'">Home</button>
                            <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='Clinic.aspx'">Find Clinic</button>
                            <button type="button" class="btn btn-primary btn-sm">E-Pharma</button>
                      </div>
                  </div>
             </div>
         </div>

        <div class="container-fluid" style="margin-top:30px;">
            <div class="row">
                <div class="col-md-2">
                    <asp:Image ID="rateimage" runat="server" CssClass="img-rounded" Height="180px" Width="180px" />
                </div>
                <div class="col-md-4" style=" background-color:#f5f5ef; height:180px;width:560px; border-radius:10px;">
                    <div class="row" style="margin-top:15px;">
                        <center><asp:Label ID="DrNameRateLBL" runat="server" Font-Names="Georgia Italic" Font-Size="X-Large" ForeColor="#337ab7"></asp:Label></center>
                    </div>
                    <div class="row" style="margin-top:45px;">
                        <div id="testRater" class="stat">
                           <marquee><h5 class="text-success">Rate your Doctor by clicking rating bar</h5></marquee>
                            <div class="statVal" style="margin-left:200px">
                               <span class="ui-rater">
                                    <span class="ui-rater-starsOff" style="width:90px;"><span class="ui-rater-starsOn" runat="server" id="testSpan"></span></span>
                                    <span class="ui-rater-rating" id="avgrating" runat="server"></span>&#160;(<span class="ui-rater-rateCount" id="userscount" runat="server"></span>)
                               </span>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
