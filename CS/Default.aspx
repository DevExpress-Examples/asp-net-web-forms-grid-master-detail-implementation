<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<dx:ASPxGridView ID="masterGrid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCustomers" KeyFieldName="CustomerID"
				OnRowDeleting="Grid_RowDeleting" OnRowInserting="Grid_RowInserting"	OnRowUpdating="Grid_RowUpdating">
				<Columns>
					<dx:GridViewCommandColumn ShowNewButton="true" ShowEditButton="true" ShowDeleteButton="true" VisibleIndex="0">
					</dx:GridViewCommandColumn>
					<dx:GridViewDataTextColumn FieldName="CustomerID" ReadOnly="True" VisibleIndex="1">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="2">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="ContactName" VisibleIndex="3">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="Country" VisibleIndex="4">
					</dx:GridViewDataTextColumn>
				</Columns>
				<Templates>
					<DetailRow>
						<dx:ASPxGridView ID="detailGrid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceOrders"
							KeyFieldName="OrderID" OnBeforePerformDataSelect="detailGrid_BeforePerformDataSelect"
							OnRowDeleting="Grid_RowDeleting" OnRowInserting="Grid_RowInserting" OnRowUpdating="Grid_RowUpdating">
							<Columns>
								<dx:GridViewCommandColumn ShowNewButton="true" ShowEditButton="true" ShowDeleteButton="true" VisibleIndex="0">
								</dx:GridViewCommandColumn>
								<dx:GridViewDataTextColumn FieldName="OrderID" ReadOnly="True" VisibleIndex="1">
									<EditFormSettings Visible="False" />
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn FieldName="CustomerID" VisibleIndex="2">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataDateColumn FieldName="OrderDate" VisibleIndex="3">
								</dx:GridViewDataDateColumn>
								<dx:GridViewDataTextColumn FieldName="ShipName" VisibleIndex="4">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn FieldName="Freight" VisibleIndex="5">
								</dx:GridViewDataTextColumn>
							</Columns>
						</dx:ASPxGridView>
					</DetailRow>
				</Templates>
				<SettingsDetail ShowDetailRow="True" />
			</dx:ASPxGridView>
			<asp:AccessDataSource ID="SqlDataSourceCustomers" runat="server" DataFile="~/App_Data/nwind.mdb"
				DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = ?" InsertCommand="INSERT INTO [Customers] ([CustomerID], [CompanyName], [ContactName], [Country]) VALUES (?, ?, ?, ?)"
				SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Country] FROM [Customers]"
				UpdateCommand="UPDATE [Customers] SET [CompanyName] = ?, [ContactName] = ?, [Country] = ? WHERE [CustomerID] = ?">
				<DeleteParameters>
					<asp:Parameter Name="CustomerID" Type="String" />
				</DeleteParameters>
				<UpdateParameters>
					<asp:Parameter Name="CompanyName" Type="String" />
					<asp:Parameter Name="ContactName" Type="String" />
					<asp:Parameter Name="Country" Type="String" />
					<asp:Parameter Name="CustomerID" Type="String" />
				</UpdateParameters>
				<InsertParameters>
					<asp:Parameter Name="CustomerID" Type="String" />
					<asp:Parameter Name="CompanyName" Type="String" />
					<asp:Parameter Name="ContactName" Type="String" />
					<asp:Parameter Name="Country" Type="String" />
				</InsertParameters>
			</asp:AccessDataSource>
			<asp:AccessDataSource ID="SqlDataSourceOrders" runat="server" DataFile="~/App_Data/nwind.mdb"
				DeleteCommand="DELETE FROM [Orders] WHERE [OrderID] = ?" InsertCommand="INSERT INTO [Orders] ([OrderID], [CustomerID], [OrderDate], [ShipName], [Freight]) VALUES (?, ?, ?, ?, ?)"
				SelectCommand="SELECT [OrderID], [CustomerID], [OrderDate], [ShipName], [Freight] FROM [Orders] WHERE ([CustomerID] = ?)"
				UpdateCommand="UPDATE [Orders] SET [CustomerID] = ?, [OrderDate] = ?, [ShipName] = ?, [Freight] = ? WHERE [OrderID] = ?">
				<DeleteParameters>
					<asp:Parameter Name="OrderID" Type="Int32" />
				</DeleteParameters>
				<UpdateParameters>
					<asp:Parameter Name="CustomerID" Type="String" />
					<asp:Parameter Name="OrderDate" Type="DateTime" />
					<asp:Parameter Name="ShipName" Type="String" />
					<asp:Parameter Name="Freight" Type="Decimal" />
					<asp:Parameter Name="OrderID" Type="Int32" />
				</UpdateParameters>
				<InsertParameters>
					<asp:Parameter Name="OrderID" Type="Int32" />
					<asp:Parameter Name="CustomerID" Type="String" />
					<asp:Parameter Name="OrderDate" Type="DateTime" />
					<asp:Parameter Name="ShipName" Type="String" />
					<asp:Parameter Name="Freight" Type="Decimal" />
				</InsertParameters>
				<SelectParameters>
					<asp:SessionParameter DefaultValue="ANTON" Name="CustomerID" SessionField="CustomerID" Type="String" />
				</SelectParameters>
			</asp:AccessDataSource>
		</div>
	</form>
</body>
</html>
