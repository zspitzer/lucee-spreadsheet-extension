<cfscript>
describe( "SpreadsheetSetActiveSheetNumber", ()=>{

	beforeEach( ()=>{
		variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
	})

	it( "Sets the specified sheet name to be active", ()=>{
		workbooks.Each( ( type, wb )=>{
			s.createSheet( wb, "test" )
			SpreadsheetSetActiveSheetNumber( wb, 2 );
			expect( s.getSheetHelper().getActiveSheetName( wb ) ).toBe( "test" );
		})
	})

})	
</cfscript>