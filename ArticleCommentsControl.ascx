<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ArticleCommentsControl.ascx.cs" Inherits="ArticleCommentsControl" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:LoginView ID="CommentsLoginView" runat="server">
    <LoggedInTemplate>
        <div class="container">
            <asp:TextBox ID="CommentTextBox" runat="server" Height="116px" 
                TextMode="MultiLine" SkinID="centerBox" CausesValidation="True" 
                meta:resourcekey="CommentTextBoxResource1"></asp:TextBox>
            <br />
            <asp:Button ID="SubmitButton" runat="server" onclick="SubmitButton_Click" 
                Text="Submit" meta:resourcekey="SubmitButtonResource1" />
            <br />
            <asp:Panel ID="Panel2" runat="server" 
                style="display:none; background-color:Background" 
                meta:resourcekey="Panel2Resource1">
                <asp:Label ID="UserInfoLabel" runat="server" Text="User Info" 
                    meta:resourcekey="UserInfoLabelResource1" Width="100%"
                    Font-Bold="true" style="text-align:center"></asp:Label>
                <br />
                <table width="400">
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="User name: " 
                                meta:resourcekey="Label3Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="UNameLabel" runat="server" Text="user" 
                                meta:resourcekey="UNameLabelResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Signature: " 
                                meta:resourcekey="Label4Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="USignatureLabel" runat="server" Text="sig" 
                                meta:resourcekey="USignatureLabelResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Last active: " 
                                meta:resourcekey="Label5Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="UActiveLabel" runat="server" Text="date + time" 
                                meta:resourcekey="UActiveLabelResource1"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="CloseUserInfoButton" runat="server" Text="Close" 
                    meta:resourcekey="CloseUserInfoButtonResource1" />
            </asp:Panel>
            <cc1:ModalPopupExtender ID="Panel2_ModalPopupExtender" runat="server" 
                DynamicServicePath="" Enabled="True" TargetControlID="ShowUserButton" 
                PopupControlID="Panel2" DropShadow="True" 
                OkControlID="CloseUserInfoButton" PopupDragHandleControlID="UserInfoLabel">
            </cc1:ModalPopupExtender>
            <asp:Button ID="ShowUserButton" runat="server" Text="Show user info" 
                meta:resourcekey="ShowUserButtonResource1" />
        </div>
    </LoggedInTemplate>
</asp:LoginView>
<asp:DataList ID="CommentsDataList" runat="server" DataKeyField="Id" 
    meta:resourcekey="CommentsDataListResource1" Width="400px">
    <ItemTemplate>
        <div class="container">
            <asp:Label ID="BodyLabel" runat="server" SkinID="centerLabel" 
                Text='<%# Eval("Body") %>' 
                meta:resourcekey="BodyLabelResource1" />
            <br />
            <br />
            <asp:Label ID="SignatureLabel" runat="server" SkinID="centerLabel" 
                Text='<%# GetUserSignature( Eval( "UserId" ) ) %>' 
                meta:resourcekey="SignatureLabelResource2"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Created: " 
                meta:resourcekey="Label1Resource1"></asp:Label>
            <asp:Label ID="CreatedLabel" runat="server" 
                Text='<%# Eval("Created", "{0:g}") %>' 
                meta:resourcekey="CreatedLabelResource1" />
            <asp:Label ID="Label2" runat="server" Text=" by " 
                meta:resourcekey="Label2Resource1"></asp:Label>
            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                Text='<%# GetUserName( Eval( "UserId" ) ) %>' CausesValidation="False" 
                meta:resourcekey="LinkButton1Resource1"></asp:LinkButton>
        </div>
    </ItemTemplate>
</asp:DataList>
