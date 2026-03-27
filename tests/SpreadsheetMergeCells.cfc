component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "SpreadsheetMergeCells", ()=>{

			it( "Merges specified cells", ()=>{
				var data = querySim(
					"column1,column2
					a|b
					c|d")
				var xls = s.workbookFromQuery( data, false )
				var xlsx = s.workbookFromQuery( data=data, addHeaderRow=false, xmlFormat=true )
				variables.workbooks = { xls: xls, xlsx: xlsx }
				workbooks.Each( ( type, wb )=>{
					SpreadsheetMergeCells( wb, 1, 2, 1, 2 )
					expect( s.getCellValue( wb, 1, 1 ) ).toBe( "a" )
					expect( s.getCellValue( wb, 1, 2 ) ).toBe( "b" )
					expect( s.getCellValue( wb, 2, 1 ) ).toBe( "c" )
					expect( s.getCellValue( wb, 2, 2 ) ).toBe( "d" )
				})
			})

		})

	}

}
