extends Control

@onready var fileDialog = $FileDialog
@onready var textEdit = $Margin/TextEdit
var image: Image = Image.new()
var output: String = ""

func _on_open_button_pressed():
	fileDialog.visible = true

func _on_file_dialog_file_selected(path):
	image.load(path)
	var imageArray = str(image.get_data()).split(", ",true,0)
	for val in imageArray:
		output = output + ("%02x " % int(val))
	textEdit.text = output

func _on_copy_text_pressed():
	var copiedText = textEdit.text
	if copiedText.is_empty():
		$CopyEmptyDialog.visible = true
	else:
		DisplayServer.clipboard_set(copiedText)
		$CopyDialog.visible = true

func _on_info_pressed():
	$InfoDialog.visible = true
