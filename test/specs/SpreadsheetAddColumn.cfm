<cfscript>
describe( "SpreadsheetAddColumn", ()=>{

  beforeEach( ()=>{
		variables.columnData = "a,b"
		variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
	})

	it( "Adds a column with the minimum arguments", ()=>{
		workbooks.Each( ( type, wb )=>{
		  SpreadsheetAddColumn( wb, columnData )
      var expected = QueryNew( "column1", "VarChar", [ [ "a" ], [ "b" ] ] )
			var actual = s.getSheetHelper().sheetToQuery( wb )
			expect( actual ).toBe( expected )
		})
	})

  it( "Adds a column at a given start row", ()=>{
		workbooks.Each( ( type, wb )=>{
		  SpreadsheetAddColumn( spreadsheet=wb, data=columnData, startRow=2 )
			var expected = QueryNew( "column1", "VarChar", [ [ "" ], [ "a" ], [ "b" ] ] )
			var actual = s.getSheetHelper().sheetToQuery( workbook=wb, includeBlankRows=true )
			expect( actual ).toBe( expected )
		})
	})

	it( "Adds a column at a given column number", ()=>{
		workbooks.Each( ( type, wb )=>{
			SpreadsheetAddColumn( spreadsheet=wb, data=columnData, startColumn=2 )
			var expected = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "", "a" ], [ "", "b" ] ] )
			var actual = s.getSheetHelper().sheetToQuery( workbook=wb, includeBlankRows=true )
			expect( actual ).toBe( expected )
		})
	})

	it( "Adds a column including commas with a custom delimiter", ()=>{
		workbooks.Each( ( type, wb )=>{
			var columnData = "a,b|c,d"
			SpreadsheetAddColumn( spreadsheet=wb, data=columnData, delimiter="|" )
			var expected = QueryNew( "column1", "VarChar", [ [ "a,b" ], [ "c,d" ] ] )
			var actual = s.getSheetHelper().sheetToQuery( wb )
			expect( actual ).toBe( expected )
		})
	})

	it( "Shifts columns to the right if startColumn is specified and column already exists and 'insert=true'", ()=>{
		workbooks.Each( ( type, wb )=>{
			SpreadsheetAddColumn( wb, "a,b" )
			SpreadsheetAddColumn( wb, "c,d" )
			SpreadsheetAddColumn( wb, "e,f" )
			SpreadsheetAddColumn( spreadsheet=wb, data="x,y", startColumn=2, insert=true )
			var expected = querySim( "column1,column2,column3,column4
				a|x|c|e
				b|y|d|f
			")
			var actual = s.getSheetHelper().sheetToQuery( wb )
			expect( actual ).toBe( expected )
		})
	})

})	
</cfscript>