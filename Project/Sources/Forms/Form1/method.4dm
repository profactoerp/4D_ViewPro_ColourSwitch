Case of 
	: (Form event code:C388=On Load:K2:1)
		OBJECT SET ENABLED:C1123(*; "Popup Dropdown List"; False:C215)
		
		WA SET PREFERENCE:C1041(*; "ViewProArea"; WA enable contextual menu:K62:6; True:C214)
		WA SET PREFERENCE:C1041(*; "ViewProArea"; WA enable Web inspector:K62:7; True:C214)
		
		ARRAY TEXT:C222(colors; 0)
		APPEND TO ARRAY:C911(colors; "green")
		APPEND TO ARRAY:C911(colors; "red")
		APPEND TO ARRAY:C911(colors; "orange")
		APPEND TO ARRAY:C911(colors; "blue")
		APPEND TO ARRAY:C911(colors; "indigo")
		
		For ($i; 1; Size of array:C274(colors))
			$colorSelected:=colors{$i}
			
			Case of 
				: ($colorSelected="red")
					$colorMain:="hsl(0, 100%, 50%)"
					$colorLight:="hsl(0, 100%, 70%)"
					$colorLighter:="hsl(0, 48%, 68%)"
					$colorLightest:="hsl(0, 48% 89%)"
					$colorDark:="hsl(0, 100%, 40%)"
					
				: ($colorSelected="orange")
					$colorMain:="hsl(39, 100%, 50%)"
					$colorLight:="hsl(39, 100%, 70%)"
					$colorLighter:="hsl(39, 48%, 68%)"
					$colorLightest:="hsl(39, 48% 89%)"
					$colorDark:="hsl(39, 100%, 40%)"
					
				: ($colorSelected="green")
					$colorMain:="hsl(120, 100%, 25%)"
					$colorLight:="hsl(120, 100%, 35%)"
					$colorLighter:="hsl(120, 48%, 68%)"
					$colorLightest:="hsl(120, 48% 89%)"
					$colorDark:="hsl(120, 100%, 20%)"
					
				: ($colorSelected="blue")
					$colorMain:="hsl(240, 100%, 50%)"
					$colorLight:="hsl(240, 100%, 70%)"
					$colorLighter:="hsl(240, 48%, 68%)"
					$colorLightest:="hsl(240, 48% 89%)"
					$colorDark:="hsl(240, 100%, 40%)"
					
				: ($colorSelected="indigo")
					$colorMain:="hsl(275, 100%, 25%)"
					$colorLight:="hsl(275, 100%, 35%)"
					$colorLighter:="hsl(275, 48%, 68%)"
					$colorLightest:="hsl(275, 48% 89%)"
					$colorDark:="hsl(275, 100%, 20%)"
					
			End case 
			
			$originalsFolder:=Folder:C1567(fk resources folder:K87:11).folder("Originals")
			$generatedFolder:=Folder:C1567(fk resources folder:K87:11).folder("Generated")
			
			$originalsFolder.file("gc.spread.sheets.designer.resource.en.14.1.1.min.js").copyTo($generatedFolder; fk overwrite:K87:5)
			
			$generatedFile:=$generatedFolder.file(colors{$i}+"-1.css")
			If (Not:C34($generatedFile.exists))
				$originalFile:=$originalsFolder.file("gc.spread.sheets.excel2013white.14.1.1.css")
				$fileText:=Replace string:C233($originalFile.getText(); "#217346"; $colorMain)
				$fileText:=Replace string:C233($fileText; "#0a6332"; "")
				$generatedFile.setText($fileText)
			End if 
			
			$generatedFile:=$generatedFolder.file(colors{$i}+"-2.css")
			If (Not:C34($generatedFile.exists))
				$originalFile:=$originalsFolder.file("gc.spread.sheets.designer.14.1.1.min.css")
				$fileText:=Replace string:C233($originalFile.getText(); "#217346"; $colorMain)
				$fileText:=Replace string:C233($fileText; "green;"; $colorMain+";")
				$fileText:=Replace string:C233($fileText; "#8DBeA3"; $colorLight)
				$fileText:=Replace string:C233($fileText; "#0A6332"; $colorDark)
				$fileText:=Replace string:C233($fileText; "#9FD587"; $colorLighter)
				$fileText:=Replace string:C233($fileText; "#D4F0E1"; $colorLightest)
				$generatedFile.setText($fileText)
			End if 
			
			$generatedFile:=$generatedFolder.file(colors{$i}+".js")
			If (Not:C34($generatedFile.exists))
				$originalFile:=$originalsFolder.file("gc.spread.sheets.designer.all.14.1.1.min.js")
				$fileText:=Replace string:C233($originalFile.getText(); "green;"; $colorMain+";")
				$generatedFile.setText($fileText)
			End if 
			
		End for 
		
		
End case 
