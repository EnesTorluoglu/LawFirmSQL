<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getRecentTrial.aspx.cs" Inherits="CSE355BYS.getRecentTrial" MasterPageFile="~/template.Master"%>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:Label ID="Label1" runat="server" Text="Recent trial in that case"></asp:Label>
    <br />
    <br />
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Mark trial as solved" />
    <br />
    <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Return " />
    <br />
</asp:Content>