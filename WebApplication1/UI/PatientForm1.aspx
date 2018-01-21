<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientForm1.aspx.cs" Inherits="WebApplication1.UI.PatientForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Patient Log In Form</title>
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

        function popup1() {
            var modal = document.getElementById('myModal1');
            modal.style.display = "block";

        }
    </script>
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
                          <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='Home.aspx'">Home</button>

                      </div>
                  </div>
                </div>
             </div>
        <div class="container" style="margin-top:35px; background-color:#f0f5f5">
            <center><h3>Please Enter Your Informatin</h3></center>

            <table class="table table-striped">
                <tr>
                    <td>Name :</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" MaxLength="20"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" Display="Dynamic"
                            ForeColor="Red" ErrorMessage="First name is required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td>User Name :</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" MaxLength="20"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" Display="Dynamic"
                            ForeColor="Red" ErrorMessage="User name is required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>Password :</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Type="Password" MaxLength="20"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" Display="Dynamic"
                            ForeColor="Red" ErrorMessage="Password is required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Confirm Password :</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" Type="Password" MaxLength="20"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4" Display="Dynamic"
                            ForeColor="Red" ErrorMessage="Rewrite your password" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox3" ControlToValidate="TextBox4" Display="Dynamic"
                            ForeColor="Red" ErrorMessage="Password is not match" SetFocusOnError="true"></asp:CompareValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Gender :</td>
                    <td>
                        &nbsp;
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="checkbox-inline">
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                        </asp:RadioButtonList>
                    &nbsp;</td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="RadioButtonList1" Display="Dynamic"
                            SetFocusOnError="true" ForeColor="Red" ErrorMessage="Select your gender"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Current Address :</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" MaxLength="50"></asp:TextBox>
                    </td>
                
					<td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox5" Display="Dynamic"
                            SetFocusOnError="true" ForeColor="Red" ErrorMessage="Address is required"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Email Address :</td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server" MaxLength="50"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox6" Display="Dynamic"
                            SetFocusOnError="true" ForeColor="Red" ErrorMessage="Email is required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="Please write valid Email"
                            SetFocusOnError="true" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Mobile number :</td>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server" MaxLength="20"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox7" Display="Dynamic"
                            ForeColor="Red" SetFocusOnError="true" ErrorMessage="Mobile number is required"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Date of Birth:
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server" TextMode="Date" MaxLength="20" Width="176px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox8" Display="Dynamic"
                            ForeColor="Red" SetFocusOnError="true" ErrorMessage="Birthday is require"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>

                        <asp:Button ID="Button1" runat="server" CssClass="btrn btn-success btn-lg" OnClick="Button1_Click" Text="Submit" />
                    </td>
                    <td>
                        <input id="Reset1" type="reset" class="btn btn-warning btn-lg" value="reset" />
                    </td>
                    <td>

                        <asp:Button ID="Nextbtn" runat="server" CssClass="btn btn-link btn-lg" Text="Next" OnClick="Nextbtn_Click" />

                    </td>
                </tr>
            </table>
        </div>
        <div id="myModal" class="mymodal">
           <div class="mymodal-content" style="border-color:red;">
              <div class="col-sm-4" style="margin-top:30px">
                  <img alt="alert!" src="../IMAGE/alertimg.png" class="img-responsive" />
              </div>
               <div class="col-sm-6" style="margin-top:75px">
                   <h5>Username already exists!</h5>
               </div>
               <div class="col-sm-2">
                   <span class="myclose">x</span>
               </div>
           </div>
       </div>
        <div id="myModal1" class="mymodal">
           <div class="mymodal-content" style="border-color:green;">
              <div class="col-sm-4" style="margin-top:30px">
                  <img alt="alert!" src="../IMAGE/ok.png" class="img-responsive" />
              </div>
               <div class="col-sm-5" style="margin-top:75px">
                   <h5>Data successfuly saved</h5>
               </div>
               <div class="col-sm-3" style="margin-top:140px;">
                   <asp:Button ID="Okbtn" runat="server" CssClass="btn btn-success btn-lg" Text="Done"  OnClick="Okbtn_Click"/>
               </div>
           </div>
     </div>

    </form>
</body>
</html>
