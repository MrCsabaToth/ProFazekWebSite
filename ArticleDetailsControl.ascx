<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ArticleDetailsControl.ascx.cs" Inherits="ArticleDetailsControl" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc2" %>

<div class="container">
    <asp:FormView ID="ArticleFormView" runat="server" DataKeyNames="Id" 
        DataSourceID="LinqDataSource1" 
        oniteminserting="ArticleFormView_ItemInserting" 
        meta:resourcekey="ArticleFormViewResource1">
        <EditItemTemplate>
            <asp:Label ID="Label2" runat="server" Text="Title:" 
                meta:resourcekey="Label2Resource1"></asp:Label>
            <br />
            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' 
                SkinID="centerBox" meta:resourcekey="TitleTextBoxResource1" />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Subtitle:" 
                meta:resourcekey="Label3Resource1"></asp:Label>
            <br />           
            <asp:TextBox ID="SubtitleTextBox" runat="server" 
                Text='<%# Bind("Subtitle") %>' Height="25px" 
                SkinID="centerBox" meta:resourcekey="SubtitleTextBoxResource1" />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Lead:" 
                meta:resourcekey="Label4Resource1"></asp:Label>
            <br />
            <asp:TextBox ID="LeadTextBox" runat="server" Text='<%# Bind("Lead") %>' 
                Height="124px" SkinID="centerBox" meta:resourcekey="LeadTextBoxResource1" />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Body:" 
                meta:resourcekey="Label5Resource1"></asp:Label>
            <br />
            <cc2:Editor ID="Editor1" runat="server" Content='<%# Bind("Body") %>' 
                Height="280px" Width="400px" meta:resourcekey="Editor1Resource1" />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Tags:" 
                meta:resourcekey="Label6Resource1"></asp:Label>
            <br />
            <asp:TextBox ID="TagsTextBox" runat="server" Text='<%# Bind("Tags") %>' 
                SkinID="centerBox" meta:resourcekey="TagsTextBoxResource1" />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" 
                CommandName="Update" Text="Update" 
                meta:resourcekey="UpdateButtonResource1" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" 
                meta:resourcekey="UpdateCancelButtonResource1" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <asp:Label ID="Label7" runat="server" Text="Title:" 
                meta:resourcekey="Label7Resource1"></asp:Label>
            <br />
            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' 
                SkinID="centerBox" meta:resourcekey="TitleTextBoxResource2" />
            <br />
            <asp:Label ID="Label8" runat="server" Text="Subtitle:" 
                meta:resourcekey="Label8Resource1"></asp:Label>
            <br />
            <asp:TextBox ID="SubtitleTextBox" runat="server" 
                Text='<%# Bind("Subtitle") %>' Height="25px" SkinID="centerBox" 
                meta:resourcekey="SubtitleTextBoxResource2" />
            <br />
            <asp:Label ID="Label9" runat="server" Text="Lead:" 
                meta:resourcekey="Label9Resource1"></asp:Label>
            <br />
            <asp:TextBox ID="LeadTextBox" runat="server" Text='<%# Bind("Lead") %>' 
                Height="124px" SkinID="centerBox" meta:resourcekey="LeadTextBoxResource2" />
            <br />
            <asp:Label ID="Label10" runat="server" Text="Body:" 
                meta:resourcekey="Label10Resource1"></asp:Label>
            <br />
            <cc2:Editor ID="Editor1" runat="server" Content='<%# Bind("Body") %>' 
                Height="600px" Width="400px" meta:resourcekey="Editor1Resource2" />
            <br />
            <asp:Label ID="Label11" runat="server" Text="Tags:" 
                meta:resourcekey="Label11Resource1"></asp:Label>
            <br />            
            <asp:TextBox ID="TagsTextBox" runat="server" Text='<%# Bind("Tags") %>' 
                SkinID="centerBox" meta:resourcekey="TagsTextBoxResource2" />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" 
                CommandName="Insert" Text="Insert" 
                meta:resourcekey="InsertButtonResource1" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" 
                meta:resourcekey="InsertCancelButtonResource1" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' 
                SkinID="centerLabel" Font-Bold="true" Font-Size="Large"
                meta:resourcekey="TitleLabelResource1" />
            <br />
            <br />
            <asp:Label ID="SubtitleLabel" runat="server" Text='<%# Bind("Subtitle") %>' 
                SkinID="centerLabel" Font-Italic="true" Font-Size="Larger"
                meta:resourcekey="SubtitleLabelResource1" />
            <br />
            <br />
            <asp:Label ID="BodyLabel" runat="server" Text='<%# Bind("Body") %>' 
                SkinID="centerLabel" meta:resourcekey="BodyLabelResource1" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Created: " 
                meta:resourcekey="Label1Resource1"></asp:Label>
            <asp:Label ID="CreatedLabel" runat="server" Text='<%# Bind("Created") %>' 
                meta:resourcekey="CreatedLabelResource1" />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" meta:resourcekey="EditButtonResource1" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" 
                meta:resourcekey="DeleteButtonResource1" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" meta:resourcekey="NewButtonResource1" />
        </ItemTemplate>
    </asp:FormView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="DataClassesDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" TableName="Articles" Where="Id == @Id">
        <WhereParameters>
            <asp:QueryStringParameter DefaultValue="2" Name="Id" QueryStringField="aid" 
                Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
</div>
