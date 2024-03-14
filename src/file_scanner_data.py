# Tester å lage en scanner til å undersøke tekstfilen.
# Henter filen:
gamle_scene = "./files needed/gamle-scene.txt"
hovedscenen = "./files needed/gamle-scene.txt"

def scann_scene(scene):
    with open(scene, "r") as fil_read:
        data = [line.strip() for line in fil_read.readlines()]
    return data

def make_scene_data():
    return      
        
        
        
# Debugging
print(scann_scene(gamle_scene))