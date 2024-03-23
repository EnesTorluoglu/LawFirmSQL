<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lawyerlogin.aspx.cs" Inherits="CSE355BYS._lawyerlogin" MasterPageFile="~/template.Master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <p>
        &nbsp;</p>
    <p>
        SSN&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </p>
    <p>
        ManagerNo&nbsp;
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Log In" style="height: 26px" />
    </p>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Log In As Manager" style="height: 26px" />
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

