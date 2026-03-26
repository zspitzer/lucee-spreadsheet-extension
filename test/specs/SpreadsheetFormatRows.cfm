<cfscript>
describe( "SpreadsheetFormatRows", ()=>{

	beforeEach( ()=>{
		s.clearCellStyleCache()
		variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
		workbooks.Each( ( type, wb )=>{
			s.addRows( wb, [ [ "a1", "b1" ], [ "a2", "b2" ] ] )
		})
	})

	it( "can preserve the existing format properties other than the one(s) being changed", ()=>{
		workbooks.Each( ( type, wb )=>{
			SpreadsheetFormatRows( wb, {  italic: true }, "1-2" )
			expect( s.getCellFormat( wb, 1, 1 ).italic ).toBeTrue()
		})
	})

})	
</cfscript>