<%@ Page Title="Search" Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search1.aspx.cs" Inherits="ClickPublish.Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <p>
    <br />
</p>
    <p>
         Your search result for:
</p>
        <asp:FormView ID="FormView1" runat="server" ViewStateMode="Disabled" DataSourceID="SqlDataSource1" EmptyDataText="Search Vote Count">
            <EditItemTemplate>
                First Name:
                <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
                <br />
                Last Name:
                <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
                <br />
                Vote Count:
                <asp:TextBox ID="countTextBox" runat="server" Text='<%# Bind("count") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                First Name:
                <asp:TextBox ID="fnameTextBox0" runat="server" Text='<%# Bind("fname") %>' />
                <br />
                Last Name:
                <asp:TextBox ID="lnameTextBox0" runat="server" Text='<%# Bind("lname") %>' />
                <br />
                count:
                <asp:TextBox ID="countTextBox0" runat="server" Text='<%# Bind("count") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                First Name:
                <asp:Label ID="fnameLabel" runat="server" Text='<%# Bind("fname") %>' />
                <br />
                Last Name:
                <asp:Label ID="lnameLabel" runat="server" Text='<%# Bind("lname") %>' />
                <br />
                Vote Count:
                <asp:Label ID="countLabel" runat="server" Text='<%# Bind("count") %>' />
                <br />

            </ItemTemplate>
        </asp:FormView>
        <p>
            &nbsp;</p>
<p>
    First Name
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</p>
<p>
    Last Name
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
</p>
    <p>
        &nbsp;<strong>Debug </strong>
        <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" />
</p>
    <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
</p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewDbConnectionString %>" SelectCommand="SELECT [fname], [lname], [count] FROM [Table] WHERE (([fname] = @fname) AND ([lname] = @lname))">
            <SelectParameters>
                <asp:QueryStringParameter Name="fname" QueryStringField="fname" Type="String" />
                <asp:QueryStringParameter Name="lname" QueryStringField="lname" Type="String" />
                
            </SelectParameters>
    </asp:SqlDataSource>
<p>
    

</p>
    <p>
   
    

</p>
<p>
</p>
<p>
</p>
<p>
</p>
</asp:Content>