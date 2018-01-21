<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Diabetes.aspx.cs" Inherits="WebApplication1.UI.Diabetes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="../CSS/bootstrap.css" rel="stylesheet" />
        <style type="text/css">
        .vertical {
            font-size:large;
            color:limegreen;
        }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid">
             <div class="row">
                  <div class="col-sm-1" style="margin-top:35px">
                      <img src="../IMAGE/h.png" class="img-circle"/>
                  </div>
                  <div class="col-sm-6" style="margin-top:52px;">
                     <h3>E-Healthcare<br />Online Consltation and Medical Subscription</h3>
                  </div>
                  <div class="col-sm-5" style="margin-top:35px;">
                     
                  </div>
             </div>
         </div>
        <div class="container">
            <h1>These are the Symptoms of diabetis</h1>
            <ul>
                <li class="vertical">Black colored skin</li>
                <li class="vertical">Fatigue</li>
                <li class="vertical">Dizziness</li>
                <li class="vertical">Weight loss (unintentional)</li>
                <li class="vertical">Headache</li>
                <li class="vertical">Frequent infections</li>
                <li class="vertical">Weakness (generalized)</li>
            </ul>
            <h3 style="color:darkgreen">If maximum symptoms match to you than make appoinment with our recomended doctor</h3>
        </div>
    </form>
</body>
</html>
