component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

	function run( testResults, testBox ){

		describe( "SpreadsheetDeleteRow", ()=>{

			beforeEach( ()=>{
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "Deletes the data in a specified row", ()=>{
				var expected = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "", "" ], [ "c", "d" ] ] )
				workbooks.Each( ( type, wb )=>{
					s.addRow( wb, "a,b" )
						.addRow( wb, "c,d" )
					SpreadsheetDeleteRow( wb, 1 )
					var actual = s.getSheetHelper().sheetToQuery( workbook=wb, includeBlankRows=true )
					expect( actual ).toBe( expected )
				})
			})

		})

	}

}
