<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clinic.aspx.cs" Inherits="WebApplication1.UI.Clinic" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../CSS/bootstrap.css" rel="stylesheet" />
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyCKGs1eXt01n6Ab9pqaJb55pOhdIDxVFbI"></script>
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
        //function mouseOut() {
        //    document.getElementById("Drmap");

        //}

        //function popup() {
        //    var modal = document.getElementById('myModal');
        //    modal.style.display = "block";
        //    var span = document.getElementsByClassName("myclose")[0];
        //    span.onclick = function () {
        //        modal.style.display = "none";
        //    }
        //    window.onclick = function (event) {
        //        if (event.target == modal) {
        //            modal.style.display = "none";
        //        }
        //    }

        //}
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
                            <button type="button" class="btn btn-primary btn-sm">Home</button>
                            <%--<button type="button" class="btn btn-primary btn-sm">Find Clinic</button>
                            <button type="button" class="btn btn-primary btn-sm">View Review</button>--%>
                            <button type="button" class="btn btn-primary btn-sm">E-Pharma</button>
                      </div>
                  </div>
             </div>
         </div>
        <div class="container" style="background-color: #f0f5f5;margin-top:35px; height:80px">
            <%--<div class="row">
                 <h2 class="font"><center>Select Location Search Medical/Clinic</center></h2>
            </div>--%>
            <div class="row" style="margin-top:25px">
                <div class="col-sm-6">

                    <div class="row" style="margin-left:130px">
                        Location
                    <asp:DropDownList ID="ClinicDropList" runat="server" AutoPostBack="true" Width="220px" BackColor=" #e6f0ff" ForeColor="#7d6754" Font-Names="Andalus" CssClass="ddl"></asp:DropDownList>
                    </div>
                </div>
                <div class="col-sm-6">
                    <center><asp:Button ID="ClinicSearch" runat="server" Width="120px" CssClass="btn btn-info" Text="Seacrh" OnClick="ClinicSearch_Click" /></center>
                </div>
            </div>
        </div>
        <div class="container-fluid" style="margin-top: 35px">
            <div class="row">
                <div class="col-md-4">
                    <asp:DataList ID="ClinicDataList1" runat="server" OnItemCommand="ClinicDataList1_ItemCommand">
                        <ItemTemplate>
                            <div class="table-responsive">
                                <table class="tab-content table-hover">
                                    <tr>
                                        <td>
                                            <asp:Image ID="clinicimg" runat="server" ImageUrl='<%# Eval("ClinicImg") %>' Width="140px" Height="130px" />
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="LinkButton1" runat="server" Font-Names="ALGERIAN" Font-Size="X-Large" Text='<%# Eval("ClinicName") %>' CommandName="Clinic" CommandArgument='<%# Eval("ClinicId") %>'>LinkButton</asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>

                    </asp:DataList>

                    <center>
                                  
                    </center>
                </div>

                <div class="col-md-3" style="margin-top: 160px">
                    <asp:DataList ID="ClinicInfoDataList" runat="server">
                        <ItemTemplate>
                            <div class="table-responsive">
                                <table class="tab-content table-condensed">
                                    <tr>
                                        <td>Category:</td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Speciality:</td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Speciality") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Address:</td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Phone:</td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>

                    </asp:DataList>
                </div>
                <div id="Drmap" style="background-color: white; width: 40%; height: 250px;" class="col-md-5">
                </div>

            </div>
        </div>
        <div class="container">
            <div class="col-sm-2">
                <asp:LinkButton ID="lnkbtnPrevious" runat="server" OnClick="lnkbtnPrevious_Click" Text="Previous" Font-Size="Large" Visible="false"></asp:LinkButton>
            </div>
            <div class="col-sm-8">
                <asp:DataList ID="dlPaging" runat="server" OnItemCommand="dlPaging_ItemCommand" OnItemDataBound="dlPaging_ItemDataBound" RepeatDirection="Horizontal" HorizontalAlign="Center" RepeatLayout="Table">
                       
                        <ItemTemplate>
                             <asp:LinkButton ID="lnkbtnPaging" runat="server" CommandArgument='<%# Eval("PageIndex") %>' CommandName="lnkbtnPaging" Text='<%# Eval("PageText") %>' Font-Size="Large"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </ItemTemplate>
                        
                    </asp:DataList>
               

            </div>
            <div class="col-sm-2">
                  <asp:LinkButton ID="lnkbtnNext" runat="server" OnClick="lnkbtnNext_Click" Text="Next" Font-Size="Large" Visible="false"></asp:LinkButton>
            </div>
        </div>
        <div class="container" style="height:40px"></div>
    </form>
</body>
</html>
