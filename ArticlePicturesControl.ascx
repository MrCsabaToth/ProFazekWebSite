<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ArticlePicturesControl.ascx.cs" Inherits="ArticlePicturesControl" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<div class="container">
    <asp:Panel ID="SlideShowModalPanel" runat="server" 
        style="display:none; background-color:Background" 
        meta:resourcekey="SlideShowModalPanelResource1">
        <asp:Label ID="PicturesLabel" runat="server" Text="Pictures" 
            meta:resourcekey="PicturesLabelResource1" Width="100%" 
            Font-Bold="true" style="text-align:center"></asp:Label>
        <br />
        <br />
        <asp:Button ID="PrevButton" runat="server" Text="Prev" 
            meta:resourcekey="PrevButtonResource1" />
        <asp:Button ID="PlayButton" runat="server" Text="Play" 
            meta:resourcekey="PlayButtonResource1" />
        <asp:Button ID="NextButton" runat="server" Text="Next" 
            meta:resourcekey="NextButtonResource1" />
        <asp:Button ID="CloseSlideShowButton" runat="server" Text="Close" 
            meta:resourcekey="CloseSlideShowButtonResource1" />
        <br />
        <br />
        <asp:Label ID="ImageTitleLabel" runat="server" Text="ImageTitleLabel" 
            meta:resourcekey="ImageTitleLabelResource1" Width="100%" 
            Font-Bold="true" style="text-align:center"></asp:Label>
        <br />
        <br />
        <asp:Image ID="Image1" runat="server" 
            ImageUrl="sqlimage.axd?name=pic&picId=3" 
            meta:resourcekey="Image1Resource1" />
        <cc1:SlideShowExtender ID="Image1_SlideShowExtender" runat="server" 
            AutoPlay="True" ContextKey="2" Enabled="True" 
            ImageDescriptionLabelID="ImageDescriptionLabel" 
            ImageTitleLabelID="ImageTitleLabel" NextButtonID="NextButton" 
            PlayButtonID="PlayButton" PlayButtonText="Play" PreviousButtonID="PrevButton" 
            SlideShowServiceMethod="GetSlides" SlideShowServicePath="SlideShowService.asmx" 
            StopButtonText="Stop" TargetControlID="Image1" UseContextKey="True" 
            Loop="True" PlayInterval="2000">
        </cc1:SlideShowExtender>
    </asp:Panel>
    <asp:ImageButton ID="SlideShowButton" runat="server" 
        AlternateText="Show the picture gallery"
        meta:resourcekey="SlideShowButtonResource2"
        ImageUrl="tacepao.axd?name=tcpo&Text=Slideshow"/>
    <cc1:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" 
        Enabled="True" 
        OkControlID="CloseSlideShowButton" PopupControlID="SlideShowModalPanel" 
        TargetControlID="SlideShowButton"
        PopupDragHandleControlID="PicturesLabel" DynamicServicePath="">
    </cc1:ModalPopupExtender>
    <asp:ListView ID="PicturesListView" runat="server" GroupItemCount="2">
        <EmptyItemTemplate>
        </EmptyItemTemplate>
        <ItemTemplate>
            <td id="Td1" runat="server">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    AlternateText='<%# Eval("Title") %>' 
                    ImageUrl='<%# "sqlimage.axd?name=thumbnail&picId=" + Eval("Id") %>' 
                    onclick="ImageButton1_Click" CausesValidation="False" 
                    meta:resourcekey="ImageButton1Resource1"/>
                <br />
                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' 
                    meta:resourcekey="TitleLabelResource2" />
            </td>
        </ItemTemplate>
        <EmptyDataTemplate>
        </EmptyDataTemplate>
        <InsertItemTemplate>
        </InsertItemTemplate>
        <LayoutTemplate>
            <table id="Table1" runat="server" width="400">
                <tr id="Tr1" runat="server" width="400">
                    <td id="Td2" runat="server">
                        <table ID="groupPlaceholderContainer" runat="server" border="0">
                            <tr ID="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <EditItemTemplate>
        </EditItemTemplate>
        <GroupTemplate>
            <tr ID="itemPlaceholderContainer" runat="server">
                <td ID="itemPlaceholder" runat="server">
                </td>
            </tr>
        </GroupTemplate>
        <SelectedItemTemplate>
        </SelectedItemTemplate>
    </asp:ListView>
</div>
