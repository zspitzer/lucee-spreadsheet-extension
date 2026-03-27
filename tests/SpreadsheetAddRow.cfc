component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "SpreadsheetAddRow", ()=>{

			beforeEach( ()=>{
				variables.data = "a,b"
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "Appends a row with the minimum arguments", ()=>{
				workbooks.Each( ( type, wb )=>{
					SpreadsheetAddRow( wb, data )
					SpreadsheetAddRow( wb, "c,d" )
					var expected = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "a", "b" ], [ "c", "d" ] ] )
					var actual = s.getSheetHelper().sheetToQuery( wb )
					expect( actual ).toBe( expected )
				})
			})

			it( "Appends a row including commas with a custom delimiter", ()=>{
				workbooks.Each( ( type, wb )=>{
					SpreadsheetAddRow( spreadsheet=wb, data="a,b|c,d", delimiter="|" )
					var expected = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "a,b", "c,d" ] ] )
					var actual = s.getSheetHelper().sheetToQuery( wb )
					expect( actual ).toBe( expected )
				})
			})

			it( "Inserts a row at a specifed position", ()=>{
				var expected = QueryNew( "column1,column2,column3", "VarChar,VarChar,VarChar", [ [ "a", "b", "" ], [ "c", "d", "" ], [ "", "e", "f" ] ] )
				workbooks.Each( ( type, wb )=>{
					SpreadsheetAddRow( wb, data )
					SpreadsheetAddRow( wb, "e,f", 2, 2 )
					SpreadsheetAddRow( wb, "c,d", 2, 1 )
					var actual = s.getSheetHelper().sheetToQuery( workbook=wb, includeBlankRows=true )
					expect( actual ).toBe( expected )
				})
			})

			it( "Replaces a row if insert is false", ()=>{
				var expected = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "a", "b" ] ] )
				workbooks.Each( ( type, wb )=>{
					SpreadsheetAddRow( wb, data )
					SpreadsheetAddRow( spreadsheet=wb, data=data, row=1, insert=false )
					var actual = s.getSheetHelper().sheetToQuery( wb )
					expect( actual ).toBe( expected )
				})
			})

		})

	}

}
