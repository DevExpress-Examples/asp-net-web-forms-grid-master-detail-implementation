using DevExpress.Web;
using System;

public partial class _Default : System.Web.UI.Page {
	protected void detailGrid_BeforePerformDataSelect(object sender, EventArgs e) {
		Session["CustomerID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
	}

	protected void Grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e) {
		// Database editing is not allowed in online examples
		e.Cancel = true;
	}

	protected void Grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e) {
		// Database editing is not allowed in online examples
		e.Cancel = true;
	}

	protected void Grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
		// Database editing is not allowed in online examples
		e.Cancel = true;
	}	
}