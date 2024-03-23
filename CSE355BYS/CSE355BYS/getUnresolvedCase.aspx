<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getUnresolvedCase.aspx.cs" Inherits="CSE355BYS.getUnresolvedCase" MasterPageFile="~/template.Master"%>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
        <asp:Table ID="Table1" runat="server">
        </asp:Table>
    <br />
    <br />
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Go to most recent trial" />
    <br />
    <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Return " />
    <br />
</asp:Content>