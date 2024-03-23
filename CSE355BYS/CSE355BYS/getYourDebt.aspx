<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getYourDebt.aspx.cs" Inherits="CSE355BYS.getYourDebt" MasterPageFile="~/template.Master"%>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Pay your debt" />
    <br />
    <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Return " />
    <br />
</asp:Content>
