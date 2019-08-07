<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="exemples.aspx.cs" Inherits="EarthRescue_webService.Exemples" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <script>
        //joueur
        function GetJoueur() {
            Service1.GetJoueur(3, onFound);
        }
        function ModifierJoueur() {
            Service1.ModifierJoueur(3, document.getElementById("pseudo").value, onFound);
        }                
        //munition
        function GetMunition() {
            Service1.GetMunition(1, onFound);
        }
        function ModifierMunition() {
            Service1.ModifierMunition(1, document.getElementById("munition").value, onFound);
        }        
        //resultat
        function onFound(result) {
            var myres = document.getElementById("resultat");
            myres.innerHTML = result;
        }        
    </script>
</head>

<body>
      <form id="form1" runat="server">          
        <%--joueur--%>
        <input type="button" value="Info joueur" onclick="GetJoueur()" />
        <input type="button" value="Modifier" onclick="ModifierJoueur()" />
        <input type="text" id="pseudo" value="" placeholder="Pseudo" />
        <br /><br />

        <%--munition--%>
        <input type="button" value="Info munition" onclick="GetMunition()" />
        <input type="button" value="Modifier" onclick="ModifierMunition()" />
        <input type="text" id="munition" value="" placeholder="Munition" />
        <br /><br />                 

        <span id="resultat"></span>

        <asp:scriptmanager ID="ScriptManager1" runat="server" >
            <Services>
                <asp:ServiceReference Path="~/Service1.svc"/>
            </Services>
        </asp:scriptmanager>

    </form>
</body>
</html>
