<cfscript>
describe( "SpreadsheetFormatColumns", ()=>{

	beforeEach( ()=>{
		s.clearCellStyleCache()
		variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
		workbooks.Each( ( type, wb )=>{
			s.addRows( wb, [ [ "a1", "b1" ], [ "a2", "b2" ] ] )
		})
	})

	it( "can format the cells in a column range", ()=>{
		workbooks.Each( ( type, wb )=>{
			SpreadsheetFormatColumns( wb, { italic: true }, "1-2" )
			expect( s.getCellFormat( wb, 1, 1 ).italic ).toBeTrue()
		})
	})

})	
</cfscript>