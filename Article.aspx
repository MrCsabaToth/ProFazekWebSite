<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Article.aspx.cs" Inherits="Article" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register src="ArticleDetailsControl.ascx" tagname="ArticleDetailsControl" tagprefix="uc1" %>

<%@ Register src="ArticlePicturesControl.ascx" tagname="ArticlePicturesControl" tagprefix="uc2" %>

<%@ Register src="ArticleCommentsControl.ascx" tagname="ArticleCommentsControl" tagprefix="uc3" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainCopy" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:WebPartManager ID="WebPartManager1" runat="server">
            </asp:WebPartManager>
            <asp:LoginView ID="LoginView1" runat="server">
                <LoggedInTemplate>
                    <div class="container">
                        <asp:DropDownList ID="DisplayModeDropDownList" runat="server" 
                            onselectedindexchanged="DisplayModeDropDownList_SelectedIndexChanged" 
                            AutoPostBack="True" meta:resourcekey="DisplayModeDropDownListResource1">
                        </asp:DropDownList>
                    </div>
                </LoggedInTemplate>
            </asp:LoginView>
            <asp:WebPartZone ID="WebPartZone1" runat="server" 
                meta:resourcekey="WebPartZone1Resource1">
                <ZoneTemplate>
                    <uc1:ArticleDetailsControl ID="ArticleDetailsControl1" runat="server" />
                    <uc2:ArticlePicturesControl ID="ArticlePicturesControl1" runat="server" />
                    <uc3:ArticleCommentsControl ID="ArticleCommentsControl1" runat="server" />
                </ZoneTemplate>
            </asp:WebPartZone>
            <asp:EditorZone ID="EditorZone1" runat="server" 
                meta:resourcekey="EditorZone1Resource1">
                <ZoneTemplate>
                    <asp:BehaviorEditorPart ID="BehaviorEditorPart1" runat="server" 
                        meta:resourcekey="BehaviorEditorPart1Resource1" />
                    <asp:LayoutEditorPart ID="LayoutEditorPart1" runat="server" 
                        meta:resourcekey="LayoutEditorPart1Resource1" />
                    <asp:PropertyGridEditorPart ID="PropertyGridEditorPart1" runat="server" 
                        meta:resourcekey="PropertyGridEditorPart1Resource1" />
                    <asp:AppearanceEditorPart ID="AppearanceEditorPart1" runat="server" 
                        meta:resourcekey="AppearanceEditorPart1Resource1" />
                </ZoneTemplate>
            </asp:EditorZone>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

