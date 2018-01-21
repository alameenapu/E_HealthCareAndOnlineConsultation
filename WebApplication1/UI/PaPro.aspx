<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaPro.aspx.cs" Inherits="WebApplication1.UI.PaPro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../CSS/bootstrap.css" rel="stylesheet" />
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
                            <asp:Label ID="PaUsName" runat="server" CssClass="btn btn-primary btn-sm" ></asp:Label>
                            <asp:Button ID="Syntom" runat="server" CssClass="btn btn-primary btn-sm" Text="Check Syntoms" OnClick="Syntom_Click" />
                            <asp:Button ID="PaLogOut" runat="server" CssClass="btn btn-primary btn-sm" Text="Log Out" OnClick="PaLogOut_Click" />
                            
                      </div>
                  </div>
             </div>
         </div>
        <div class="container-fluid" style="margin-top:35px">
            <div class="col-md-3">
                 <asp:Image ID="PatientPic" runat="server"  CssClass="img-circle" Width="120px" Height="120px"/><br />
                <br />
                  <div class="row">
                        <asp:Button ID="FileUpload" runat="server" CssClass="btn btn-warning btn-sm" Text="Upload File" Width="200px" OnClick="FileUpload_Click"  />
                        <asp:Button ID="ContWith" runat="server" CssClass="btn btn-warning btn-sm" Text="Contact With Doctor" Width="200px" />
                   </div>
            </div>
            
            <div class="col-md-4">
                
                <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="false" EmptyDataText="No files uploaded">
                    <Columns>
                        <%--<asp:BoundField DataField="filename" HeaderText="File Name" />--%>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <%--<table class="table-hover">
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="lnkView" Text="View" CommandArgument='<%# Eval("filename") %>' runat="server" OnClick="lnkView_Click"></asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lnkDelete" Text="Delete" CommandArgument='<%# Eval("filename") %>' runat="server" OnClick="lnkDelete_Click" />
                                        </td>
                                    </tr>
                                </table>--%>
                                <table class="nav-justified">
                                    <tr>
                                        <td style="width:520px"><asp:Image ID="fileimage" runat="server" ImageUrl="~/IMAGE/documents.png" Height="50px" Width="50px" /><br />
                                            <asp:Label ID="filelbl" runat="server" Text='<%# Eval("filename") %>'></asp:Label>
                                        </td>
                                        <td style="width:120px"><asp:LinkButton ID="lnkView" Text="View" CommandArgument='<%# Eval("filename") %>' runat="server" OnClick="lnkView_Click"></asp:LinkButton></td>
                                        <td style="width:120px"><asp:LinkButton ID="lnkDelete" Text="Delete" CommandArgument='<%# Eval("filename") %>' runat="server" OnClick="lnkDelete_Click" /></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="col-md-4">
                <div>
                    <asp:Literal ID="ltEmbed" runat="server" />
                    <asp:Label ID="Label1" runat="server" Text="Upload pdf File" Visible="False"></asp:Label>
                </div>
            </div>
        </div>
        <div id="myModal" class="mymodal">
            <div class="mymodal-content">
                <span class="myclose">x</span>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click"/>
                <hr />
            </div>
        </div>
    </form>
</body>
</html>
