extends Node2D

#Blow or wash away the burnt edges of the wafer left by the laser, make sure its sparkly clean!

@onready var etching_nozzle = 

func _ready():
    # Initialize the minigame
    etching_nozzle.position = Vector2(200, 200)  # Starting position of the etching nozzle
    dust_particles_emitter.emitting = false  # Start with dust particles not emitting
    etching_ray.visible = false  # Start with the etching ray not visible

func _process(delta):
    # Update the position of the etching nozzle based on player input (e.g., mouse movement)
    var mouse_position = get_viewport().get_mouse_position()
    etching_nozzle.position = mouse_position

func etch_area():
    # Logic to handle the etching process
    if etching_ray.visible:
        # Check for collision with the wafer and remove burnt edges
        var collision = dust_boundary.get_rect().intersects(etching_ray.get_rect())
        if collision:
            # Remove burnt edges logic here
            print("Etching in progress, removing burnt edges...")
            # You can add more detailed logic for removing burnt edges and updating 
            # the game state
            etching_timer.start()
        



func _input(event):
    # Handle input events for activating the etching ray
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT and event.pressed:
            _on_etching_ray_activated()
        elif event.button_index == BUTTON_LEFT and not event.pressed:
            _on_etching_ray_deactivated()

func _on_etching_ray_activated():
    # Logic to activate the etching ray
    etching_ray.visible = true
    dust_particles_emitter.emitting = true  # Start emitting dust particles

func _on_etching_ray_deactivated():
    # Logic to deactivate the etching ray
    etching_ray.visible = false
    dust_particles_emitter.emitting = false  # Stop emitting dust particles 