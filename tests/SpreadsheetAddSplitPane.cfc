component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "SpreadsheetAddSplitPane", ()=>{

			it( "Splits a worksheet into 4 separate panes", ()=>{
				var data = QueryNew( "Header1,Header2,Header3", "VarChar,VarChar,Varchar", [ [ "a", "b", "c" ], [ "d", "e", "f" ], [ "g", "h", "i" ] ] )
				var workbooks = { xls: s.workbookFromQuery( data ), xlsx: s.workbookFromQuery( data=data, xmlformat=true ) }
				workbooks.Each( ( type, wb )=>{
					var sheet = s.getSheetHelper().getActiveSheet( wb )
					expect( sheet.getPaneInformation() ).toBeNull()
					SpreadsheetAddSplitPane( wb, 1000, 2000, 3, 2 )
					expect( sheet.getPaneInformation().isFreezePane() ).toBeFalse()
					expect( sheet.getPaneInformation().getVerticalSplitPosition() ).toBe( 1000 )
					expect( sheet.getPaneInformation().getHorizontalSplitPosition() ).toBe( 2000 )
					expect( sheet.getPaneInformation().getVerticalSplitLeftColumn() ).toBe( 3 )
					expect( sheet.getPaneInformation().getHorizontalSplitTopRow() ).toBe( 2 )
				})
			})

		})

	}

}
