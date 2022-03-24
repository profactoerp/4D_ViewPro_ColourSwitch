//%attributes = {}
var newLabel1; newLabel2; newLabel3 : Text

$generatedFolder:=Folder:C1567(fk resources folder:K87:11).folder("Generated")
$originalsFolder:=Folder:C1567(fk resources folder:K87:11).folder("Originals")

$css1:=$generatedFolder.file(colors{colors}+"-1.css")
$css2:=$generatedFolder.file(colors{colors}+"-2.css")
$js1:=$generatedFolder.file("gc.spread.sheets.designer.resource.en.14.1.1.min.js")

$script:=$originalsFolder.file("gc.spread.sheets.designer.resource.en.14.1.1.min.js").getText()

If (newLabel1#"")
	$script:=Replace string:C233($script; "4D View Pro File (4VP)"; newLabel1)
End if 

If (newLabel2#"")
	$script:=Replace string:C233($script; "Import 4D View Pro"; newLabel2)
End if 

If (newLabel3#"")
	$script:=Replace string:C233($script; "Export 4D View Pro"; newLabel3)
End if 

$js1.setText($script)

$js2:=$generatedFolder.file(colors{colors}+".js")

$html:=$originalsFolder.file("source.html").getText()
$html:=Replace string:C233($html; "@css1"; Convert path system to POSIX:C1106($css1.platformPath))
$html:=Replace string:C233($html; "@css2"; Convert path system to POSIX:C1106($css2.platformPath))
$html:=Replace string:C233($html; "@js1"; Convert path system to POSIX:C1106($js1.platformPath))
$html:=Replace string:C233($html; "@js2"; Convert path system to POSIX:C1106($js2.platformPath))
WA SET PAGE CONTENT:C1037(*; "ViewProArea"; $html; pageLocation)