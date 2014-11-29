<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxInfoDemande.aspx.cs" Inherits="newBabyQuick.AjaxInfoDemande" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>test page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>Info sur la demande <span class="glyphicon glyphicon-pushpin"></span></h3>
        <div class="well">Demande addressée par <asp:TextBox runat="server" Enabled="false" ID="NomPrenom"></asp:TextBox></div>
        <div class="well">Nombre d'enfant à charge <asp:TextBox runat="server" Enabled="false" ID="nbEnfant"></asp:TextBox></div>
        <div class="well">Information supplémentaire : <asp:TextBox runat="server" TextMode="MultiLine" Enabled="false" ID="Note"></asp:TextBox></div>
       
    </div>
    </form>
</body>
</html>
