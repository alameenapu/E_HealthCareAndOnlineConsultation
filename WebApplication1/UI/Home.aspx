<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.UI.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../CSS/bootstrap.css" rel="stylesheet" />
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
 
</head>
<body>
    <form id="form1" runat="server" class="form-horizontal">
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
                            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='http://www.ebanglahealth.com';">Helth Tips</button>
                            <asp:Button ID="ClinicSBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="Find Clinic" OnClick="ClinicSBtn_Click"></asp:Button>
                            <button type="button" class="btn btn-primary btn-sm">View Review</button>
                            <button type="button" class="btn btn-primary btn-sm">E-Pharma</button>
                            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='administrator.aspx';">Admin</button>
                      </div>
                  </div>
             </div>
         </div>
         <div class="container" style="background-color: #f0f5f5;margin-top:35px;">
            <div class="row">
                 <h1 class="font"><center>Find Doctors|Find Dentists</center></h1>
            </div>
             <div class="row">
                 <div class="col-sm-4" style="margin-top:55px">
                        Speciality
                     <asp:DropDownList ID="SpecialityDropList" runat="server"  Width="220px" BackColor=" #e6f0ff" ForeColor="#7d6754" Font-Names="Andalus" CssClass="ddl" AutoPostBack="true" OnSelectedIndexChanged="SpecialityDropList_SelectedIndexChanged"></asp:DropDownList>
                   
                 </div>
                 <div class="col-sm-4" style="margin-top:55px">
                       Treatment
                     <asp:DropDownList ID="TreatmentDropLis" runat="server" Width="220px" BackColor=" #e6f0ff" ForeColor="#7d6754" Font-Names="Andalus" CssClass="ddl"></asp:DropDownList>
                 </div>
                 <div class="col-sm-4" style="margin-top:55px">
                      Location
                     <asp:DropDownList ID="LocationDropList" runat="server" AutoPostBack="true"  Width="220px" BackColor=" #e6f0ff" ForeColor="#7d6754" Font-Names="Andalus" CssClass="ddl" ></asp:DropDownList>
                 </div>
             </div>
             <div class="row" style="margin-top:35px;">
                 
                 <center><asp:Button ID="SearchButton1" Width="120px" CssClass="btn btn-info" runat="server" text="Search" OnClick="SearchButton1_Click1"/></center>
             </div>
             <div style="width:100%; height:55px;"></div>
      </div>


   <div class="container-fluid" style="margin-top:35px;">
       <div class="col-sm-5">
       <h2>Doctors Log In</h2>
    <div class="form-group">
                <label class="control-label col-sm-2" for="email">Username:</label>
     <div class="col-sm-10">
                <asp:TextBox ID="HDrUsernameTextBox" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
     
         </div>
     </div>

  <div class="form-group">
             <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-10"> 
              <asp:TextBox ID="HDrPasswordTextBox" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
      </div>
  </div>
  <div class="form-group"> 
       <div class="col-sm-offset-2 col-sm-10">
            <div class="checkbox">
                 <label><input type="checkbox"> Remember me</label>
            </div>
       </div>
      <div class="col-sm-offset-2 col-sm-10" style ="margin-top:10px">
          <a href="DrInfoUI.aspx">Forgot Password</a> 
      </div>
      <div class="col-sm-offset-2 col-sm-10" style ="margin-top:10px">
          <a href="DrInfoUI.aspx">Create New Account</a> 
      </div>
   </div>
      <div class="form-group"> 
          <div class="col-sm-offset-2 col-sm-10">
               <asp:button ID="Drsubmit" runat="server" Cssclass="btn btn-default" Text="Submit" OnClick="Drsubmit_Click"></asp:button>
          </div>
       </div>
           </div>
       <div class="col-sm-2">

       </div>
       <div class="col-sm-5">
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
                   <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
               </div>
           </div>
           <div class="form-group">
               <div class="col-sm-offset-2 col-sm-10">
                   <div class="checkbox">
                       <label>
                           <input type="checkbox">
                           Remember me</label>
                   </div>
               </div>
               <div class="col-sm-offset-2 col-sm-10" style="margin-top: 10px">
                   <a href="PatientForm1.aspx">Forgot Password</a>
               </div>
               <div class="col-sm-offset-2 col-sm-10" style="margin-top: 10px">
                   <a href="PatientForm1.aspx">Create New Account</a>
               </div>
           </div>
           <div class="form-group">
               <div class="col-sm-offset-2 col-sm-10">
                   <asp:Button ID="PaLogIn" runat="server" class="btn btn-default" Text="Submit" OnClick="PaLogIn_Click" />
               </div>
           </div>
       </div>
    </div>
    </form>
</body>
</html>
