<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addTrial.aspx.cs" Inherits="CSE355BYS.addTrial" MasterPageFile="~/template.Master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:Label ID="Label1" runat="server" Text="Enter trial infos:"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Trial No"></asp:Label>
    <asp:TextBox ID="TextBoxTrialNo" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Trial Date"></asp:Label>
    <asp:TextBox ID="TextBoxTrialDate" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Case"></asp:Label>
    <asp:TextBox ID="TextBoxCase" runat="server"></asp:TextBox>
    <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" />
    <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Return" />
    <br />
</asp:Content>

