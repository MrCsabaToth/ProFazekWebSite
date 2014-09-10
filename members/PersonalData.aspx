<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PersonalData.aspx.cs" Inherits="members_PersonalData" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register src="../ProfileControl.ascx" tagname="ProfileControl" tagprefix="uc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainCopy" Runat="Server">
    <uc1:ProfileControl ID="ProfileControl1" runat="server" />
</asp:Content>

