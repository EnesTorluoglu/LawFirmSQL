<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addClient.aspx.cs" Inherits="CSE355BYS.addClient" MasterPageFile="~/template.Master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:Label ID="Label1" runat="server" Text="Enter trial infos:"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Customer No"></asp:Label>
    <asp:TextBox ID="TextBoxCusNo" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Type(0 for person, 1 for company)"></asp:Label>
    <asp:TextBox ID="TextBoxType" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label4" runat="server" Text="SSN"></asp:Label>
    <asp:TextBox ID="TextBoxSSN" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label5" runat="server" Text="First name"></asp:Label>
    <asp:TextBox ID="TextBoxFirst" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label6" runat="server" Text="Surname"></asp:Label>
    <asp:TextBox ID="TextBoxSur" runat="server"></asp:TextBox>
    <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" />
    <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Return" />
    <br />
</asp:Content>
