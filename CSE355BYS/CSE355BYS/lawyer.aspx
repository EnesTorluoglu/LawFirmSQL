<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lawyer.aspx.cs" Inherits="CSE355BYS.lawyer"  MasterPageFile="~/template.Master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
     <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Get your clients" />
    <br />
     <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Get unresolved case" />
    <br />
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="New client" />
    <br />
    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="New case" />
    <br />
    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="New trial" />
</asp:Content>
