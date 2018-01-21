<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckPatient.aspx.cs" Inherits="WebApplication1.UI.CheckPatient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../CSS/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 133px;
        }
        .auto-style2 {
            width: 111px;
        }
        .auto-style3 {
            width: 79px;
        }
    </style>
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
                            <asp:Label ID="DrProLabel" runat="server" Visible="false" CssClass="btn btn-primary btn-sm"></asp:Label>
                          <asp:Button ID="DrProLogOutButton" runat="server" CssClass="btn btn-primary btn-sm" Text="Log Out!" OnClick="DrProLogOutButton_Click" />
                          <button type="button" class="btn btn-primary btn-sm">Setting</button>
                      </div>
                  </div>
             </div>
         </div>
        <div class="container-fluid" style="margin-top:90px">
            <div class="row">
                <div class="col-md-4">
                    <fieldset>
                        <legend>Patient Information</legend>
                        <asp:DataList ID="DrPaDataList" runat="server">
                            <ItemTemplate>
                                <div class="table-responsive">
                                    <table class="table-hover">
                                        <tr>
                                            <td class="auto-style3">
                                                <h4 style="color:grey">Name:</h4></td>                                            
                                            <td class="auto-style2">
                                                <asp:Label ID="lbl1" runat="server" Font-Names="Georgia Italic" Font-Size="Medium" Text='<%# Eval("PaName") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style3">
                                                <h4 style="color:grey">Gender:</h4>
                                            </td>
                                            <td class="auto-style2">
                                                <asp:Label ID="lbl2" runat="server" Font-Names="Times New Roman" Font-Size="Medium" Text='<%# Eval("PaGender") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style3">
                                                <h4 style="color:grey">Age:</h4>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl3" runat="server" Font-Names="Times New Roman" Font-Size="Medium" Text='<%# Eval("PaAge") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style3">
                                                <h4 style="color:grey">Mobile:</h4>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl4" runat="server" Font-Names="Times New Roman" Font-Size="Medium" Text='<%# Eval("PaMobile") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style3">
                                                <h4 style="color:grey">E-Mail:</h4></td>
                                            <td>
                                                <asp:Label ID="lbl5" runat="server" Font-Names="Times New Roman" Font-Size="Medium" Text='<%# Eval("PaEmail") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </fieldset>
                </div>
                <div class="col-md-3">
                    <fieldset>
                        <legend>Patient Image</legend>
                        <asp:Image ID="PaImage" runat="server" CssClass="img-thumbnail" Height="120px" Width="80px" />
                    </fieldset>
                </div>
                <div class="col-md-4">
                    <asp:GridView CssClass="table" ID="Gridview1" runat="server" AutoGenerateColumns="false" EmptyDataText="No files uploaded">
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
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("filename") %>'></asp:Label>
                                            
                                           
                                        </td>
                                        <td style="width:120px"><asp:LinkButton ID="lnkView" Text="View" CommandArgument='<%# Eval("filename") %>' runat="server" OnClick="lnkView_Click"></asp:LinkButton></td>
                                        
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div>
                        <asp:Literal ID="ltEmbed" runat="server" />
                        <asp:Label ID="Label1" runat="server" Text="Upload pdf File" Visible="False"></asp:Label>
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </form>
</body>
</html>
