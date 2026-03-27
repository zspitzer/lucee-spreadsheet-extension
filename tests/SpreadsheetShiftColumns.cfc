component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

	function run( testResults, testBox ){

		describe( "SpreadsheetShiftColumns", ()=>{

			beforeEach( ()=>{
				var data = QueryNew( "column1,column2,column3", "VarChar,VarChar,VarChar", [ [ "a", "c", "e" ], [ "b", "d", "f" ] ] )
				var xls = s.workbookFromQuery( data, false )
				var xlsx = s.workbookFromQuery( xmlFormat=true, data=data, addHeaderRow=false )
				variables.workbooks = { xls: xls, xlsx: xlsx }
			})

			it( "Shifts columns right if offset is positive", ()=>{
				workbooks.Each( ( type, wb )=>{
					SpreadsheetShiftColumns( wb, 1, 2, 1 )
					var expected = querySim( "column1,column2,column3
						|a|c
						|b|d
					")
					var actual = s.getSheetHelper().sheetToQuery( workbook=wb, includeBlankRows=true )
					expect( actual ).toBe( expected )
				})
			})

			it( "Shifts columns left if offset is negative", ()=>{
				workbooks.Each( ( type, wb )=>{
					s.addColumn( wb, "g,h" )
					SpreadsheetShiftColumns( wb, 2, 3, -1 )
					var expected = querySim( "column1,column2,column3,column4
						c|e||g
						d|f||h")
					var actual = s.getSheetHelper().sheetToQuery( workbook=wb, includeBlankRows=true )
					expect( actual ).toBe( expected )
				})
			})

		})

	}

}
