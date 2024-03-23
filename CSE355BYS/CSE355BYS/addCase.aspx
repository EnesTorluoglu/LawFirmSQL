<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addCase.aspx.cs" Inherits="CSE355BYS.addCase" MasterPageFile="~/template.Master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:Label ID="Label1" runat="server" Text="Enter case infos:"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Case No"></asp:Label>
    <asp:TextBox ID="TextBoxCaseNo" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Case Type"></asp:Label>
    <asp:TextBox ID="TextBoxCaseType" runat="server"></asp:TextBox>
    <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" />
    <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Return" />
    <br />
</asp:Content>
