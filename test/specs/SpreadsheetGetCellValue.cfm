<cfscript>
describe( "SpreadsheetGetCellValue", ()=>{

	beforeEach( ()=>{
		variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
	})

  it( "Sets the specified cell to the specified value", ()=>{
		var data =  [ [ "a", "b" ], [ "c", "d" ] ]
		workbooks.Each( ( type, wb )=>{
			s.addRows( wb, data )
			expect( SpreadsheetGetCellValue( wb, 2, 2 ) ).toBe( "d" )
		})
	})

})
</cfscript>