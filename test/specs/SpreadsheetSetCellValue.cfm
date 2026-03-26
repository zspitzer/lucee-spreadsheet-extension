<cfscript>
describe( "SpreadsheetSetCellValue", ()=>{

	beforeEach( ()=>{
		variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
	})
	
  it( "Sets the specified cell to the specified value", ()=>{
		var value = "test"
		workbooks.Each( ( type, wb )=>{
			SpreadsheetSetCellValue( wb, value, 1, 1 )
			var actual = s.getCellValue( wb, 1, 1 )
			expect( actual ).toBe( value )
		})
	})

})
</cfscript>