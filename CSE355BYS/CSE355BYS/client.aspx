<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="client.aspx.cs" Inherits="CSE355BYS.client" MasterPageFile="~/template.Master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="See your debt" />
    <br />
</asp:Content>