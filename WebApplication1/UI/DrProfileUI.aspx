<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DrProfileUI.aspx.cs" Inherits="WebApplication1.UI.DrProfileUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../CSS/bootstrap.css" rel="stylesheet" />
    <link href="../CSS/grid.css" rel="stylesheet" />
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
                          <asp:Label ID="DrProLabel" runat="server" Visible="false" CssClass="btn btn-primary btn-sm"></asp:Label>
                          <asp:Button ID="DrProLogOutButton" runat="server" CssClass="btn btn-primary btn-sm" Text="Log Out!" OnClick="DrProLogOutButton_Click" />
                          <button type="button" class="btn btn-primary btn-sm">Setting</button>

                      </div>
                  </div>
             </div>
         </div>
        <div class="container-fluid" style="margin-top:25px">
            <div class="row">
                <div class="col-sm-3" style="background-color:#ebebe0; height:580px">
                    <asp:Image ID="DrProImg" runat="server" CssClass="img-circle" Width="120px" Height="130px" /><br />
                    <br />
                    <asp:Button ID="DrProDocumentButton" runat="server" CssClass="btn-default" Text="Document" Width="200px" OnClick="DrProDocumentButton_Click" /><br />
                    <asp:Button ID="DrProPaScheduleButton" runat="server" CssClass="btn-default" Text="Patient Schedule" Width="200px" OnClick="DrProPaScheduleButton_Click"/><br />
                    <asp:Button ID="DrProPaListButton" runat="server" CssClass="btn-default" Text="Patient List" Width="200px" OnClick="DrProPaListButton_Click" />
                </div>
                <div class="col-sm-1"></div>
                <div class="col-sm-4" style="background-color:#ebebe0; height:580px">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                         <ContentTemplate>
                             <asp:Timer ID="DrProTimer" runat="server" Interval="7000"  OnTick="DrProTimer_Tick"></asp:Timer>
                             <asp:Label ID="timaerlbl" runat="server"></asp:Label>
                             <asp:DataList ID="DataList1" runat="server"  OnItemCommand="DataList1_ItemCommand">
                                 <HeaderTemplate>
                                     <table class="table table-striped table-bordered table-hover">
                                         <tr>
                                             <td style="width:40px">Patient ID</td>
                                             <td style="width:120px">Patient Name</td>
                                             <td style="width:100px">Date</td>
                                             <td style="width:100px">Time</td>
                                             <td style="width:90px">Check</td>
                                             <td style="width:30px">Click</td>
                                         </tr>
                                     </table>
                                 </HeaderTemplate>
                                 <ItemTemplate>
                                     <table class="table table-striped table-bordered table-hover">
                                         <tr>
                                             <td style="width:80px">
                                                 <asp:Label ID="Label1"  runat="server" Text='<%# Eval("PaId") %>'></asp:Label>
                                             </td>
                                             <td style="width:120px">
                                                 <asp:Label ID="Label2"  runat="server" Text='<%# Eval("PaName") %>'></asp:Label></td>
                                             <td style="width:100px">
                                                 <asp:Label ID="Label3" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                                             </td>
                                             <td style="width:100px"><asp:Label ID="Label4" runat="server" Text='<%# Eval("Time") %>'></asp:Label></td>
                                             <td style="width:90px">
                                                 <asp:LinkButton ID="LinkButton1" runat="server" CommandName="PaList" CommandArgument='<%# Eval("PaId") %>'>Select</asp:LinkButton>
                                             </td>
                                             <td style="width:30px">
                                                 <asp:CheckBox ID="CheckBox1" runat="server" />
                                             </td>
                                         </tr>
                                     </table>
                                 </ItemTemplate>
                             </asp:DataList>    
                         </ContentTemplate>
                         <Triggers>
                             <asp:AsyncPostBackTrigger ControlID="DrProPaScheduleButton" EventName="Click" />
                             <%--<asp:AsyncPostBackTrigger ControlID="LinkButton1" EventName="Click" /> --%>
                         </Triggers>
                     </asp:UpdatePanel>
                </div>
                <%--<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllPatients" TypeName="WebApplication1.DAL.PatientList" UpdateMethod="AddPatient">
                    <UpdateParameters>
                        <asp:Parameter Name="PaId" Type="String" />
                        <asp:Parameter Name="PaName" Type="String" />
                    </UpdateParameters>
                </asp:ObjectDataSource>--%>
                <div class="col-sm-1"></div>
                <div class="col-sm-3" style="background-color:#ebebe0; height:580px">
                     <asp:DataList ID="DataList2" runat="server" OnItemCommand="DataList2_ItemCommand">
                         
                         <HeaderTemplate>
                              <div class="table-responsive">
                             <table class="table table-bordered">
                                 <tr>
                                     <td style="width:120px">Patient ID</td>
                                     <td>Patient Name</td>
                                 </tr>
                             </table>
                                  </div>
                         </HeaderTemplate>
                         <ItemTemplate>
                             <div class="table-responsive">
                                 <table class="table table-bordered">
                                     <tr>
                                         <td style="width:120px">
                                             <asp:Label ID="Label5" runat="server" Text='<%# Eval("PaId") %>'></asp:Label>
                                         </td>
                                         <td>
                                             
                                             <asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Eval("PaName") %>' CommandName="Paname" CommandArgument='<%# Eval("PaId") %>'></asp:LinkButton>
                                             
                                         </td>
                                     </tr>
                                 </table>
                            </div>
                         </ItemTemplate>
                      
                     </asp:DataList>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
