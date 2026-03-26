<cfscript>
describe( "SpreadsheetShiftRows", ()=>{

	beforeEach( ()=>{
		variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
		variables.rowData = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "a", "b" ], [ "c", "d" ] ] )
	})

	it( "Shifts rows down if offset is positive", ()=>{
		workbooks.Each( ( type, wb )=>{
			s.addRows( wb, rowData )
			SpreadsheetShiftRows( wb, 1, 1, 1 )
			var expected = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "", "" ], [ "a", "b" ] ] )
			var actual = s.getSheetHelper().sheetToQuery( workbook=wb, includeBlankRows=true )
			expect( actual ).toBe( expected )
		})
	})

	it( "Shifts rows up if offset is negative", ()=>{
		workbooks.Each( ( type, wb )=>{
			s.addRows( wb, rowData )
			SpreadsheetShiftRows( wb, 2, 2, -1 )
			var expected = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "c", "d" ] ] )
			var actual = s.getSheetHelper().sheetToQuery( wb )
			expect( actual ).toBe( expected )
		})
	})

})	
</cfscript>