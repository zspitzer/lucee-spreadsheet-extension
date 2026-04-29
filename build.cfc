component{

	variables.artifactId = '"spreadsheet-extension"'
	variables.description = '"Spreadsheet Extension for Lucee"'
	variables.id = '"037A27FF-0B80-4CBA-B954BEBD790B460E"'
	variables.luceeCoreVersion = '"6.2.0.300"'
	variables.name = '"Spreadsheet Extension"'
	variables.version = '"5.5.1.0"' // first 3 octets track bundled POI version; 4th is our patch level
	

	void function run(){
		generateManifest()
		generateLexFile()
		cleanUp()
	}

	private void function generateLexFile(){
		zip action="zip" source="extension/" file="spreadsheet-extension.lex" overwrite="true";
	}

	private void function generateManifest(){
		var contents = [ "Manifest-Version: 1.0" ]
		contents.Append( "Built-Date: " & Now().DateTimeFormat( "yyyy-mm-dd HH:nn:ss" ) )
		contents.Append( "version: " & variables.version )
		contents.Append( "id: " & variables.id )
		contents.Append( "artifactId: " & variables.artifactId )
		contents.Append( "name: " & variables.name )
		contents.Append( "description: " & variables.description )
		contents.Append( "lucee-core-version: " & variables.luceeCoreVersion )
		contents.Append( "release-type: server" )
		contents.Append( "start-bundles: false" )
		cleanUp()
		DirectoryCreate( "extension/META-INF/" )
		FileWrite( "extension/META-INF/MANIFEST.MF", contents.ToList( NewLine() ) & NewLine() )
		FileCopy( "images/logo.png", "extension/META-INF/logo.png" )
	}

	private void function cleanUp(){
		if( DirectoryExists( "extension/META-INF/" ) )
			DirectoryDelete( "extension/META-INF/", true )
	}


}