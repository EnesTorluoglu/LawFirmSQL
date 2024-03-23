<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manager.aspx.cs" Inherits="CSE355BYS.manager" MasterPageFile="~/template.Master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
     <br />
     <asp:Table ID="Table1" runat="server">
    </asp:Table>
    <br />
    <br />
     <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Get your lawyers" />
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Lawyer No"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Trial No"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Appoint lawyer to trial" />
    <br />
    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Return" />
</asp:Content>
