component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "SpreadsheetDeleteColumns", ()=>{

			beforeEach( ()=>{
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "Deletes the data in a specified range of columns", ()=>{
				var expected = querySim("column1,column2,column3,column4,column5
					||e||i
					||f||j")
				workbooks.Each( ( type, wb )=>{
					s.addColumn( wb, "a,b" )
						.addColumn( wb, "c,d" )
						.addColumn( wb, "e,f" )
						.addColumn( wb, "g,h" )
						.addColumn( wb, "i,j" )
					SpreadsheetDeleteColumns( wb, "1-2,4" )
					var actual = s.getSheetHelper().sheetToQuery( workbook=wb, includeBlankRows=true )
					expect( actual ).toBe( expected )
				})
			})

		})

	}

}
