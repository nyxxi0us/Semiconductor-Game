extends Node2D
@onready var select_grid: GridContainer = $MarginContainer/VBoxContainer/SelectGrid
@onready var grid: GridContainer = $MarginContainer/VBoxContainer/Grid


const GRID_SIZE = 9
var game_grid = []
var solved = false
var selected_button:Vector2i = Vector2i(-1,-1)
var grid_selected:Button = null
var colors:Dictionary = {"0":Color.BLACK, "1":Color.DARK_RED, "2":Color.DEEP_PINK, "3":Color.GOLD, "4":Color.WEB_GREEN, "5":Color.PURPLE, "6":Color.AQUA, "7":Color.HOT_PINK, "8":Color.SILVER, "9":Color.YELLOW}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bind_select_grid_button_actions()
	init_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func init_game():
	grid.columns = GRID_SIZE
	for button:Button in select_grid.get_children():
		button.modulate = colors.get(button.text)
	_populate_grid()

func _populate_grid():
	game_grid = []
	for i in range(GRID_SIZE):
		var row = []
		for j in range(GRID_SIZE):
			row.append(create_button(Vector2i(i,j)))
		game_grid.append(row)

func create_button(pos: Vector2i):
	var button = Button.new()
	button.set("theme_override_font_sizes/font_size", 32)
	button.text = str(randi_range(0,9))
	if button.text == "0":
		button.text = ""
		button.modulate = colors.get("0")
	button.custom_minimum_size = Vector2i(42,50)
	button.pressed.connect(_on_grid_button_pressed.bind(pos))
	grid.add_child(button)
	return button

func _on_grid_button_pressed(pos:Vector2i):
	if grid_selected:
		grid_selected.self_modulate =Color.WHITE
	selected_button = pos
	grid_selected = game_grid[selected_button[0]][selected_button[1]]
	grid_selected.self_modulate = Color.GREEN

func _on_select_grid_button_pressed(number_pressed):
	if selected_button != Vector2i(-1,-1):
		if number_pressed == grid_selected.text:
			grid_selected.modulate = colors.get(grid_selected.text)
			grid_selected.modulate.v *=1.5
			grid_selected.text = ""
			check_solution()
	selected_button = Vector2i(-1,-1)
	if grid_selected:
		grid_selected.self_modulate =Color.WHITE

func check_solution():
	if !solved:
		solved = true
		for i in range(GRID_SIZE):
			for j in range(GRID_SIZE):
				if game_grid[i][j].text != "":
					solved = false
	if solved:
		display_win_screen()

func display_win_screen():
	pass

func bind_select_grid_button_actions():
	for button:Button in select_grid.get_children():
		button.pressed.connect(_on_select_grid_button_pressed.bind(button.text))
		
