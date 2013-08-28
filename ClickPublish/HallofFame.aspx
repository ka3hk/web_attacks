<%@ Page Title="Hall of Fame" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HallofFame.aspx.cs" Inherits="ClickPublish.About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %></h1>
    </hgroup>
<br />
<br />
<br />
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableSortingAndPagingCallbacks="True">
    <Columns>
        <asp:BoundField DataField="fname" HeaderText="First Name" SortExpression="fname" />
        <asp:BoundField DataField="lname" HeaderText="Last Name" SortExpression="lname" />
        <asp:BoundField DataField="count" HeaderText="Vote Count" SortExpression="count" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewDbConnectionString %>" SelectCommand="SELECT [fname], [lname], [count] FROM [Table] ORDER BY [count] DESC"></asp:SqlDataSource>
<br />
<br />
<br />
<br />
<br />
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="FeaturedContent">
    </asp:Content>
