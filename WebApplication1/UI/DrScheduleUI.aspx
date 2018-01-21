<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DrScheduleUI.aspx.cs" Inherits="WebApplication1.UI.DrScheduleUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../CSS/bootstrap.css" rel="stylesheet" />
    <link href="../CSS/grid.css" rel="stylesheet" />
     <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyCKGs1eXt01n6Ab9pqaJb55pOhdIDxVFbI"></script>
    <link type="text/css" rel="stylesheet" href="../CSS/style.css" />
    <script type="text/javascript" src="../js/jquery-1.2.6.min.js"></script>
    <script type="text/javascript" src="../js/jquery.rater.js"></script>
    <script type="text/javascript">
    	$(function() {
    	    $('#testRater').rater({ postHref: 'Handler1.ashx' });
    	});
     </script>
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
    /*background-color:white; /* Fallback color */*/
    /*background-color: rgba(0,0,0,0.4); /* Black w/ opacity */*/
}



/* Modal Content/Box */
.mymodal-content {
    background-color: #fefefe;
    border-radius: 25px;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 2px solid #888;
    width: 40%; /* Could be more or less, depending on screen size */
    height:37%;
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
/* The Close Button */
.myclose1 {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.myclose1:hover,
.myclose1:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}


             .auto-style1 {
                 height: 32px;
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

        function popupnext() {
            var modal = document.getElementById('myModal1');
            modal.style.display = "block";
            var span = document.getElementsByClassName("myclose1")[0];
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
                            <asp:Button ID="MakeReviewButton1" runat="server" CssClass="btn btn-primary btn-sm" Text="Make Review" OnClick="MakeReviewButton1_Click" />
                            <button type="button" class="btn btn-primary btn-sm">E-Pharma</button>
                      </div>
                  </div>
             </div>
         </div>

       <div class="container-fluid" style="margin-top:75px">
           <div class="row">
               <div class="col-md-3">
                   <asp:Image ID="DrImageView1" runat="server"  CssClass="img-thumbnail" Height="380px" Width="280px"/>
               </div>
               <div class="col-md-3" style=" height:360px">
                   <div class="table-responsive" style=" height:150px;width:250px">
                   <asp:DataList ID="DrSchDatalist" runat="server">
                       <ItemTemplate>
                               <table class="table-hover" style="margin-top:20px">
                                   <tr>
                                       <td class="auto-style1">
                                           <asp:Label ID="Label1" runat="server" Text='<%# Eval("DrName") %>' Font-Names="Georgia Italic" Font-Size="X-Large"></asp:Label>
                                       </td>

                                   </tr>
                                   
                                   <tr>
                                       <td  class="auto-style1">
                                           <asp:Label ID="Label2" runat="server" Text='<%# Eval("DrDegg") %>' Font-Names="Times New Roman" Font-Size="Medium"></asp:Label>
                                       </td>

                                   </tr>
                                   
                                   <tr>
                                       <td class="auto-style1">
                                           <asp:Label ID="Label3" runat="server" Text='<%# Eval("SpecName") %>' Font-Names="Times New Roman" Font-Size="Medium"></asp:Label>
                                       </td>

                                   </tr>
                                   <tr>
                                       <td class="auto-style1">
                                           <asp:Label ID="Label4" runat="server" Text='<%# Eval("DrEmail") %>' Font-Size="Large" ForeColor="#000066"></asp:Label>
                                       </td>

                                   </tr>
                                   
                               </table>

                           

                       </ItemTemplate>
                   </asp:DataList>
                   </div>
                   <div style="height:30px; width:220px;background-color:#f5f5ef">
                          <div class="row" style="margin-top: 100px;">
                               <%--<div id="testRater" class="stat">--%>
                                   <div class="statVal"> 
                                       <span class="ui-rater">
                                           <span class="ui-rater-starsOff" style="width: 90px;"><span class="ui-rater-starsOn" runat="server" id="testSpan"></span></span>
                                           <span class="ui-rater-rating" id="avgrating" runat="server"></span>&#160;(<span class="ui-rater-rateCount" id="userscount" runat="server"></span>)
                                       </span>
                                   </div>
                               <%--</div>--%>
                           </div>
                   </div>
               </div>
               
               <div class="col-md-4">
                   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                   <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                       <ContentTemplate>
                           <asp:Timer ID="Timer1" runat="server" Interval="5000" OnTick="Timer1_Tick"></asp:Timer>
                           <asp:Label ID="timerLabel" runat="server" Text="Label"></asp:Label>
                   <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover" PageSize="4" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="False">
                       <Columns>
                           <asp:BoundField HeaderText="Serial No" DataField="serino" />
                           <asp:BoundField HeaderText="Patient ID" DataField="PaId" />
                           <asp:BoundField HeaderText="Patient Name" DataField="PaName" />
                           <asp:BoundField HeaderText="Date" DataField="Date" />
                           <asp:BoundField HeaderText="Time" DataField="Time" />
                       </Columns>

                   </asp:GridView>
                           </ContentTemplate>
                       <Triggers>
                           <asp:AsyncPostBackTrigger ControlID="GetSchedule" EventName="Click" />
                           <asp:AsyncPostBackTrigger ControlID="DeleteSchedule" EventName="Click" />
                       </Triggers>
                       </asp:UpdatePanel>
                       
                       <br />
                   
               </div>
               <div class="col-md-2" style="margin-top:25px">
                   <asp:Button ID="GetSchedule" runat="server" CssClass="btn btn-success btn-sm" Width="160px" Text="Add Schedule" OnClick="GetSchedule_Click"/><br />
                   <asp:Button ID="DeleteSchedule" runat="server" CssClass="btn btn-danger btn-sm" Width="160px" Text="Delete Schedule" OnClick="DeleteSchedule_Click" />
               </div>
           </div>
       </div>
      <%--  <div class="container-fluid">
            <div class="col-sm-3"></div>
            <div class="col-sm-3">
                <div class="row">
                       
                       <div style="background-color: #f5f5ef;">
                         
                       </div>
                   </div>
            </div>
            <div class="col-sm-4"></div>
            <div class="col-sm-2"></div>
        </div>--%>
        <div class="container" style="margin-top:15px">
            <div class="row">
                <div class="col-md-12">
                    <div id="Drmap" style="background-color:aqua;width:100%;height:450px; border:outset; border-color:azure">

                    </div>

                </div>
            </div>
        </div>
        <div class="container-fluid" style="width:100%;height:220px">

        </div>
        <div id="myModal" class="mymodal">
           <div class="mymodal-content" style="border-color:red;">
              <div class="col-sm-4" style="margin-top:30px">
                  <img alt="alert!" src="../IMAGE/alertimg.png" class="img-responsive" />
              </div>
               <div class="col-sm-6" style="margin-top:75px">
                   <h5>Your schedule already exists!</h5>
               </div>
               <div class="col-sm-2">
                   <span class="myclose">x</span>
               </div>
           </div>
       </div>
        <div id="myModal1" class="mymodal">
           <div class="mymodal-content" style="border-color:red;">
              <div class="col-sm-4" style="margin-top:30px">
                  <img alt="alert!" src="../IMAGE/alertimg.png" class="img-responsive" />
              </div>
               <div class="col-sm-6" style="margin-top:75px">
                   <h5>Today's schedule list is full<br />Please check next date schedule.</h5>
               </div>
               <div class="col-sm-2">
                   <span class="myclose1">x</span>
               </div>
           </div>
       </div>
    </form>
</body>
</html>
