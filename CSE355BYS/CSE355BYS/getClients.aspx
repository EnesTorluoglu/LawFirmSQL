<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getClients.aspx.cs" Inherits="CSE355BYS.getClients" MasterPageFile="~/template.Master"%>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Table ID="Table1" runat="server">
    </asp:Table>
    <br />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Get Clients In Debt " />
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Return " />
&nbsp;&nbsp;
    <br />
</asp:Content>

