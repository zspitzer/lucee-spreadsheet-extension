<cfscript>
describe( "SpreadsheetCreateSheet", ()=>{

	beforeEach( ()=>{
		variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
	})

	it( "Creates a new sheet with a unique name if name not specified", ()=>{
		workbooks.Each( ( type, wb )=>{
			SpreadsheetCreateSheet( wb )
			expect( wb.getNumberOfSheets() ).toBe( 2 )
		})
	})

	it( "Creates a new sheet with the specified name", ()=>{
		workbooks.Each( ( type, wb )=>{
			SpreadsheetCreateSheet( wb, "test" )
			expect( s.getSheetHelper().sheetExists( workbook=wb, sheetName="test" ) ).toBeTrue()
		})
	})

})	
</cfscript>