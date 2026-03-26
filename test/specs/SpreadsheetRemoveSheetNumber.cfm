<cfscript>
describe( "SpreadsheetRemoveSheetNumber", ()=>{

	beforeEach( ()=>{
		variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
	})

	it( "Deletes the sheet number specified", ()=>{
		workbooks.Each( ( type, wb )=>{
			s.createSheet( wb, "test" )
			SpreadsheetRemoveSheetNumber( wb, 2 )
			expect( wb.getNumberOfSheets() ).toBe( 1 )
		})
	})	

})	
</cfscript>