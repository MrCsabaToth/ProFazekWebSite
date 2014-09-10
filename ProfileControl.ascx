<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProfileControl.ascx.cs" Inherits="ProfileControl" %>
<div class="container">
<!--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>-->
            <div id="contactForm">
                <fieldset style="width: 300px;">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Theme/skin: " 
                                    meta:resourcekey="Label1Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                                    meta:resourcekey="DropDownList1Resource1">
                                    <asp:ListItem Value="0" meta:resourcekey="ListItemResource1" Text="Grey" 
                                        Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="1" meta:resourcekey="ListItemResource2" Text="Green"></asp:ListItem>
                                    <asp:ListItem Value="2" meta:resourcekey="ListItemResource6" Text="Blue"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" 
                                    Text="Language: "></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                                    meta:resourcekey="DropDownList3Resource1" 
                                    onselectedindexchanged="DropDownList3_SelectedIndexChanged">
                                    <asp:ListItem meta:resourcekey="ListItemResource3" Text="hu-HU" Value="0"></asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource4" Text="Auto" Value="1"></asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource5" Text="en-US" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Signature: " 
                                    meta:resourcekey="Label2Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" 
                                    ontextchanged="TextBox1_TextChanged" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
<!--        </ContentTemplate>
    </asp:UpdatePanel>-->
</div>
