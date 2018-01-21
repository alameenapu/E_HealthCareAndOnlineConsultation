<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DrSearchUI.aspx.cs" Inherits="WebApplication1.UI.DrSearchUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="../CSS/bootstrap.css" rel="stylesheet" />
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyCKGs1eXt01n6Ab9pqaJb55pOhdIDxVFbI"></script>
    <style>
        .mymodal {
    
    display:none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}



/* Modal Content/Box */
.mymodal-content {
    background-color: #fefefe;
    border-radius: 25px;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 60%; /* Could be more or less, depending on screen size */
    height:65%;
}

/* The Close Button */
.myclose {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.myclose:hover,
.myclose:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}


    </style>
    <script>
        function mouseOver(a, b) {

            // alert(a +",great "+b);

            var latlng = new google.maps.LatLng(a, b);


            var myOptions =
            {
                zoom: 15,

                center: latlng,

                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            var container = document.getElementById("Drmap");

            map = new google.maps.Map(container, myOptions);

            var marker = new google.maps.Marker({
                position: latlng, map: map, //title: c
            });


        }
        function mouseOut() {
            document.getElementById("Drmap");

        }

        function popup() {
            var modal = document.getElementById('myModal');
            modal.style.display = "block";
            var span = document.getElementsByClassName("myclose")[0];
            span.onclick = function () {
                modal.style.display = "none";
            }
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }

        }
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
                      <div class="btn-group" style="float:right">
                            <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='Home.aspx'">Home</button>
                            <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='Clinic.aspx'">Find Clinic</button>
                            <asp:Button ID="MakeReviewButton" runat="server" CssClass="btn btn-primary btn-sm" Text="Make Review" OnClick="MakeReviewButton_Click" />
                            <button type="button" class="btn btn-primary btn-sm">E-Pharma</button>
                      </div>
                  </div>
             </div>
         </div>

        <div class="container-fluid" style="margin-top:75px;">
            <div class="row">
                <div class="col-md-4" style="background-color:#f0f5f5">
                    <asp:DataList ID="DrDatalist" runat="server" OnItemCommand="DrDatalist_ItemCommand">
                        <ItemTemplate>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <tr>
                                        <td><asp:Label ID="DrSearchNamelbl" runat="server" Text='<%# Eval("DrName") %>' Font-Names="Georgia Italic" Font-Size="X-Large"></asp:Label></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="DrSearchDegglbl" runat="server" Text='<%# Eval("DrDegg") %>' Font-Names="Times New Roman" Font-Size="Medium"></asp:Label></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td><asp:LinkButton ID="DrMapLinkButton" runat="server" CommandName="DrMap" CommandArgument='<%# Eval("DrId") %>' ForeColor="#999900">View Location</asp:LinkButton></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td><asp:LinkButton ID="DrConLinkButton" runat="server" CommandName="DrCon" CommandArgument='<%# Eval("DrId") %>' ForeColor="#999900">Contact With Doctor</asp:LinkButton></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>

                    </asp:DataList>
                </div>
                <div class="col-md-2"></div>
                <div id="Drmap" style="background-color:white; width:40%; height: 250px;" class="col-md-4">
                   
                </div>      
            </div>
        </div>
        <div id="myModal" class="mymodal">

            <div class="mymodal-content">
                <div class="col-lg-12">
                    <span class="myclose">x</span>
                    <h2>Patient Log In</h2>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="email">Username:</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>

                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd">Password:</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" />Remember me</label>
                            </div>
                        </div>
                        <div class="col-sm-offset-2 col-sm-10" style="margin-top: 10px">
                            <a href="DrInfoUI.aspx">Forgot Password</a>
                        </div>
                        <div class="col-sm-offset-2 col-sm-10" style="margin-top: 10px">
                            <a href="PatientForm1.aspx">Create New Account</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <asp:Button ID="DrSearchButton1" runat="server" CssClass="btn btn-default" OnClick="DrSearchButton1_Click" Text="Submit" />
                        </div>
                    </div>
                    <asp:Label ID="DrSearchLabel" runat="server"></asp:Label>
                </div>
            </div>

        </div>
      
    </form>
</body>
</html>
