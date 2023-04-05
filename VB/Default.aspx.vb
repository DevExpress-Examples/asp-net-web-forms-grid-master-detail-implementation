Imports DevExpress.Web
Imports System

Partial Public Class _Default
	Inherits System.Web.UI.Page

	Protected Sub detailGrid_BeforePerformDataSelect(ByVal sender As Object, ByVal e As EventArgs)
		Session("CustomerID") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
	End Sub

	Protected Sub Grid_RowDeleting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataDeletingEventArgs)
		' Database editing is not allowed in online examples
		e.Cancel = True
	End Sub

	Protected Sub Grid_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
		' Database editing is not allowed in online examples
		e.Cancel = True
	End Sub

	Protected Sub Grid_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
		' Database editing is not allowed in online examples
		e.Cancel = True
	End Sub
End Class