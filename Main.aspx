<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainCopy" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" 
        meta:resourcekey="DataList1Resource1">
        <ItemTemplate>
            <div class="container">
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl='<%# "Article.aspx?aid=" + Eval("Id") %>' 
                    Text='<%# Eval("Title") %>' meta:resourcekey="HyperLink1Resource1"
                    Font-Bold="true" Font-Size="Larger"></asp:HyperLink>
                <asp:Label ID="Label1" runat="server" Text=" - " 
                    meta:resourcekey="Label1Resource1"></asp:Label>
                <asp:Label ID="SubtitleLabel" runat="server" Text='<%# Eval("Subtitle") %>' 
                    meta:resourcekey="SubtitleLabelResource1" 
                    Font-Italic="true" Font-Size="Larger" />
                <br />
                <br />
                <asp:Label ID="LeadLabel" runat="server" Text='<%# Eval("Lead") %>' 
                    meta:resourcekey="LeadLabelResource1" />
                <br />
                <br />
                <asp:Label ID="CreatedLabel" runat="server" Text='<%# Eval("Created") %>' 
                    meta:resourcekey="CreatedLabelResource1" />
                <br />
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="leftColumn" Runat="Server">
    <div class="sidebarcontainer">
        <asp:TextBox ID="SearchTextBox" runat="server" SkinID="searchBox" 
            meta:resourcekey="SearchTextBoxResource1"></asp:TextBox>
        <asp:Button ID="SearchButton" runat="server" SkinID="searchButton"
            onclick="SearchButton_Click" 
            Text="Search" meta:resourcekey="SearchButtonResource1" />
    </div>
    <div class="sidebarcontainer">
        <asp:Label ID="Label3" runat="server" Text="Time bounds:" 
            meta:resourcekey="Label3Resource1"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="From: " 
            meta:resourcekey="Label2Resource1"></asp:Label>
        <asp:TextBox ID="FromTextBox" runat="server" SkinID="filterBox" 
            meta:resourcekey="FromTextBoxResource1"></asp:TextBox>
        <cc1:CalendarExtender ID="FromTextBox_CalendarExtender" runat="server" 
            TargetControlID="FromTextBox" Enabled="True">
        </cc1:CalendarExtender>
        <br />
        <asp:Label ID="Label4" runat="server" Text="To: " 
            meta:resourcekey="Label4Resource1"></asp:Label>
        <asp:TextBox ID="ToTextBox" runat="server" SkinID="filterBox" 
            meta:resourcekey="ToTextBoxResource1"></asp:TextBox>
        <cc1:CalendarExtender ID="ToTextBox_CalendarExtender" runat="server" 
            TargetControlID="ToTextBox" Enabled="True">
        </cc1:CalendarExtender>
        <br />
        <asp:Button ID="FilterButton" runat="server" onclick="FilterButton_Click" 
            Text="Filter" meta:resourcekey="FilterButtonResource1" />
    </div>
</asp:Content>

